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
    if [[ -f $HOME/linux-demo/testdaten/temp/datei &&
          -f $HOME/linux-demo/testdaten/temp/meine,Beispiel &&
          -f "$HOME/linux-demo/testdaten/meine,Beispiel datei" &&
          -f "$HOME/linux-demo/testdaten/\$USER,Beispiel datei" &&
          -f "$HOME/linux-demo/testdaten/$USER,Beispiel datei" ]]; then
      exercise::set_success
      echo::success "Sie haben erfolgreich Ihr Heimatverzeichnis aufgeräumt."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Verschieben Sie mit dem Befehl mv alle Dateien aus Übung 2.1."
    echo::info "Dabei sollen alle Dateien mit unvollständigem Namen in das Verzeichnis"
    echo::info "~/linux-demo/testdaten/temp und alle Dateien mit vollständigem Namen in testdaten abgelegt werden."
    echo::info "Hinweis: Die vollständigen Namen haben das Muster '<WORT>,Beispiel datei' z.B. 'meine,Beispiel datei.'"
    echo::info "Hinweis: Überlegen Sie, wie Ihnen Globbing helfen kann."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
