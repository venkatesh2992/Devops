#!/bin/bash

function is_uppercase() {
  [[ $1 == [[:upper:]]* && $1 == "${1^^}" ]]
}


while true; do
  read -p "Please enter your username (uppercase letters only, no spaces): " username

  if [[ $username == *" "* ]]; then
    echo "Error: Username should not contain spaces. Please try again."
  else
	  
    if [ -z "$username" ]; then
      echo "Error: Username cannot be empty. Please try again."
    else

      if is_uppercase "$username"; then
        echo "Username accepted: $username"
        break
      else
        echo "Error: Username should be in uppercase letters only. Please try again."
      fi
    fi
  fi
done

