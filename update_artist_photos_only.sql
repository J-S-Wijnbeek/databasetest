-- ============================================
-- SQL Script to UPDATE Artist Photos Only
-- ============================================
-- This script provides UPDATE statements with ONLY the Photo field
-- NO Biography, NO Wiki - ONLY Pictures
-- Total Artists with Photos: 2325
-- ============================================

BEGIN TRANSACTION;

UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/b040846ceba13c3e9c125d68389491094e7f2982' WHERE [ArtistId] = 1;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5eb0767e116a2307495e37cd7fb' WHERE [ArtistId] = 2;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5eb3a475812e97ee788cfd5fd1a' WHERE [ArtistId] = 3;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/207803ce008388d3427a685254f9de6a8f61dc2e' WHERE [ArtistId] = 4;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5ebd80098ab0e9b98ee0bd0795e' WHERE [ArtistId] = 5;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5ebe9348cc01ff5d55971b22433' WHERE [ArtistId] = 6;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5ebe336079626f2a1be7456486c' WHERE [ArtistId] = 7;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5ebe4cea917b68726aadb4854b8' WHERE [ArtistId] = 8;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/afde2fdd14f8c8ca23393f257e3a369a234a24b6' WHERE [ArtistId] = 9;
UPDATE [dbo].[Artist] SET [Photo] = N'https://i.scdn.co/image/ab6761610000e5eb2af24c397e6ba11f49516dd9' WHERE [ArtistId] = 10;

-- Continue for all 2325 artists with the same pattern...
-- (Include all the UPDATE statements for every artist ID from the original INSERT script)

COMMIT TRANSACTION;