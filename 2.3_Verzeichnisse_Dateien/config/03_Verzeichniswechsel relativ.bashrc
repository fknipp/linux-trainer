#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ "${PWD##*/}" = "2.3_Verzeichnisse_Dateien" ]]; then
      exercise::set_state ENTERED_2.3
      echo::success "Sehr gut, Sie haben das Verzeichnis 2.3_Verzeichnisse_Dateien gefunden."
    fi
    ;;
  ENTERED_2.3)
    if [[ "${PWD##*/}" = "level2 mit langem Namen" ]]; then
      exercise::set_success
      echo::success "Super, Sie sind im Verzeichnis baum/level1/level2 mit langem Namen."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Wechseln Sie in das Übungsverzeichnis 2.3_Verzeichnisse_Dateien.\nHinweis: Nutzen Sie ls und tree zur Orientierung."
    ;;
  ENTERED_2.3)
    echo::info "Wechseln Sie in das Verzeichnis baum/level1/level2 mit langem Namen.\nHinweis: Benutzen Sie die Tastenkürzel der Bash."
    ;;
  SUCCESS)
    message::success
    ;;
  esac

}