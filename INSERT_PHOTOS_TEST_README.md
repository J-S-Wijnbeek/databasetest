# Insert Artist Photos Test File - SQL Script

## Overview
This is a **TEST FILE** with only 2 photo entries for testing purposes.

**Important:** 
- ✅ **ONLY 2 PICTURES/PHOTOS** are included (ArtistId 1 and 2)
- ❌ **NO Biography** field
- ❌ **NO Wiki** field
- ❌ **NO other data** - just 2 pictures for testing!

## File Details
- **File:** `insert_artist_photos_test.sql`
- **Total Artists:** 2 artists with photo URLs
- **Based on:** `insert_artist_photos_only.sql`
- **Format:** SQL Server compatible INSERT statements
- **Purpose:** Quick testing and validation without loading all 2,325 photos

## What's Included
Each INSERT statement contains:
- `[ArtistId]` - The unique artist identifier (1 and 2)
- `[Photo]` - The artist's photo URL (Spotify CDN links)

## How to Use

### Option 1: Execute in SQL Server Management Studio (SSMS)
1. Open SQL Server Management Studio
2. Connect to your database server
3. Open the file: `insert_artist_photos_test.sql`
4. Ensure you're connected to the correct database (`TemplateJwtProjectDb` or your database name)
5. Execute the script (F5 or click Execute)

### Option 2: Execute via Command Line
```bash
sqlcmd -S your_server_name -d TemplateJwtProjectDb -i insert_artist_photos_test.sql
```

### Option 3: Modify Database Name
If you're using a different database name:
1. Open `insert_artist_photos_test.sql`
2. Change line 1: `USE [TemplateJwtProjectDb]` to `USE [YourDatabaseName]`
3. Execute the script

## Features

### Transaction Support
- All inserts are wrapped in a transaction
- If any insert fails, all changes are rolled back
- Transaction is committed explicitly at the end of the script

### Identity Insert
- The script uses `SET IDENTITY_INSERT ON` to specify explicit ArtistId values
- Automatically turns it off at the end

### Verification Queries
The script includes built-in verification queries:
1. **Count Query:** Shows total number of artists with photos
2. **Sample Query:** Displays first 10 artists with photos

## Example Output
```sql
INSERT [dbo].[Artist] ([ArtistId], [Photo]) VALUES (1, N'https://i.scdn.co/image/b040846ceba13c3e9c125d68389491094e7f2982');
INSERT [dbo].[Artist] ([ArtistId], [Photo]) VALUES (2, N'https://i.scdn.co/image/ab6761610000e5eb0767e116a2307495e37cd7fb');
```

## Important Notes

⚠️ **Before Running:**
- Ensure the `[Artist]` table exists in your database
- Ensure the `[Photo]` column exists and accepts NVARCHAR data
- Back up your database before running the script

⚠️ **Artist IDs:**
- The script uses explicit ArtistId values (1 and 2)
- If these IDs already exist, you may get duplicate key errors
- Consider modifying to UPDATE instead if artists already exist

## Use Cases
- **Quick Testing:** Test your database setup without loading thousands of records
- **Development:** Validate INSERT logic before running the full script
- **Demos:** Show the functionality with minimal data
- **CI/CD:** Use in automated tests that don't require full dataset

## Related Files
- `insert_artist_photos_only.sql` - Full version with 2,325 photos
- `update_artist_photos.sql` - UPDATE version (if artists already exist)
- `insert_all_artists_with_biographies.sql` - Full INSERT with biographies
- `INSERT_PHOTOS_ONLY_README.md` - Documentation for the full photo script

## Need the Full Dataset?
Use `insert_artist_photos_only.sql` which contains all 2,325 artist photos.
