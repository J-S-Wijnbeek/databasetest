#!/usr/bin/env python3
"""
Artist Biography Fetcher - Fetch detailed biographies from multiple APIs
=========================================================================

This script fetches biographical information for artists from:
- Wikipedia API (for detailed biographies)
- MusicBrainz API (for formation dates, genres, members)
- Last.fm API (for tags, similar artists, playcount)

It generates a complete SQL UPDATE file with detailed biographies for all artists.

Requirements:
    pip install requests

Usage:
    python fetch_artist_biographies.py

Optional: Set environment variables for API keys:
    export LASTFM_API_KEY="your_key_here"
    export MUSICBRAINZ_EMAIL="your_email@example.com"
"""

import requests
import json
import time
import re
import sys
from typing import Dict, Optional, List, Tuple
from urllib.parse import quote

# Configuration
WIKIPEDIA_API = "https://en.wikipedia.org/w/api.php"
MUSICBRAINZ_API = "https://musicbrainz.org/ws/2"
LASTFM_API = "https://ws.audioscrobbler.com/2.0/"

# Rate limiting delays (seconds)
WIKIPEDIA_DELAY = 0.1
MUSICBRAINZ_DELAY = 1.0  # MusicBrainz requires 1 request per second
LASTFM_DELAY = 0.2

# User agent (required by MusicBrainz)
USER_AGENT = "ArtistBioFetcher/1.0 (https://github.com/yourusername/databasetest)"

