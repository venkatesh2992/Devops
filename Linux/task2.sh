#!/bin/bash

print_file_details() {
    filename="$1"

    if [ ! -f "$filename" ]; then
        echo "Error: File not found!"
        exit 1
    fi

    word_count=$(wc -w < "$filename")
    line_count=$(wc -l < "$filename")
    char_count=$(wc -m < "$filename")

    echo "File: $filename"
    echo "Number of words: $word_count"
    echo "Number of lines: $line_count"
    echo "Number of characters: $char_count"
}

read -p "Enter the filename: " input_filename
print_file_details "$input_filename"

