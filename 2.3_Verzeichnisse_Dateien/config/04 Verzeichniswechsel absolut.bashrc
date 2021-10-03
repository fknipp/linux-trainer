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
    if [[ "${PWD##*/}" = "2.3_Verzeichnisse_Dateien" && ${1:3:5} = "/home" ]]; then
      exercise::set_success
      echo::success "Sehr gut, Sie haben das Verzeichnis 2.3_Verzeichnisse_Dateien gefunden."
      echo::success "Sie haben dafür einen absoltuen PFad beginnend mit dem root-Verzeichnis / verwendet."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Wechseln Sie in das Übungsverzeichnis 2.3_Verzeichnisse_Dateien."
    echo::info "Verwenden Sie dafür den absoluten Pfad. Dieser beginnt mit /."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