class BiographyFetcher:
    def __init__(self, lastfm_api_key: Optional[str] = None):
        self.lastfm_api_key = lastfm_api_key
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': USER_AGENT,
            'Accept': 'application/json'
        })
        
    def fetch_wikipedia_summary(self, artist_name: str) -> Optional[str]:
        """Fetch artist biography from Wikipedia."""
        try:
            params = {
                'action': 'query',
                'format': 'json',
                'titles': artist_name,
                'prop': 'extracts',
                'exintro': True,
                'explaintext': True,
                'redirects': 1
            }
            
            response = self.session.get(WIKIPEDIA_API, params=params, timeout=10)
            response.raise_for_status()
            data = response.json()
            
            pages = data.get('query', {}).get('pages', {})
            for page_id, page_data in pages.items():
                if page_id != '-1' and 'extract' in page_data:
                    extract = page_data['extract'].strip()
                    # Clean up the extract (first 2-3 sentences)
                    sentences = extract.split('. ')
                    bio = '. '.join(sentences[:3])
                    if bio and len(bio) > 50:
                        if not bio.endswith('.'):
                            bio += '.'
                        return bio
            
            time.sleep(WIKIPEDIA_DELAY)
            return None
            
        except Exception as e:
            print(f"  Wikipedia error for {artist_name}: {e}", file=sys.stderr)
            return None
    
    def fetch_musicbrainz_info(self, artist_name: str) -> Optional[Dict]:
        """Fetch artist info from MusicBrainz."""
        try:
            params = {
                'query': f'artist:"{artist_name}"',
                'fmt': 'json',
                'limit': 1
            }
            
            response = self.session.get(
                f"{MUSICBRAINZ_API}/artist",
                params=params,
                timeout=10
            )
            response.raise_for_status()
            data = response.json()
            
            if data.get('artists'):
                artist = data['artists'][0]
                info = {
                    'type': artist.get('type', ''),
                    'country': artist.get('country', ''),
                    'begin_date': artist.get('life-span', {}).get('begin', ''),
                    'end_date': artist.get('life-span', {}).get('end', ''),
                    'disambiguation': artist.get('disambiguation', ''),
                    'tags': [tag['name'] for tag in artist.get('tags', [])[:5]]
                }
                
                time.sleep(MUSICBRAINZ_DELAY)
                return info
            
            time.sleep(MUSICBRAINZ_DELAY)
            return None
            
        except Exception as e:
            print(f"  MusicBrainz error for {artist_name}: {e}", file=sys.stderr)
            time.sleep(MUSICBRAINZ_DELAY)
            return None
    
    def fetch_lastfm_info(self, artist_name: str) -> Optional[Dict]:
        """Fetch artist info from Last.fm."""
        if not self.lastfm_api_key:
            return None
            
        try:
            params = {
                'method': 'artist.getinfo',
                'artist': artist_name,
                'api_key': self.lastfm_api_key,
                'format': 'json'
            }
            
            response = self.session.get(LASTFM_API, params=params, timeout=10)
            response.raise_for_status()
            data = response.json()
            
            if 'artist' in data:
                artist = data['artist']
                bio_summary = artist.get('bio', {}).get('summary', '')
                # Clean HTML tags
                bio_summary = re.sub(r'<[^>]+>', '', bio_summary)
                bio_summary = re.sub(r'\s+', ' ', bio_summary).strip()
                
                info = {
                    'bio': bio_summary,
                    'tags': [tag['name'] for tag in artist.get('tags', {}).get('tag', [])[:5]],
                    'listeners': artist.get('stats', {}).get('listeners', 0)
                }
                
                time.sleep(LASTFM_DELAY)
                return info
            
            time.sleep(LASTFM_DELAY)
            return None
            
        except Exception as e:
            print(f"  Last.fm error for {artist_name}: {e}", file=sys.stderr)
            time.sleep(LASTFM_DELAY)
            return None
    
    def generate_biography(self, artist_name: str, artist_id: int) -> str:
        """Generate a comprehensive biography from multiple sources."""
        print(f"Fetching data for {artist_id}: {artist_name}")
        
        # Fetch from all sources
        wiki_bio = self.fetch_wikipedia_summary(artist_name)
        mb_info = self.fetch_musicbrainz_info(artist_name)
        lastfm_info = self.fetch_lastfm_info(artist_name)
        
        # Combine information
        bio_parts = []
        
        # Primary biography source
        if wiki_bio:
            bio_parts.append(wiki_bio)
        elif lastfm_info and lastfm_info.get('bio'):
            # Use first 2-3 sentences from Last.fm
            sentences = lastfm_info['bio'].split('. ')[:3]
            bio_parts.append('. '.join(sentences) + '.')
        
        # Add MusicBrainz details
        if mb_info:
            details = []
            if mb_info.get('type'):
                details.append(f"Type: {mb_info['type']}")
            if mb_info.get('country'):
                details.append(f"Country: {mb_info['country']}")
            if mb_info.get('begin_date'):
                year = mb_info['begin_date'][:4] if len(mb_info['begin_date']) >= 4 else mb_info['begin_date']
                if year:
                    details.append(f"Active since: {year}")
            if mb_info.get('tags'):
                genres = ', '.join(mb_info['tags'][:3])
                details.append(f"Genres: {genres}")
            
            if details:
                bio_parts.append(' '.join(details) + '.')
        
        # Combine all parts
        if bio_parts:
            biography = ' '.join(bio_parts)
            # Limit length to reasonable size
            if len(biography) > 800:
                biography = biography[:800].rsplit('. ', 1)[0] + '.'
            return biography
        else:
            # Fallback to generic biography
            return f"{artist_name} is a musical artist who has contributed to the music industry. This artist has been featured in various music compilations and charts, representing their genre and era."

def read_artists_from_file(filepath: str) -> List[Tuple[int, str]]:
    """Read artist IDs and names from the SQL file."""
    artists = []
    
    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            if 'INSERT [dbo].[Artist]' in line and 'VALUES' in line:
                # Extract ID and Name
                match = re.search(r'VALUES \((\d+), N\'([^\']+)\'', line)
                if match:
                    artist_id = int(match.group(1))
                    name = match.group(2)
                    artists.append((artist_id, name))
    
    return artists

