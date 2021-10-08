#!/bin/bash

main() {

  local exercises
  if [[ $EXERCISES ]]; then
    exercises=("${EXERCISES[@]}")
  else
    GLOBIGNORE="config/*.before:config/*.after"
    exercises=(config/*)
    unset GLOBIGNORE
  fi

  echo "${exercises[@]}"

  local successful_exercises_file
  successful_exercises_file="${PWD}/.successful_exercises"

  if [[ "$1" = "reset" ]]; then
    true >"${successful_exercises_file}"
  fi

  if [[ -s "${successful_exercises_file}" ]]; then
    message::reset
  fi

  for exercise in "${exercises[@]}"; do

    if grep -x -F -q -s "${exercise}" "${successful_exercises_file}"; then
      continue
    fi

    while ! exercise::run "${exercise}"; do
      message::retry
      read -r
      if [[ "$REPLY" = "quit" ]]; then
        exit
      fi
    done
    echo "${exercise}" >>"${successful_exercises_file}"
  done

  message::finished
}
