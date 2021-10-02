#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {
  if [[ "$PWD" = "/etc" ]]; then
    echo::success "Gratulation, Sie haben das Verzeichnis /etc gefunden."
    echo::info "Wechseln Sie zurück in Ihr Heimatverzeichnis."
  elif [[ "$PWD" = "$HOME" ]]; then
    echo::success "Super, Sie sind jetzt in Ihrem Heimatverzeichnis."
  else
    echo::info "Wechseln Sie in das Verzeichnis /etc"
  fi
}
