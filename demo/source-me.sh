#!/bin/bash

function bar() {
  echo "bar: source-me.sh"
}

function baz() {
  echo "baz: source-me.sh"
  echo "bar is: $(bar)"
  echo "baz finished."
}
