#!/bin/bash

function contains_upper_and_lower() {
  [[ "$1" =~ [[:upper:]] && "$1" =~ [[:lower:]] ]]
}

function is_alphanumeric() {
  [[ "$1" =~ ^[[:alnum:]]+$ ]]
}


while true; do
  read -p "Please enter your username: " username

  read -p "Please enter your password: " password

  if ! is_alphanumeric "$password"; then
    echo "Error: Password must be alphanumeric (letters and numbers only). Please try again."
  else

    if contains_upper_and_lower "$password"; then
      echo "Username: $username, Password: $password"
      break
    else
      echo "Error: Password must contain both uppercase and lowercase letters. Please try again."
    fi
  fi
done

