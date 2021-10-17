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
    pattern='.*\[35\]\[.*'
    if [[ ${1} =~ $pattern ]]; then
      exercise::set_success
      echo::success "Hervorragend. Die Verwendung von [35] findet 30er und 50er Nummern."
      echo::success "Bei zweistelligen Zahlen muss jede Stelle markiert werden. Hier die"
      echo::success "Zehnersstelle durch [35] und die Einerstelle durch [0-9] oder die Klasse [[:digit:]]."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Globbing erlaubt die Verwendung von Zeichengruppen und Bereichen."
    echo::info "Gruppen von Zeichen werden durch [] angegeben, ähnlich wie * oder ?."
    echo::info "Im Verzeichnis Geräteverzeichnis /dev befinden sich Dateien tty*."
    echo::info "Diese sind fortlaufende numeriert."
    echo::info "Zeigen Sie alle tty Dateien aus den Bereichen 30-39 und 50-59 mit nur einem ls Aufruf an."
    echo::info "Hinweis: Übelegen Sie, wieviele Globs Sie benötigen."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
