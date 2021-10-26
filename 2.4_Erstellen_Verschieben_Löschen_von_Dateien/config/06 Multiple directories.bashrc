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
    if [[ -d $HOME/linux-demo/testdaten/temp ]]; then
      exercise::set_success
      echo::success "Sehr gut. Die Vobereitungen für die nächsten Schritte sind abgeschlossen."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Legen Sie das Verzeichnis linux-demo/testdaten/temp in Ihrem Heimatverzeichnis an."
    echo::info "Lesen Sie in der man page des Befehls mkdir den notwendigen Parameter nach mit"
    echo::info "dem man übergeordnete (parent) und untergeordnete Verzeichnisse in einem Schritt anlegen kann."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
