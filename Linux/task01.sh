#!/bin/bash

# Function to print server details
print_server_details() {
  echo "Server Details:"
  echo "================"

  # Print server name
  echo "Name: $(hostname)"

  # Print total memory
  echo "Memory:"
  free -h | awk '/^Mem:/{print "  Total: " $2, "Used: " $3, "Free: " $4}'

  # Print CPU information
  echo "CPU:"
  lscpu | grep "Model name" | awk -F ':' '{print "  " $2}' | sed 's/^[[:space:]]*//'

  # Print total disk space
  echo "Disk:"
  df -h / | awk 'NR==2 {print "  Total: " $2, "Used: " $3, "Available: " $4}'
}

# Call the function to print server details
print_server_details
