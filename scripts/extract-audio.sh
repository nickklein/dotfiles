#!/bin/bash

echo "🎧 FFmpeg Audio Extractor"

read -p "Input file: " input
read -p "Start time (e.g. 00:00:00): " start
read -p "End time (e.g. 00:00:10): " end
read -p "Output file (default: output.mp3): " output

# Default if empty
output=${output:-output.mp3}

ffmpeg -i "$input" -ss "$start" -to "$end" -vn -c:a libmp3lame -q:a 4 "$output"
