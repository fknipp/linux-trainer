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
    if [[ ${1} = "ls -a" ]]; then
      exercise::set_success
      echo::success "Sie haben das Heimatverteichnis erfolgreich vollständig angezeigt mit Hilfe von ls -a."
      echo::success "Vergleichen Sie die Ausgabe mit dem Ergebenis von ls."
      echo::success "Dateinamen beginnend mit '.' werden ausgeblendet."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Sie befinden sich in Ihrem Heimatverzeichnis. Erkennbar an der Tilde '~' im Prompt."
    echo::info "Zeigen sie alle Dateien in dem Verzeichnis an."
    echo::info "Hinweis: Der Befehl ls benötigt dafür eine Option."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}