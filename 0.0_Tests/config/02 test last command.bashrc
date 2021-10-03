#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {
  echo -e "The last command was ${C_BOLD}$1${C_NORMAL}."
  echo -e "Call ${C_BOLD}exercise::set_success${C_NORMAL} to mark the success of the exercise."
}