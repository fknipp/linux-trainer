#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd /var/log || exit

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ "${PWD##*/}" = "2.3_Verzeichnisse_Dateien" ]]; then
      exercise::set_state ENTERED_TRAIN
      echo::success "Sehr gut, Sie haben das Verzeichnis 2.3_Verzeichnisse_Dateien gefunden."
    fi
    ;;
  ENTERED_TRAIN)
    if [[ $1 == "cd -" ]]; then
      exercise::set_success
      echo::success "Gratulation - Sie können nun sehr effizient mit cd absolute, relative und den letzten vorige Pfade erreichen."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Prüfen Sie Ihren aktuellen Standort mit pwd."
    echo::info "Wechseln Sie in das Übungsverzeichnis 2.3_Verzeichnisse_Dateien."
    echo::info "Sie finden den Eintrag wahrscheinlich in der Befahlshistorie."
    echo::info "Einen Versuch ist es Wert: Cursor rauf/runter oder CTRL-R zum Suchen."
    ;;
  ENTERED_TRAIN)
    echo::info "Wechseln Sie zurück in das Verzeichnis, welches Ihnen im vorigen Übungsschritt angezeigt wurde."
    echo::info "Hinweis: Der Befehl cd bietet eine Abkürzung zum zuletzt verwendeten Verzeichnis: cd -"
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
