#!/bin/bash

find_file() {
    local path="$1"
    local filename="$2"

    if [ -z "$path" ]; then
        path="/"
    fi

    if [ ! -d "$path" ]; then
        echo "Error: Directory '$path' not found!"
        exit 1
    fi

    found_files=$(find "$path" -type f -name "$filename")

    if [ -z "$found_files" ]; then
        echo "File '$filename' not found in directory '$path'."
    else
        echo "Found file '$filename' in directory '$path':"
        echo "$found_files"
    fi
}

read -p "Enter the directory path (press Enter for default '/'): " input_path
read -p "Enter the filename: " input_filename

find_file "$input_path" "$input_filename"

