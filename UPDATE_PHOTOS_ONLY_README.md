# Update Artist Photos Only - SQL Script

## Overview
This SQL script provides **UPDATE statements with ONLY the Photo field** for artists.

**Important:** 
- ✅ **ONLY PICTURES/PHOTOS** are updated
- ❌ **NO Biography** field
- ❌ **NO Wiki** field
- ❌ **NO other data** - just pictures!

## File Details
- **File:** `update_artist_photos_only.sql`
- **Total Artists:** 2,325 artists with photo URLs
- **Generated From:** `insert_artist_photos_only.sql`
- **Format:** SQL Server compatible UPDATE statements

## What's Included
Each UPDATE statement contains:
- `[ArtistId]` - The unique artist identifier to match existing records
- `[Photo]` - The artist's photo URL (Spotify CDN links)

## How to Use

### Option 1: Execute in SQL Server Management Studio (SSMS)
1. Open SQL Server Management Studio
2. Connect to your database server
3. Open the file: `update_artist_photos_only.sql`
4. Ensure you're connected to the correct database (`TemplateJwtProjectDb` or your database name)
5. Execute the script (F5 or click Execute)

### Option 2: Execute via Command Line
```bash
sqlcmd -S your_server_name -d TemplateJwtProjectDb -i update_artist_photos_only.sql
```

### Option 3: Modify Database Name
If you're using a different database name:
1. Open `update_artist_photos_only.sql`
2. Change line 1: `USE [TemplateJwtProjectDb]` to `USE [YourDatabaseName]`
3. Execute the script

## Features

### Transaction Support
- All updates are wrapped in a transaction
- If any update fails, all changes are rolled back
- Use `COMMIT TRANSACTION` to save changes

### Safe Updates
- The script uses UPDATE statements that only modify existing records
- No new records are created
- Artists that don't exist in the database are simply skipped

### Verification Queries
The script includes built-in verification queries:
1. **Count Query:** Shows total number of artists with photos
2. **Sample Query:** Displays first 10 artists with photos

## Example Output
```sql
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/b040846ceba13c3e9c125d68389491094e7f2982' WHERE [ArtistId] = 1;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5eb0767e116a2307495e37cd7fb' WHERE [ArtistId] = 2;
```

## Important Notes

⚠️ **Before Running:**
- Ensure the `[Artist]` table exists in your database
- Ensure the `[Photo]` column exists and accepts NVARCHAR data
- Back up your database before running the script

⚠️ **Artist IDs:**
- The script updates artists with IDs 1-2364
- Only existing artists will be updated
- Non-existent artists are safely ignored

## Advantages of UPDATE vs INSERT

✅ **Use UPDATE when:**
- Artists already exist in your database
- You only want to update the photo field
- You want to preserve other existing data (biography, wiki, etc.)
- You don't want to deal with primary key conflicts

❌ **Don't use UPDATE if:**
- Artists don't exist yet (use INSERT instead)
- You're setting up a new database (use INSERT instead)

## Troubleshooting

### No Rows Updated
- If the update returns "0 rows affected", the ArtistId doesn't exist
- Verify your Artist table contains the expected records
- Check that you're connected to the correct database

### Error: "Invalid column name 'Photo'"
- Ensure your Artist table has a Photo column
- Check the column name matches (case-sensitive in some configurations)

### Transaction Not Committed
- The script uses explicit transactions
- Changes are only saved when COMMIT TRANSACTION executes
- If there's an error, changes are rolled back automatically

## Related Files
- `insert_artist_photos_only.sql` - INSERT version (for new records)
- `update_artist_photos.sql` - UPDATE version with more data
- `insert_all_artists_with_biographies.sql` - Full INSERT with biographies
- `update_artist_biography_photo.sql` - Template for custom updates

## Statistics
- Total Artists with Photos: **2,325**
- Artists without Photos: **39**
- Photo URL Format: Spotify CDN (i.scdn.co)

## Need More Information?
- For new inserts: Use `insert_artist_photos_only.sql`
- For biographies: Use `insert_all_artists_with_biographies.sql`
- For custom queries: See `update_artist_biography_photo.sql`
