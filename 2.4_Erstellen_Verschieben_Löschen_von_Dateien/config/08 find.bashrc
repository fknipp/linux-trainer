#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd ~ || exit

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ ${1} = "find" ||
          ${1} = "find $HOME/linux-demo" ||
          ${1} = "find linux-demo" ]]; then
      exercise::set_success
      echo::success "Der kürzestmögliche Aufruf ist 'find' ohne weitere Parameter direkt im verzeichnis linux-demo."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Benutzen Sie find um alle Dateien im Verzeichnis $HOME/linux-demo anzuzeigen."
    echo::info "Hinweis: Verwenden Sie den kürzest möglichen Aufruf."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
