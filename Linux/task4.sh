#!/bin/bash

# Function to find and delete Java files modified in the last 10 days
find_and_delete_java_files() {
    local directory="$1"

    # Find all Java files in the specified directory
    java_files=$(find "$directory" -type f -name "*.java")

    # Count the number of Java files found
    file_count=$(echo "$java_files" | wc -l)

    if [ $file_count -eq 0 ]; then
        echo "No Java files found in directory '$directory'."
        return
    fi

    echo "Found $file_count Java file(s) in directory '$directory'."

    # Filter files modified within the last 10 days
    ten_days_ago=$(date -d "10 days ago" +%s)

    for file in $java_files; do
        last_modified=$(stat -c %Y "$file")

        if [ $last_modified -ge $ten_days_ago ]; then
            echo "Deleting file: $file"
            # Uncomment the next line to actually delete the files (use with caution!)
            # rm "$file"
        fi
    done
}

# Main script
read -p "Enter the directory path(s) (separate multiple directories with spaces): " input_directories

# Convert the input directories into an array
IFS=' ' read -r -a directories <<< "$input_directories"

# Loop through each directory and find/delete Java files
for dir in "${directories[@]}"; do
    find_and_delete_java_files "$dir"
done

