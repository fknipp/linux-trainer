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
    if [[ ! -z $geburtstag ]]; then
      exercise::set_success
      echo::success "Alles Gute! Für Ihren Jubeltag am $geburtstag."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Mit dem = Zeichen kann man einer Variablen einen Wert zuweisen. Variablen beginnen mit einem Buchstaben oder _ ."
    echo::info "Weisen Sie der Variablen geburtstag das Datum Ihres Geburtstags zu."
    echo::info "Hinweis: Neben dem = dürfen keine Leerzeichen stehen."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
