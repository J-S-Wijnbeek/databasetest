# databasetest

This repository contains SQL scripts for managing a music database with artists and songs.

## Files

### Database Files
- **`script 1.sql`** - Main database schema and initial data
- **`top2000_all_artists_songs 1 (1).sql`** - Complete dataset of artists and songs (2,366 unique artists)
- **`top2000_all_entries 1 (1).sql`** - All entries data

### Biography Update Files
- **`update_all_8336_artist_biographies.sql`** - ⭐ Complete UPDATE statements for all 2,366 artists (100 detailed + 2,266 contextual)
- **`update_all_artist_biographies.sql`** - UPDATE statements for top 100 artists only
- **`update_artist_biography_photo.sql`** - SQL query templates with multiple strategies
- **`update_10cc_artist.sql`** - Example UPDATE for single artist (10cc)
- **`insert_all_artists_with_biographies.sql`** - INSERT statements for new databases

### Photo/Picture Files 🖼️ (NEW!)
- **`insert_artist_photos_only.sql`** - ⭐ INSERT statements with ONLY photos (2,325 artists) - NO Biography, NO Wiki
- **`update_artist_photos.sql`** - UPDATE statements for photos only (2,364 artists)
- **`INSERT_PHOTOS_ONLY_README.md`** - Complete guide for using the INSERT photos script

### API Biography Fetcher (NEW!)
- **`fetch_artist_biographies.py`** - 🚀 Python script to fetch detailed biographies from Wikipedia/MusicBrainz/Last.fm APIs
- **`run_biography_fetcher.sh`** - Quick start script for running the biography fetcher
- **`API_BIOGRAPHY_FETCHER_GUIDE.md`** - Complete guide for using the API fetcher

### Documentation
- **`UPDATE_ARTIST_GUIDE.md`** - Detailed guide on how to use the update queries
- **`WHICH_FILE_TO_USE.md`** - Decision guide for choosing the right SQL file
- **`COMPLETE_BIOGRAPHIES_README.md`** - Documentation for the complete biography file

## Quick Start - Artist Biographies

### Option 1: Use Pre-Generated SQL (Fastest)
Execute pre-generated SQL with 100 detailed + 2,266 contextual biographies:

1. Open **`update_all_8336_artist_biographies.sql`** in SQL Server Management Studio
2. Execute against your database
3. ✓ Done! All 2,366 artists will have biographies

### Option 2: Fetch from APIs (Most Detailed) 🌟 RECOMMENDED
Generate detailed biographies for ALL artists using Wikipedia, MusicBrainz, and Last.fm:

```bash
# Quick start
./run_biography_fetcher.sh

# Or manually
pip install requests
python3 fetch_artist_biographies.py
```

This will:
- ✅ Fetch real biographical data from Wikipedia
- ✅ Get artist metadata from MusicBrainz
- ✅ Retrieve tags and info from Last.fm
- ✅ Generate SQL file with detailed biographies for all 2,366 artists
- ⏱️ Takes 60-90 minutes (due to API rate limits)

See [`API_BIOGRAPHY_FETCHER_GUIDE.md`](./API_BIOGRAPHY_FETCHER_GUIDE.md) for complete instructions.

### Option 3: Manual Templates
Use SQL templates to update specific artists:

1. Review **`UPDATE_ARTIST_GUIDE.md`** for detailed instructions
2. Open **`update_artist_biography_photo.sql`** for templates
3. Customize and execute queries

## Quick Start - Artist Photos Only 🖼️

Want to INSERT only pictures/photos without Biography or Wiki data?

1. Open **`insert_artist_photos_only.sql`** in SQL Server Management Studio
2. Execute against your database
3. ✓ Done! 2,325 artists will have photos (NO Biography, NO Wiki - ONLY pictures!)

See [`INSERT_PHOTOS_ONLY_README.md`](./INSERT_PHOTOS_ONLY_README.md) for complete instructions.

## What's Included

- **2,366 unique artists** in database
- **100 detailed biographies** (major artists like Queen, Beatles, Led Zeppelin, etc.)
- **2,266 contextual biographies** (all other artists)
- **2,325 artist photos** (Spotify CDN URLs) - Available as INSERT or UPDATE
- **API fetcher** for generating detailed biographies from external sources
- **Multiple approaches** to suit your needs

## Next Steps

1. Choose your preferred approach (pre-generated SQL or API fetcher)
2. Follow the respective guide
3. Execute SQL against your database
4. Verify results with included verification queries