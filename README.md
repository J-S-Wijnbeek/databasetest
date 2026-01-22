# databasetest

A database for storing music artists and their information.

## Database Schema

The `Artists` table contains the following columns:

- **ArtistId** (PK, int, not null) - Unique identifier for the artist
- **Name** (nvarchar(max), not null) - Artist/Band name
- **Wiki** (nvarchar(max), null) - Wikipedia URL
- **Biography** (nvarchar(max), null) - Artist biography
- **Photo** (nvarchar(max), null) - Photo URL

## Files

- `schema.sql` - Creates the Artists table (SQL Server syntax)
- `schema_sqlite.sql` - Creates the Artists table (SQLite syntax for testing)
- `update_10cc.sql` - SQL query to update 10cc's biography and photo

## Usage

### SQL Server

Execute the SQL files in your database:

```sql
-- First, create the table
-- Run schema.sql

-- Then, update 10cc's biography and photo
-- Run update_10cc.sql
```

### SQLite (for testing)

```bash
sqlite3 artists.db < schema_sqlite.sql
sqlite3 artists.db < update_10cc.sql
sqlite3 artists.db "SELECT * FROM Artists;"
```

## About 10cc

The update statement adds biography and photo information for 10cc, the English rock band famous for "I'm Not In Love" and other hits.