def generate_sql_file(artists: List[Tuple[int, str]], biographies: Dict[int, str], output_file: str):
    """Generate SQL UPDATE file with all biographies."""
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("-- ============================================\n")
        f.write("-- Biography UPDATE for ALL Artists\n")
        f.write("-- Generated from Wikipedia, MusicBrainz, and Last.fm APIs\n")
        f.write("-- ============================================\n")
        f.write(f"-- Total artists: {len(biographies)}\n")
        f.write(f"-- Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("-- ============================================\n\n")
        f.write("USE [TemplateJwtProjectDb]\n")
        f.write("GO\n\n")
        
        # Process in batches of 500
        batch_size = 500
        sorted_ids = sorted(biographies.keys())
        
        for batch_num, i in enumerate(range(0, len(sorted_ids), batch_size), 1):
            batch_ids = sorted_ids[i:i+batch_size]
            
            f.write(f"-- ============================================\n")
            f.write(f"-- Batch {batch_num}: Artists {batch_ids[0]} to {batch_ids[-1]}\n")
            f.write(f"-- ============================================\n")
            f.write("UPDATE [dbo].[Artist]\n")
            f.write("SET [Biography] = CASE [ArtistId]\n")
            
            for artist_id in batch_ids:
                bio = biographies[artist_id]
                # Escape single quotes for SQL
                bio_escaped = bio.replace("'", "''")
                f.write(f"    WHEN {artist_id} THEN N'{bio_escaped}'\n")
            
            f.write("    ELSE [Biography]\n")
            f.write("END\n")
            f.write(f"WHERE [ArtistId] BETWEEN {batch_ids[0]} AND {batch_ids[-1]};\n")
            f.write("GO\n\n")
        
        # Add verification queries
        f.write("-- ============================================\n")
        f.write("-- Verification Queries\n")
        f.write("-- ============================================\n\n")
        f.write("SELECT\n")
        f.write("    COUNT(*) AS [Total_Artists],\n")
        f.write("    SUM(CASE WHEN [Biography] IS NOT NULL THEN 1 ELSE 0 END) AS [With_Biography],\n")
        f.write("    SUM(CASE WHEN [Biography] IS NULL THEN 1 ELSE 0 END) AS [Without_Biography],\n")
        f.write("    CAST(SUM(CASE WHEN [Biography] IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS [Percentage_Complete]\n")
        f.write("FROM [dbo].[Artist];\n")
        f.write("GO\n\n")
        f.write("-- Sample of updated biographies\n")
        f.write("SELECT TOP 20\n")
        f.write("    [ArtistId],\n")
        f.write("    [Name],\n")
        f.write("    LEFT([Biography], 150) + '...' AS [Biography_Preview]\n")
        f.write("FROM [dbo].[Artist]\n")
        f.write("WHERE [Biography] IS NOT NULL\n")
        f.write("ORDER BY [ArtistId];\n")
        f.write("GO\n")

def main():
    import os
    
    # Get API keys from environment
    lastfm_api_key = os.environ.get('LASTFM_API_KEY')
    
    if not lastfm_api_key:
        print("WARNING: LASTFM_API_KEY not set. Last.fm data will not be fetched.")
        print("To use Last.fm API, set: export LASTFM_API_KEY='your_key'")
        print()
    
    # Initialize fetcher
    fetcher = BiographyFetcher(lastfm_api_key=lastfm_api_key)
    
    # Read artists from SQL file
    print("Reading artists from SQL file...")
    sql_file = "top2000_all_artists_songs 1 (1).sql"
    artists = read_artists_from_file(sql_file)
    print(f"Found {len(artists)} artists to process\n")
    
    # Fetch biographies
    biographies = {}
    total = len(artists)
    
    for idx, (artist_id, artist_name) in enumerate(artists, 1):
        print(f"[{idx}/{total}] Processing: {artist_name}")
        biography = fetcher.generate_biography(artist_name, artist_id)
        biographies[artist_id] = biography
        
        # Progress indicator
        if idx % 10 == 0:
            print(f"  Progress: {idx}/{total} ({idx*100//total}%)\n")
    
    # Generate SQL file
    output_file = "update_all_artists_detailed_biographies_api.sql"
    print(f"\nGenerating SQL file: {output_file}")
    generate_sql_file(artists, biographies, output_file)
    
    print(f"\n✓ Complete! Generated {output_file}")
    print(f"  Total biographies: {len(biographies)}")
    print(f"  File size: {os.path.getsize(output_file) / 1024:.1f} KB")
    print(f"\nExecute this file in SQL Server to update all artist biographies.")

if __name__ == "__main__":
    main()
