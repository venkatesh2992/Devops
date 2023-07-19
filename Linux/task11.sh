#!/bin/bash

read -p "Enter a string: " input_string

length=${#input_string}

echo "String length: $length"

for (( i = 0; i < length; i++ )); do
    character="${input_string:$i:1}"
    echo "Character: $character, Count: $(grep -o "$character" <<< "$input_string" | wc -l)"
done

