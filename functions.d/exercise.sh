#!/bin/bash

exercise::run() {

  local exercise
  exercise=$1

  basename="${exercise%.*}"
  export EXERCISE_NAME="${basename##*/}"

  if [[ -x "${basename}.before" ]]; then
    "${basename}.before"
  fi

  if [[ -x "${exercise}" ]]; then
    "${exercise}"
  fi

  if [[ -f "${basename}.bashrc" ]]; then
    bash --rcfile "${basename}.bashrc"
  fi

  if [[ -x "${basename}.after" ]]; then
    "${basename}.after"
  fi
}
