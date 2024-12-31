#!/bin/bash
# This is an example library to demonstrate accidental method overrides.

function say_name() {
  echo "Sam"
}

function human_introduction() {
  echo "I'm a human and my name is $(say_name)."
}
