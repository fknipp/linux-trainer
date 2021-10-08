#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

cd .. || exit

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    pattern=.*tty6\?.*
    if [[ ${1} =~ $pattern ]]; then
      exercise::set_success
      echo::success "Hervorragend. Die niederwertigste Stelle wurde druch das ? variable ausgewählt."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Unter Globbing versteht man die gemeinsame Anzeige von Dateien oder Verzeichnissen mit ähnlichem Namen."
    echo::info "Neben * ist Globbing auch mit ? möglich."
    echo::info "Der Platzhalter ? passt auf genau 1 Zeichen im Namen."
    echo::info "Im Verzeichnis Geräteverzeichnis /dev befinden sich Dateien tty*."
    echo::info "Diese sind fortlaufende numeriert."
    echo::info "Zeigen Sie alle tty Dateien aus dem Bereich 60 bis 69 an."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
