#!/bin/bash

find_and_delete_java_files() {
    local directory="$1"

    java_files=$(find "$directory" -type f -name "*.java")

    file_count=$(echo "$java_files" | wc -l)

    if [ $file_count -eq 0 ]; then
        echo "No Java files found in directory '$directory'."
        return
    fi

    echo "Found $file_count Java file(s) in directory '$directory'."

    ten_days_ago=$(date -d "10 days ago" +%s)

    for file in $java_files; do
        last_modified=$(stat -c %Y "$file")

        if [ $last_modified -ge $ten_days_ago ]; then
            echo "Deleting file: $file"
        fi
    done
}

read -p "Enter the directory path(s) (separate multiple directories with spaces): " input_directories

IFS=' ' read -r -a directories <<< "$input_directories"

for dir in "${directories[@]}"; do
    find_and_delete_java_files "$dir"
done

