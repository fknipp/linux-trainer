#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ "$PWD" = "/etc" ]]; then
      exercise::set_state ENTERED_ETC
      echo::success "Sehr gut, Sie haben das Verzeichnis /etc gefunden."
    fi
    ;;
  ENTERED_ETC)
    if [[ "$PWD" = "$HOME" ]]; then
      exercise::set_success
      echo::success "Super, Sie sind in Ihrem Heimatverzeichnis."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Wechseln Sie in das Verzeichnis /etc."
    ;;
  ENTERED_ETC)
    echo::info "Wechseln Sie in Ihr Heimatverzeichnis."
    ;;
  SUCCESS)
    message::success
    ;;
  esac

}
