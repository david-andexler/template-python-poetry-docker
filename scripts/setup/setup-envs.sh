#!/bin/bash

SAMPLE_DIR=".envs/.local/.sample"
LIVE_DIR=".envs/.local/.live"

# Ensure the sample directory exists
if [ ! -d "$SAMPLE_DIR" ]; then
    echo "Error: Sample directory '$SAMPLE_DIR' does not exist."
    exit 1
fi

mkdir -p "$LIVE_DIR"

# Check if the sample directory contains any files
if [ -z "$(ls -A "$SAMPLE_DIR")" ]; then
    echo "Warning: Sample directory '$SAMPLE_DIR' is empty. Nothing to copy."
    exit 0
fi

for sample_file in "$SAMPLE_DIR"/.*; do
    base_name=$(basename "$sample_file")
    if [[ "$base_name" == "." || "$base_name" == ".." || "$base_name" == ".gitkeep" || "$base_name" == ".DS_Store" ]]; then
        continue
    fi

    live_file="$LIVE_DIR/$base_name"

    if [ ! -f "$live_file" ]; then
        echo "Copying $base_name to .live directory..."
        cp "$sample_file" "$live_file"
    else
        echo "Checking keys in $base_name..."
        while IFS= read -r line || [ -n "$line" ]; do
            if [[ -z "$line" || "$line" == \#* ]]; then
                continue
            fi

            key=$(echo "$line" | cut -d '=' -f 1)

            if ! grep -q "^$key=" "$live_file"; then
                echo "Adding missing key: $key"
                echo "$line" >> "$live_file"
            fi
        done < "$sample_file"
    fi
done
