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
    if [[ -f "\$USER,Beispiel datei" ]]; then
      exercise::set_state ENTERED_TOUCHSQ
      echo::success "Gratulation, Sie haben erfolgreich einen Dateinamen mit \$ angelegt."
    fi
    ;;
  ENTERED_TOUCHSQ)
    if [[ "${1:0:2}" = "ls" ]]; then
      exercise::set_success
      echo::success "Die einfachen Anführungsstriche schützen alle Sonderzeichen ohne Ausnahme."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Einfache Anfürhrungszeichen (single quotes) schützen alle Sonderzeichen."
    echo::info "Führen Sie den Befehl ' touch '\$USER,Beispiel datei' ' aus."
    ;;
  ENTERED_TOUCHSQ)
    echo::success "Zeigen Sie den Inhalt des Verzeichnisses an. Vergleichen Sie die Dateinamen."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
