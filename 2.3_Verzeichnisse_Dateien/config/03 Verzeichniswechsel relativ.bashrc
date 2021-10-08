#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd ..

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
    if [[ "${PWD##*/}" = "level2 with long name" ]]; then
      exercise::set_state ENTERED_LONG
      echo::success "Super, Sie sind im Verzeichnis trainig_tree/level1/level2 with long name."
    fi
    ;;
  ENTERED_LONG)
    if [[ "${PWD##*/}" = "level1" ]]; then
      exercise::set_success
      echo::success "Super, Sie sind im Verzeichnis trainig_tree/level1."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Wechseln Sie in das Übungsverzeichnis 2.3_Verzeichnisse_Dateien."
    echo "Hinweis: Nutzen Sie TAB-Completion. Geben Sie die ersten Zeichen des Pfades ein und drücken Sie die Tabulator-Taste."
    echo "Hinweis: Mit einem Doppldruck der Tabulator-Taste bekommen Sie die verfügbaren Möglichkeiten angezeigt."
    ;;
  ENTERED_2.3)
    echo::info "Wechseln Sie in das Verzeichnis trainig_tree/level1/level2 with long name."
    echo "Hinweis: Nutzen Sie TAB-Completion. Geben Sie die ersten Zeichen des Pfades ein und drücken Sie die Tabulator-Taste."
    echo "Hinweis: Mit einem Doppldruck der Tabulator-Taste bekommen Sie die verfügbaren Möglichkeiten angezeigt."
    echo "Beobachten Sie, was mit den Leerzeichen im Namen geschieht."
    ;;
  ENTERED_LONG)
    echo::info "Wechseln Sie in das übergeordnete Verzeichnis."
    ;;
  SUCCESS)
    message::success
    ;;
  esac

}
