#! /bin/bash

set -e

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Include the functions from functions.sh relative to the script's directory
source "$SCRIPT_DIR/source-me.sh"

function foo() {
  echo "foo1"
}

function foo() {
  echo "foo2"
}



foo
bar

bar() {
  echo "bar main"
}

bar