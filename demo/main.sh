#! /bin/bash
# This is a sample script that includes some method overrides.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../no-stomp.sh"
source "$SCRIPT_DIR/human-lib.sh"
source "$SCRIPT_DIR/dog-lib.sh"

dog_introduction
human_introduction