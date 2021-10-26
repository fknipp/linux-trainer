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
    echo::info "Legen Sie mit dem Befehle \'mkdir\' ein Verzeichnis bin in Ihrem Heimatverzeichnis an."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
