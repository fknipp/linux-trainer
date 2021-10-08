#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd .. || exit

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ "${1##.*/}" = "log" ]]; then
      exercise::set_state ENTERED_LOG
      echo::success "Sie sehen Dateien mit Ziffern im Dateinamen. Z.B. Dateien mit die dem Schema auth* entsprechen."
      echo::info "Zeigen Sie alle auth log Dateien an, welche mit einer Ziffer enden."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Unter Globbing versteht man die gemeinsame Anzeige von Dateien oder Verzeichnissen mit ähnlichem Namen."
    echo::info "Neben * ist Globbing auch mit ? möglich."
    echo::info "Der Platzhalter ? passt auf genau 1 Zeichen im Namen."
    echo::info "Zeigen Sie mit Hife des ? und * Wildcards alle Verzeichnisse des Kapitel 2 an."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
