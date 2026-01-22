-- Database schema for music artists/bands (SQL Server syntax)
-- This creates the Artists table with the specified structure

CREATE TABLE Artists (
    ArtistId INT PRIMARY KEY NOT NULL,
    Name NVARCHAR(MAX) NOT NULL,
    Wiki NVARCHAR(MAX) NULL,
    Biography NVARCHAR(MAX) NULL,
    Photo NVARCHAR(MAX) NULL
);
