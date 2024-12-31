#! /bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/source-me.sh"

# Simple override in the same file.
function foo() {
  echo "foo original"
}

function foo() {
  echo "foo overridden"
}

foo


# Overriding a helper method that was originally defined within a sourced file.
bar() {
  echo "bar overridden"
}

baz