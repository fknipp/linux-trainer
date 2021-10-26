#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd ~/linux-demo/testdaten || exit

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ $(find $HOME/linux-demo/testdaten/temp -type f 2> /dev/null | wc -l) = 0 ]]; then
      exercise::set_state TEMP_EMPTY
      echo::success "Sie haben erfolgreich Ihr Heimatverzeichnis aufgeräumt."
    fi
    ;;
  TEMP_EMPTY)
    if [[ ${1} = "rmdir temp" ]]; then
      exercise::set_state TEMP_DELETED
      echo::success "Das Verzeichnis temp wurde erfolgreich gelöscht!"
    fi
    ;;
  TEMP_DELETED)
    pattern='rm -.*r.*'
    if [[ ${1} =~ $pattern ]]; then
      exercise::set_success
      echo::info "Alle testdaten erfolgreich gelöscht!"
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Löschen Sie alle Dateien im Verzeichnis testdaten/temp mit rm."
    echo::info "Im Anschluss löschen Sie das Verzeichnis temp."
    echo::info "Hinweis: Globbing!"
    ;;
  TEMP_EMPTY)
    if [[ -d $HOME/linux-demo/testdaten/temp ]]; then
      echo::info "Das Verzeichnis temp ist nun leer. Löschen Sie das Verzeichnis mit rmdir."
    else
      exercise::set_state TEMP_DELETED
      echo::info "Löschen Sie das Verzeichnis testdaten."
      echo::info "Hinweis: Das Verzeichnis enthält noch Dateien. rmdir kann nur leere Verzeichnisse löschen."
      echo::info "Hinweis: Welcher Befehl kann alle Dateien löschen, auch rekursiv (Parameter!)?"
    fi
    ;;
  TEMP_DELETED)
    echo::info "Löschen Sie das Verzeichnis testdaten."
    echo::info "Hinweis: Das Verzeichnis enthält noch Dateien. rmdir kann nur leere Verzeichnisse löschen."
    echo::info "Hinweis: Welcher Befehl kann alle Dateien löschen, auch rekursiv (Parameter!)?"
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
