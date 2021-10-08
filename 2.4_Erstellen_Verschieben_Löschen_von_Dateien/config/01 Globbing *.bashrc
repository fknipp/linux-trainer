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
    pattern=.*\*Beispiel\*.*
    if [[ "$1" =~ $pattern ]]; then
      exercise::set_success
      echo::success "Sehr gut - Alle Beispiel Dateien gefunden."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Unter Globbing versteht man die gemeinsame Anzeige von Dateien oder Verzeichnissen mit ähnlichem Namen."
    echo::info "Globbing ist möglich mit * (passt auf beliebige Zeichen im Namen)."
    echo::info "Verwenden Sie * beim Aufruf von ls um alle Dateien zu listen, die das Wort 'Beispiel' enthalten."
    echo::info "Hinweis: Wildcards können auch mehrfach bei einem Aufruf verwendet werden."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
