#!/bin/bash

read -p "Enter a string: " input_string

for i in $(seq 1 ${#input_string}); do
    character=$(echo "$input_string" | cut -c "$i")
    
    if [[ "$character" == [V-H] ]]; then
        echo "Processing character: $character"
    else
        echo "Skipping character: $character"
    fi
done

