#!/bin/bash
# Quick Start Script for Fetching Artist Biographies
# ===================================================

echo "========================================="
echo "Artist Biography Fetcher - Quick Start"
echo "========================================="
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    echo "   Please install Python 3.6 or higher"
    exit 1
fi

echo "✓ Python 3 found: $(python3 --version)"
echo ""

# Check requests library
if ! python3 -c "import requests" 2>/dev/null; then
    echo "⚠️  'requests' library not found"
    read -p "Install 'requests' library? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "   Installing..."
        pip3 install --user requests
        echo ""
    else
        echo "ERROR: 'requests' library is required"
        exit 1
    fi
fi

echo "✓ Required libraries installed"
echo ""

# Check for API keys
if [ -z "$LASTFM_API_KEY" ]; then
    echo "⚠️  WARNING: LASTFM_API_KEY not set"
    echo "   You'll get basic biographies without Last.fm data"
    echo "   To use Last.fm API:"
    echo "   1. Get free API key at https://www.last.fm/api/account/create"
    echo "   2. Run: export LASTFM_API_KEY='your_key_here'"
    echo ""
    read -p "Continue without Last.fm? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo "✓ Last.fm API key found"
fi

echo ""
echo "========================================="
echo "Starting biography fetch..."
echo "This will take approximately 60-90 minutes"
echo "========================================="
echo ""

# Run the script
python3 fetch_artist_biographies.py

# Check if successful
if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "✓ SUCCESS!"
    echo "========================================="
    echo "Generated file: update_all_artists_detailed_biographies_api.sql"
    echo ""
    echo "Next steps:"
    echo "1. Review the SQL file"
    echo "2. Open in SQL Server Management Studio"
    echo "3. Execute against your database"
    echo ""
else
    echo ""
    echo "❌ Error occurred during execution"
    echo "Check the error messages above"
    exit 1
fi
