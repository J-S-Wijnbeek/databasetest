# API Biography Fetcher - Complete Guide

This guide explains how to use the `fetch_artist_biographies.py` script to generate detailed biographies for all 2,366 artists by fetching data from Wikipedia, MusicBrainz, and Last.fm APIs.

## Overview

The script automatically:
- ✅ Fetches biographical data from Wikipedia API
- ✅ Retrieves artist metadata from MusicBrainz (genres, formation dates, country)
- ✅ Gets additional info from Last.fm (tags, listener counts)
- ✅ Combines data into comprehensive biographies
- ✅ Generates a complete SQL UPDATE file ready to execute

## Prerequisites

### 1. Python 3.6+
Ensure Python is installed:
```bash
python3 --version
```

### 2. Install Required Package
```bash
pip install requests
```

### 3. API Keys (Optional but Recommended)

#### Last.fm API Key (Recommended)
1. Go to https://www.last.fm/api/account/create
2. Create an account and get your API key
3. Set environment variable:
```bash
export LASTFM_API_KEY="your_key_here"
```

#### MusicBrainz (No Key Required)
- MusicBrainz doesn't require an API key
- Please provide a contact email (optional):
```bash
export MUSICBRAINZ_EMAIL="youremail@example.com"
```

## Usage

### Step 1: Navigate to Repository Directory
```bash
cd /path/to/databasetest
```

### Step 2: Run the Script
```bash
python3 fetch_artist_biographies.py
```

### Step 3: Wait for Completion
The script will:
- Process all 2,366 artists one by one
- Display progress updates every 10 artists
- Take approximately 60-90 minutes to complete (due to API rate limiting)
- Generate file: `update_all_artists_detailed_biographies_api.sql`

### Step 4: Execute Generated SQL
Open the generated SQL file in SQL Server Management Studio and execute it against your database.

## What the Script Does

### Data Sources

1. **Wikipedia API**
   - Fetches the introductory paragraph from artist's Wikipedia page
   - Provides 2-3 sentences of biography
   - No API key required
   - Rate limit: 10 requests/second (we use 0.1s delay)

2. **MusicBrainz API**
   - Retrieves artist type (band, person, etc.)
   - Gets formation/birth dates
   - Provides country of origin
   - Fetches genre tags
   - No API key required
   - Rate limit: 1 request/second (strictly enforced)

3. **Last.fm API** (Optional)
   - Gets detailed biography summaries
   - Provides genre tags
   - Shows listener counts
   - Requires free API key
   - Rate limit: 5 requests/second (we use 0.2s delay)

### Biography Generation Process

For each artist, the script:
1. Queries Wikipedia for biographical text
2. Queries MusicBrainz for metadata (type, country, dates, genres)
3. Queries Last.fm for additional biography and tags (if API key provided)
4. Combines information into a comprehensive biography
5. Limits biography length to ~800 characters
6. Falls back to generic text if no data found

### Example Output

**Artist: Queen**
```
Queen is a British rock band formed in London in 1970. 
The band consists of Freddie Mercury (vocals, piano), 
Brian May (guitar, vocals), Roger Taylor (drums, vocals), 
and John Deacon (bass). Known for their theatrical performances 
and genre-spanning music. Type: Group. Country: United Kingdom. 
Active since: 1970. Genres: rock, progressive rock, hard rock.
```

## Generated SQL File

### Structure
```sql
USE [TemplateJwtProjectDb]
GO

-- Batch 1: Artists 1 to 500
UPDATE [dbo].[Artist]
SET [Biography] = CASE [ArtistId]
    WHEN 1 THEN N'Queen is a British rock band...'
    WHEN 2 THEN N'Eagles is an American rock band...'
    -- ... continues for all artists
    ELSE [Biography]
END
WHERE [ArtistId] BETWEEN 1 AND 500;
GO
```

### Features
- ✅ Organized in batches of 500 artists
- ✅ Safe to execute (preserves existing data with ELSE clause)
- ✅ Includes verification queries
- ✅ Production-ready SQL
- ✅ Proper string escaping

## Estimated Time

| Component | Time |
|-----------|------|
| Wikipedia queries | ~4-5 minutes (2,366 × 0.1s) |
| MusicBrainz queries | ~40 minutes (2,366 × 1s) |
| Last.fm queries | ~8-10 minutes (2,366 × 0.2s) |
| Processing & writing | ~2-3 minutes |
| **Total** | **~60-90 minutes** |

## Progress Monitoring

