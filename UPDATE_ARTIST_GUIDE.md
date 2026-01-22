# Update Artist Biography and Photo - SQL Queries

This document provides SQL queries to fill in the `Biography` and `Photo` fields for artists in the database.

## Current Database Structure

The `Artist` table has the following columns:
- `ArtistId` (int, primary key, identity)
- `Name` (nvarchar(max), not null)
- `Wiki` (nvarchar(max), nullable)
- `Biography` (nvarchar(max), nullable)
- `Photo` (nvarchar(max), nullable)

## Available SQL Queries

All queries are provided in the file: **`update_artist_biography_photo.sql`**

### Option 1: Update Individual Artist by ID

```sql
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'Your biography text here',
    [Photo] = N'https://example.com/path/to/photo.jpg'
WHERE [ArtistId] = 1;
```

### Option 2: Update Individual Artist by Name

```sql
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'Your biography text here',
    [Photo] = N'https://example.com/path/to/photo.jpg'
WHERE [Name] = N'Queen';
```

### Option 3: Batch Update Multiple Artists Using CASE

This is the most efficient way to update multiple artists at once:

```sql
UPDATE [dbo].[Artist]
SET 
    [Biography] = CASE [ArtistId]
        WHEN 1 THEN N'Biography for artist 1'
        WHEN 2 THEN N'Biography for artist 2'
        -- Add more cases
        ELSE [Biography]
    END,
    [Photo] = CASE [ArtistId]
        WHEN 1 THEN N'https://example.com/photo1.jpg'
        WHEN 2 THEN N'https://example.com/photo2.jpg'
        -- Add more cases
        ELSE [Photo]
    END
WHERE [ArtistId] IN (1, 2, ...);
```

### Option 4: Bulk Update with Placeholder Data

To quickly fill all NULL values with placeholder data:

```sql
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'Biography for ' + [Name] + N'. Please update with actual biographical information.',
    [Photo] = N'https://example.com/photos/' + REPLACE([Name], ' ', '_') + N'.jpg'
WHERE [Biography] IS NULL OR [Photo] IS NULL;
```

## Helpful Queries

### Check Which Artists Need Updates

```sql
SELECT 
    [ArtistId],
    [Name],
    CASE WHEN [Biography] IS NULL THEN 'Missing' ELSE 'Present' END AS [Biography_Status],
    CASE WHEN [Photo] IS NULL THEN 'Missing' ELSE 'Present' END AS [Photo_Status]
FROM [dbo].[Artist]
WHERE [Biography] IS NULL OR [Photo] IS NULL
ORDER BY [ArtistId];
```

### Count Missing Data

```sql
SELECT 
    COUNT(*) AS [Total_Artists],
    SUM(CASE WHEN [Biography] IS NULL THEN 1 ELSE 0 END) AS [Missing_Biography],
    SUM(CASE WHEN [Photo] IS NULL THEN 1 ELSE 0 END) AS [Missing_Photo]
FROM [dbo].[Artist];
```

## Usage Instructions

1. Open SQL Server Management Studio (SSMS) or your preferred SQL client
2. Connect to your database server
3. Open the `update_artist_biography_photo.sql` file
4. Choose which update method you want to use
5. Replace the placeholder values with actual data
6. Execute the query

## Notes

- All strings should use the `N` prefix for nvarchar columns (e.g., `N'text'`)
- Photo field typically stores URLs to image files
- Biography field can store long text descriptions
- Use single quotes for string values in SQL
- Always test queries on a backup database first

## Example Data Sources

You can gather biography and photo data from:
- Wikipedia API
- MusicBrainz API
- Last.fm API
- Discogs API
- Manual research and entry
