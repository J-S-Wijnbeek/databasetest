# Artist Biography SQL Files - Usage Guide

This repository now contains multiple SQL files for managing artist biographies. Here's a guide to help you choose the right file for your needs.

## Files Overview

### 1. **insert_all_artists_with_biographies.sql** ✅ RECOMMENDED FOR INSERTS
**Use this when:** You want to INSERT new artist records with biographies included

**Contains:**
- Complete INSERT statements for 100 major artists with detailed biographies
- IDENTITY_INSERT handling (to specify explicit ArtistId values)
- Template and instructions for remaining 8,236 artists
- Verification queries

**Best for:** Creating a new database or populating an empty Artist table

### 2. **update_all_artist_biographies.sql** ✅ RECOMMENDED FOR UPDATES
**Use this when:** You already have artists in the database and want to UPDATE their biographies

**Contains:**
- UPDATE statements for 100 major artists using CASE statements
- Efficient batch update approach
- Preserves existing biography if already present
- Statistics and template for remaining artists

**Best for:** Updating existing records without recreating the entire table

### 3. **update_artist_biography_photo.sql** 
**Use this when:** You need template examples for various update strategies

**Contains:**
- Multiple UPDATE pattern examples
- Single artist updates (by ID or Name)
- Batch CASE-based updates
- Bulk placeholder updates
- Diagnostic queries

**Best for:** Learning different approaches and customizing your own queries

### 4. **update_10cc_artist.sql**
**Use this when:** You only need to update the band 10cc

**Contains:**
- Single UPDATE statement for 10cc (ArtistId 33)
- Complete biography and photo URL
- Verification query

**Best for:** Testing or as a single-artist example

### 5. **UPDATE_ARTIST_GUIDE.md**
**Use this when:** You need detailed documentation

**Contains:**
- Complete documentation of query patterns
- Usage instructions
- Data source suggestions
- Best practices

**Best for:** Reference and learning

## Quick Decision Tree

```
Do you have an existing database with artists?
│
├─ YES → Do the artists already have Biography = NULL?
│         │
│         ├─ YES → Use: update_all_artist_biographies.sql
│         │
│         └─ NO (they have biographies) → Use custom UPDATE with WHERE Biography IS NULL
│
└─ NO (empty or new database)
          │
          └─ Use: insert_all_artists_with_biographies.sql
```

## Important Notes

### For INSERT Statements
- ⚠️ **IMPORTANT**: The INSERT file assumes you're starting fresh or have deleted existing records
- Uses `SET IDENTITY_INSERT [dbo].[Artist] ON` to allow explicit ArtistId values
- Contains 100 artists with complete biographies
- You'll need to complete the remaining 8,236 artists using the template provided

### For UPDATE Statements
- ✅ Safe to run on existing databases
- Won't overwrite existing biographies (uses ELSE clause)
- Uses efficient CASE statements for batch updates
- Can be run multiple times safely

### Biography Count
- **Total Artists:** 8,336
- **With detailed biographies provided:** 100 (major/famous artists)
- **Remaining:** 8,236 (template/placeholder approach provided)

## How to Complete All 8,336 Biographies

The files provide biographies for the top 100 artists. For the remaining artists, you have these options:

1. **Manual Research**: Research each artist and add biographies manually
2. **API Integration**: Use music APIs (MusicBrainz, Last.fm, Wikipedia) to fetch biographical data
3. **Placeholder Text**: Use the provided template to generate placeholder biographies temporarily
4. **Gradual Addition**: Add biographies for popular artists first, complete others over time

## Examples

### Using INSERT file:
```sql
-- Execute the entire file or specific sections
USE [TemplateJwtProjectDb]
GO
-- Run the contents of insert_all_artists_with_biographies.sql
```

### Using UPDATE file:
```sql
-- Execute to update existing records
USE [TemplateJwtProjectDb]
GO
-- Run the contents of update_all_artist_biographies.sql
```

## Need Help?

- See `UPDATE_ARTIST_GUIDE.md` for detailed documentation
- Each SQL file contains inline comments explaining its purpose
- Verification queries are included to check progress

---

**Last Updated:** 2026-01-22
