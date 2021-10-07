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
    pattern=.*$HOME/bin.*
    if [[ $1 =~ .*export.* && ${PATH} =~ $pattern ]]; then
      exercise::set_success
      echo::success "Sehr gut! Ihre Pfadvariable enthält nun $HOME/bin und ist global für diese und all Sub-Shells gültig."
      echo::info "In der Datei $HOME/.profile finden Sie weitere Einstellungen zur Pfadvariablen. Sie können mit less $HOME/.profile nachlesen."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Beim Wechsel der Übung von 07 auf Übung 08 ist Ihre Änderung verloren gegangen. Man sagt: Die Varaible war lokal."
    echo::info "Damit eine Variable über eine Session hinaus erhalten bleibt, muss sie mit dem Schlüsselwort export global gemacht werden."
    echo::info "Benutzen Sie die Befehlshostorie der bash, holen Ihre Pfad-Variable an den Prompt und stellen Sie das Wort export voran."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
