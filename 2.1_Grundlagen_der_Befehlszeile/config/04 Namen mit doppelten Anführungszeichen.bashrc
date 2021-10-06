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
    if [[ -f "meine,Beispiel datei" ]]; then
      exercise::set_state ENTERED_TOUCHDQ
      echo::success "Gratulation, der Befehl touch war erfolgreich."
    fi
    ;;
  ENTERED_TOUCHDQ)
    if [[ "${1:0:2}" = "ls" ]]; then
      exercise::set_state ENTERED_LS
      echo::success "Die doppelten Anführungsstriche schützen das Leerzeichen."
    fi
    ;;
  ENTERED_LS)
    if [[ -f "$USER,Beispiel datei" ]]; then
      exercise::set_state ENTERED_NAME
      echo::success "Super, die neue Datei wurde erstellt."
    fi
    ;;
  ENTERED_NAME)
    if [[ "${1:0:2}" = "ls" ]]; then
      exercise::set_success
      echo::success "Die doppelten Anführungsstriche erlauben Variablenersetzung."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Doppelte Anfürhrungszeichen (double quotes) schützen Sonderzeichen, ausgenommen $."
    echo::info "Führen Sie den Befehl 'touch \"meine,Beispiel datei\"' aus."
    echo::info "Hinweis: Mit den Cursor-Tasten können Sie durch die Befehlshistorie blättern."
    echo::info "Hinweis: Mit CTRL-R können Sie die Befehlshistorie durchsuchen."
    ;;
  ENTERED_TOUCHDQ)
    echo::success "Zeigen Sie den Inhalt des Verzeichnisses an. Vergleichen Sie die Dateinamen."
    ;;
  ENTERED_LS)
    echo::info "Dollar (\$) kennzeichnet Variablen. \$USER enthält den Usernamen (Hier: $USER)."
    echo::info "Legen Sie mit touch \"\$USER,Beispiel datei\" ein neues File an."
    ;;
  ENTERED_NAME)
    echo::info "Welchen namen trägt die Datei? Prüfen Sie mit ls."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
