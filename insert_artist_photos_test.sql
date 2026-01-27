USE [TemplateJwtProjectDb]
GO

-- ============================================
-- SQL Script to INSERT Artist Photos Only (TEST FILE)
-- ============================================
-- This script provides INSERT statements with ONLY the Photo field
-- NO Biography, NO Wiki - ONLY Pictures
-- Test file with only 2 photos for testing purposes
-- Total Artists with Photos: 2
-- ============================================

-- Enable IDENTITY_INSERT to specify explicit ArtistId values
SET IDENTITY_INSERT [dbo].[Artist] ON
GO

BEGIN TRANSACTION;

INSERT [dbo].[Artist] ([ArtistId], [Photo]) VALUES (1, N'https://i.scdn.co/image/b040846ceba13c3e9c125d68389491094e7f2982');
INSERT [dbo].[Artist] ([ArtistId], [Photo]) VALUES (2, N'https://i.scdn.co/image/ab6761610000e5eb0767e116a2307495e37cd7fb');

COMMIT TRANSACTION;
GO

-- Disable IDENTITY_INSERT
SET IDENTITY_INSERT [dbo].[Artist] OFF
GO

-- ============================================
-- Verification Query
-- ============================================
-- Count artists with photos
SELECT COUNT(*) AS [TotalArtistsWithPhotos]
FROM [dbo].[Artist]
WHERE [Photo] IS NOT NULL;
GO

-- View sample of artists with photos
SELECT TOP 10 [ArtistId], [Photo]
FROM [dbo].[Artist]
WHERE [Photo] IS NOT NULL
ORDER BY [ArtistId];
GO