The script provides real-time progress:
```
[1/2366] Processing: Queen
Fetching data for 1: Queen
[2/2366] Processing: Eagles
Fetching data for 2: Eagles
...
[10/2366] Processing: Procol Harum
  Progress: 10/2366 (0%)

[100/2366] Processing: Peter Maffay
  Progress: 100/2366 (4%)
```

## Error Handling

The script handles errors gracefully:
- ❌ API timeouts → Skips to next source
- ❌ Artist not found → Uses fallback generic biography
- ❌ Rate limiting → Respects delays
- ❌ Network issues → Logs error, continues with next artist

## Troubleshooting

### Issue: "requests module not found"
**Solution:**
```bash
pip install requests
```

### Issue: "ConnectionError" or "Timeout"
**Solution:**
- Check your internet connection
- Some APIs might be temporarily unavailable
- The script will continue with available sources

### Issue: "Rate limit exceeded"
**Solution:**
- The script includes built-in delays
- MusicBrainz enforces strict 1 req/sec limit
- Don't modify the delay values

### Issue: Script seems slow
**Expected:**
- This is normal due to API rate limits
- MusicBrainz requires 1 second between requests
- Total time: 60-90 minutes for all 2,366 artists
- You can monitor progress in the console

### Issue: Some biographies are generic
**Reason:**
- Artist not found in APIs (spelling variations, lesser-known artists)
- API returned no data
- Script falls back to generic biography

**Solution:**
- Add Last.fm API key for better coverage
- Manually enhance specific biographies afterward

## Customization

### Fetch Only Specific Artists
Edit the script to filter artists:
```python
# In main() function, after reading artists:
artists = [(id, name) for id, name in artists if id <= 500]  # First 500 only
```

### Adjust Biography Length
Change the limit in `generate_biography()`:
```python
if len(biography) > 1000:  # Change from 800 to 1000
    biography = biography[:1000].rsplit('. ', 1)[0] + '.'
```

### Add More Sources
The script is extensible. You can add more API sources by:
1. Creating a new `fetch_xxx_info()` method
2. Calling it in `generate_biography()`
3. Combining the results

## Output File Details

**Filename:** `update_all_artists_detailed_biographies_api.sql`

**Size:** Approximately 1-2 MB

**Content:**
- Complete UPDATE statements for all 2,366 artists
- Organized in 5 batches
- Verification queries included
- Ready to execute in SQL Server

## Next Steps After Generation

1. **Review** the generated SQL file (spot-check some biographies)
2. **Backup** your database before executing
3. **Execute** the SQL file in SSMS
4. **Verify** using the included verification queries
5. **Check** sample results

## Verification Queries (Included in Output)

```sql
-- Check completion
SELECT
    COUNT(*) AS [Total_Artists],
    SUM(CASE WHEN [Biography] IS NOT NULL THEN 1 ELSE 0 END) AS [With_Biography],
    CAST(SUM(CASE WHEN [Biography] IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS [Percentage_Complete]
FROM [dbo].[Artist];

-- View sample results
SELECT TOP 20
    [ArtistId],
    [Name],
    LEFT([Biography], 150) + '...' AS [Biography_Preview]
FROM [dbo].[Artist]
WHERE [Biography] IS NOT NULL
ORDER BY [ArtistId];
```

## Best Practices

1. ✅ **Run during off-hours** - Takes 60-90 minutes
2. ✅ **Use Last.fm API key** - Better coverage and quality
3. ✅ **Check your internet** - Stable connection required
4. ✅ **Monitor progress** - Watch console output
5. ✅ **Review output** - Spot-check before executing
6. ✅ **Backup database** - Before running SQL updates

## API Rate Limits Summary

| Service | Limit | Script Delay | Requests | Total Time |
|---------|-------|--------------|----------|------------|
| Wikipedia | 200/sec | 0.1s | 2,366 | ~4 min |
| MusicBrainz | 1/sec | 1.0s | 2,366 | ~40 min |
| Last.fm | 5/sec | 0.2s | 2,366 | ~8 min |

## Support

If you encounter issues:
1. Check the error messages in console output
2. Verify your internet connection
3. Ensure Python dependencies are installed
4. Check API keys are set correctly (for Last.fm)

## License & Attribution

This script uses public APIs:
- Wikipedia API: CC BY-SA 3.0
- MusicBrainz API: CC BY-NC-SA 3.0
- Last.fm API: Requires attribution

When using the generated biographies, consider adding attribution:
"Biographical data sourced from Wikipedia, MusicBrainz, and Last.fm"

---

**Script Version:** 1.0  
**Last Updated:** 2026-01-22  
**Author:** Database Test Project
