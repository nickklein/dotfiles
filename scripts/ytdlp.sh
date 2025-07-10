#!/bin/bash

echo "🎬 yt-dlp"

# Prompt for URL if not passed as argument
read -p "Enter URL: " url

# Prompt for output filename, default to output.mp3
read -p "Enter output filename (default: output.mp3): " output

# Default to output.mp3 if no filename provided
output=${output:-output.mp3}

# Run yt-dlp to download and extract audio with subs in MP3 format
yt-dlp --write-subs --sub-lang ja -o "$output" "$url"

echo "Download complete: $output"
