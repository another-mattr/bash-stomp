#! /bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../no-stomp.sh"
source "$SCRIPT_DIR/source-me.sh"

# Simple override in the same file.
function foo() {
  echo "foo original"
}

foo() {
  echo "foo new"
}

foo


# Overriding a helper method that was originally defined within a sourced file.
bar() {
  echo "bar main.sh"
}

baz