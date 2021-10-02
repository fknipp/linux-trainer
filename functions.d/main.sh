#!/bin/bash

main() {
  for exercise in "$@"; do
    while ! exercise::run "${exercise}"; do
      message::retry
    done
  done

  message::finished
}
