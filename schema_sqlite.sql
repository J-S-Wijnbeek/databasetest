-- SQLite-compatible version of schema.sql for testing purposes
-- This creates the Artists table with SQLite-compatible data types

CREATE TABLE Artists (
    ArtistId INTEGER PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL,
    Wiki TEXT NULL,
    Biography TEXT NULL,
    Photo TEXT NULL
);
