#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Store the initial list of functions
declare -A functions_map

for func in $(declare -F | awk '{print $3}'); do
  functions_map[$func]=1
done

# File to capture our stomp data.
LOGFILE="output.log"

# Create a named pipe (FIFO)
pipe=/tmp/no_stomp_pipe.$$
mkfifo "$pipe"
no_stomp_cleanup() {
  rm "$pipe"
}
trap no_stomp_cleanup EXIT

# Function to process each line
no_stomp_process_line() {
  while read -r line; do
    echo "$line"
    # Check if the current line is a function definition
    if [[ "$line" =~ ^[[:space:]]*(function[[:space:]]+)?([a-zA-Z_][a-zA-Z0-9_]*)[[:space:]]*\(\)?[[:space:]]*\{ ]]; then
      local func="${BASH_REMATCH[2]}"
      if [[ -n "${functions_map[$func]}" ]]; then
        echo -e "<< WARNING: $func ${RED}OVERRIDDEN${NC} >>" | tee -a $LOGFILE
      else
        echo -e "<< DEBUG: $func ${GREEN}DECLARED${NC} >>" | tee -a $LOGFILE
        functions_map[$func]=1
      fi
    fi
  done
}

# Start the line processing function in the background
no_stomp_process_line < "$pipe" &

# Redirect the script's output to the pipe
exec >"$pipe" 2>&1

# Enable verbose mode to output each line before execution
set -v