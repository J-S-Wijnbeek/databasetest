# Insert Artist Photos Only - SQL Script

## Overview
This SQL script provides **INSERT statements with ONLY the Photo field** for artists.

**Important:** 
- ✅ **ONLY PICTURES/PHOTOS** are included
- ❌ **NO Biography** field
- ❌ **NO Wiki** field
- ❌ **NO other data** - just pictures!

## File Details
- **File:** `insert_artist_photos_only.sql`
- **Total Artists:** 2,325 artists with photo URLs
- **Generated From:** `update_artist_photos.sql`
- **Format:** SQL Server compatible INSERT statements

## What's Included
Each INSERT statement contains:
- `[ArtistId]` - The unique artist identifier
- `[Photo]` - The artist's photo URL (Spotify CDN links)

## How to Use

### Option 1: Execute in SQL Server Management Studio (SSMS)
1. Open SQL Server Management Studio
2. Connect to your database server
3. Open the file: `insert_artist_photos_only.sql`
4. Ensure you're connected to the correct database (`TemplateJwtProjectDb` or your database name)
5. Execute the script (F5 or click Execute)

### Option 2: Execute via Command Line
```bash
sqlcmd -S your_server_name -d TemplateJwtProjectDb -i insert_artist_photos_only.sql
```

### Option 3: Modify Database Name
If you're using a different database name:
1. Open `insert_artist_photos_only.sql`
2. Change line 1: `USE [TemplateJwtProjectDb]` to `USE [YourDatabaseName]`
3. Execute the script

## Features

### Transaction Support
- All inserts are wrapped in a transaction
- If any insert fails, all changes are rolled back
- Use `COMMIT TRANSACTION` to save changes

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
- The script uses explicit ArtistId values (1-2364)
- If these IDs already exist, you may get duplicate key errors
- Consider modifying to UPDATE instead if artists already exist

## Troubleshooting

### Error: "Cannot insert explicit value for identity column"
- The script handles this with `SET IDENTITY_INSERT ON`
- If you still get this error, ensure you have proper permissions

### Error: "Violation of PRIMARY KEY constraint"
- Artists with these IDs may already exist
- Either delete existing records first, or use UPDATE statements instead

### Error: "Invalid column name 'Photo'"
- Ensure your Artist table has a Photo column
- Check the column name matches (case-sensitive in some configurations)

## Related Files
- `update_artist_photos.sql` - UPDATE version (if artists already exist)
- `insert_all_artists_with_biographies.sql` - Full INSERT with biographies
- `update_artist_biography_photo.sql` - Template for custom updates

## Statistics
- Total Artists with Photos: **2,325**
- Artists without Photos: **39**
- Photo URL Format: Spotify CDN (i.scdn.co)

## Need More Information?
- For biographies: Use `insert_all_artists_with_biographies.sql`
- For updates: Use `update_artist_photos.sql`
- For custom queries: See `update_artist_biography_photo.sql`
