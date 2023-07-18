#!/bin/bash

print_server_details() {
  echo "Server Details:"
  echo "================"

  echo "Name: $(hostname)"
	echo "                    "

  echo "Memory:"
  free -h 
  	echo "                     "

  echo "CPU:"
  lscpu | grep "Model name" 
  	echo "			"

  echo "Disk:"
  df -h
  	echo "			"
}

print_server_details

