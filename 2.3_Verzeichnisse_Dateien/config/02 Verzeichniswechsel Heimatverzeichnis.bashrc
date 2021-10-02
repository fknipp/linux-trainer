#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {
  if [[ "$PWD" = "$HOME" ]]; then
    exercise::set_success
    echo::success "Super, Sie sind jetzt in Ihrem Heimatverzeichnis."
  else
    echo::info "Wechseln Sie in Ihr Heimatverzeichnis."
  fi
}
