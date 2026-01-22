-- ============================================
-- SQL Query to Update 10cc Artist Information
-- ============================================
-- This script updates the Biography and Photo fields for the artist 10cc

USE [TemplateJwtProjectDb]
GO

-- Update 10cc with biographical information and photo
UPDATE [dbo].[Artist]
SET 
    [Biography] = N'10cc is an English rock band formed in Stockport in 1972. The band initially consisted of four musicians - Graham Gouldman, Eric Stewart, Kevin Godley, and Lol Creme - who had written and recorded together since 1968. The group is known for their pop rock hits and sophisticated studio production. Their biggest hits include "I''m Not in Love" (1975), "Dreadlock Holiday" (1978), and "The Things We Do for Love" (1976). The band''s name comes from the average amount of ejaculate in a single male orgasm, though they often gave alternative explanations. 10cc achieved international success in the 1970s and early 1980s with their distinctive blend of art rock, pop, and humor.',
    [Photo] = N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/10cc_TopPop_1974.png/640px-10cc_TopPop_1974.png'
WHERE [ArtistId] = 33;
GO

-- Verify the update
SELECT 
    [ArtistId],
    [Name],
    [Biography],
    [Photo]
FROM [dbo].[Artist]
WHERE [ArtistId] = 33;
GO
