#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd || exit

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ ${1} = "ls -l" ]]; then
      exercise::set_success
      echo::success "Sie haben das Heimatverzeichnis erfolgreich angezeigt mit Hilfe von ls -l."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Sie befinden sich in Ihrem Heimatverzeichnis. Erkennbar an der Tilde '~' im Prompt."
    echo::info "Zeigen sie den Inhalt des Verzeichnisses ausführlich an ('Langform')."
    echo::info "Hinweis: Der Befehl ls benötigt dafür eine Option."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}