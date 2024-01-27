#!/bin/bash

# Step 1: Pack every file in the working directory into tar.gz
archive_name="awesome-o-sound-pack.tar.gz"
tar -czvf "$archive_name" audio-files/*.ogg

# Step 2: Calculate the byte size of the archive and save it into a variable
archive_size=$(du -b "$archive_name" | awk '{print $1}')

# Step 3: Calculate the MD5 hash for the archive and save it into a variable
md5_hash=$(md5sum "$archive_name" | awk '{print $1}')

# Step 4: Output the values to a text file
output_file="archive_info.txt"
echo "MD5 Hash: $md5_hash" > "$output_file"
echo "Byte Size: $archive_size bytes" >> "$output_file"

echo "Script execution completed. Archive information saved to $output_file."
