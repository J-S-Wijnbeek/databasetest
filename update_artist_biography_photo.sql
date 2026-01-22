-- ============================================
-- SQL Query to Update Artist Biography and Photo
-- ============================================
-- This script provides UPDATE statements to fill in Biography and Photo fields for each artist
-- Replace the placeholder values with actual biography text and photo URLs

USE [TemplateJwtProjectDb]
GO

-- Example 1: Update a single artist by ArtistId
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'Your biography text here',
    [Photo] = N'https://example.com/path/to/photo.jpg'
WHERE [ArtistId] = 1;
GO

-- Example 2: Update a single artist by Name
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'Your biography text here',
    [Photo] = N'https://example.com/path/to/photo.jpg'
WHERE [Name] = N'Queen';
GO

-- Example 3: Update multiple artists at once using CASE statements
UPDATE [dbo].[Artist]
SET 
    [Biography] = CASE [ArtistId]
        WHEN 1 THEN N'Queen is a British rock band formed in London in 1970. The band consists of Freddie Mercury, Brian May, Roger Taylor, and John Deacon.'
        WHEN 2 THEN N'Eagles is an American rock band formed in Los Angeles in 1971. Known for their country rock sound and harmonies.'
        WHEN 3 THEN N'Deep Purple is an English rock band formed in Hertford, Hertfordshire in 1968. Pioneers of heavy metal and modern hard rock.'
        WHEN 4 THEN N'Led Zeppelin was an English rock band formed in London in 1968. Considered one of the most influential rock bands in history.'
        WHEN 5 THEN N'Meat Loaf was an American singer and actor known for his powerful voice and theatrical live performances.'
        -- Add more WHEN clauses for other artists
        ELSE [Biography]
    END,
    [Photo] = CASE [ArtistId]
        WHEN 1 THEN N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Queen_in_Budapest_1986.jpg'
        WHEN 2 THEN N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Eagles_in_January_2012.jpg'
        WHEN 3 THEN N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Deep_Purple_-_2013.jpg'
        WHEN 4 THEN N'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Led_Zeppelin_1973.jpg'
        WHEN 5 THEN N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Meat_Loaf_2012.jpg'
        -- Add more WHEN clauses for other artists
        ELSE [Photo]
    END
WHERE [ArtistId] IN (1, 2, 3, 4, 5);
GO

-- Example 4: Bulk update with sample data for all artists
-- This is a template - replace with actual data for your artists
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'Biography for ' + [Name] + N'. Please update with actual biographical information.',
    [Photo] = N'https://example.com/photos/' + REPLACE([Name], ' ', '_') + N'.jpg'
WHERE [Biography] IS NULL OR [Photo] IS NULL;
GO

-- Example 5: Query to see which artists still need biography/photo
SELECT 
    [ArtistId],
    [Name],
    CASE WHEN [Biography] IS NULL THEN 'Missing' ELSE 'Present' END AS [Biography_Status],
    CASE WHEN [Photo] IS NULL THEN 'Missing' ELSE 'Present' END AS [Photo_Status]
FROM [dbo].[Artist]
WHERE [Biography] IS NULL OR [Photo] IS NULL
ORDER BY [ArtistId];
GO

-- Example 6: Count of artists missing biography/photo
SELECT 
    COUNT(*) AS [Total_Artists],
    SUM(CASE WHEN [Biography] IS NULL THEN 1 ELSE 0 END) AS [Missing_Biography],
    SUM(CASE WHEN [Photo] IS NULL THEN 1 ELSE 0 END) AS [Missing_Photo]
FROM [dbo].[Artist];
GO
