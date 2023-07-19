#!/bin/bash

read -p "Enter a string: " input_string

# Loop through the characters of the input string
# We use the 'seq' command to generate a sequence of numbers from 1 to the length of the string
# We then use 'cut' to get each character at the corresponding position in the string
for i in $(seq 1 ${#input_string}); do
    character=$(echo "$input_string" | cut -c "$i")
    
    # Check if the character is within the range from V to H (including V and H)
    if [[ "$character" == [V-H] ]]; then
        echo "Processing character: $character"
        # Add your action here for each character within the range
    else
        echo "Skipping character: $character"
    fi
done

