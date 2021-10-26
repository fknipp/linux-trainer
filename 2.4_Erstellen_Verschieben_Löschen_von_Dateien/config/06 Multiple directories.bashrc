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
    if [[ -d $HOME/bin ]]; then
      exercise::set_success
      echo::success "Ihr $HOME/bin Verzeichnis existiert. Sie können hier zukünftig Ihre Skripte und Programme ablegen."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Legen Sie das Verzeichnis bs1-demo/testdaten/temp in Ihrem Heimatverzeichnis an."
    echo::info "Lesen Sie in der man page des Befehls mkdir den notwendigen Parameter nach mit"
    echo::info "dem man übergeordnete (parent) und untergeordnete Verzeichnisse in einem Schritt anlegen kann."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
