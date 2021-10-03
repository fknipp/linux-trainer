#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {
  cat <<EOF
The last command was $1. 
Call exercise::set_success to mark the success of the exercise.
EOF
}