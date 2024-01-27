#!/bin/bash

# Check if the directory exists
if [ ! -d "flacs-to-convert" ]; then
    echo "Error: flacs-to-convert directory not found."
    exit 1
fi

for file in flacs-to-convert/*.flac; do
    echo "Converting: $file"
    ffmpeg -i "$file" -c:a libvorbis -q:a 4 "${file%.flac}.ogg"
    rm "$file"
    echo "Deleted: $file"
done
echo "Finished"
