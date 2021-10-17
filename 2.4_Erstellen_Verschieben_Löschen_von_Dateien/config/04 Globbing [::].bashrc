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
    pattern='.*tty\[\[\:digit\:\]\]'
    if [[ ${1} =~ $pattern ]]; then
      exercise::set_success
      echo::success "Hervorragend. Eine Zahl im Dateinamen kann durch die Klasse  [:digit:] repräsentiert werden."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Globbing erlaubt die Verwendung von Zeichenklassen."
    echo::info "Klassen von Zeichen werden durch [:<Klasse>:] angegeben und ähnlich wie *, ? und [] verwendet."
    echo::info "Eine vollständige Liste der POSIX Zeichenklassen ist in man bash zu finden:"
    echo::info "Abschnitt \"Pathname Expansion\""
    echo::info "Die Klasse für Buchstaben lautet [:alpha:], die Klasse für Zahlen [:digit:]."
    echo::info "Im Verzeichnis Geräteverzeichnis /dev befinden sich Dateien tty*."
    echo::info "Diese sind fortlaufende numeriert."
    echo::info "Zeigen Sie alle tty Dateien mit nur 1 Zahlenstelle im Namen an."
    echo::info "Hinweis: Benutzen Sie Ziffernklasse."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
