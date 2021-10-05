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
    if [[ ${1} = "touch meine,Beispiel datei" ]]; then
      exercise::set_success
      echo::success "Gratulation, der Befehl touch war erfolgreich."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Mit dem Befehl touch können Dateien angelegt werden."
    echo::info "touch akzeptiert mehrere Worte als Argumente. Achten Sie auf die genaue Schreibweise von Befehlen und Parametern."
    echo::info "Führen Sie den Befehl 'touch meine,Beispiel datei' aus."
    ;;
  SUCCESS)
    echo::info "Zum Fortsetzten Strg-D oder exit eingeben."
    ## Need some interactive elements here. NOTE: The check function is part of a prompt --> calling read in the prompt shuffles the output and workflow.
    ## Use *.after file instead. To call the next file student need to leave current shell.
    ;;
  esac
}