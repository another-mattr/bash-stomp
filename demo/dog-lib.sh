#!/bin/bash
# This is an example library to demonstrate accidental method overrides.

function say_name() {
  echo "Fido"
}

function dog_introduction() {
  echo "I'm a dog and my name is $(say_name)."
}
