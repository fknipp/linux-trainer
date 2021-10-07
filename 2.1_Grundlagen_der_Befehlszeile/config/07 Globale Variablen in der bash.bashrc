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
    if [[ $1 = env ]]; then
      exercise::set_state ENTERED_ENV
      echo::success "Sehr gut! Eine lange Liste. Zum Blättern im Terminal können Sie SHIFT-Bild auf/ab verwenden."
    fi
    ;;
  ENTERED_ENV)
    pattern=.*$HOME/bin.*
    if [[ ${PATH} =~ $pattern ]]; then
      exercise::set_success
      echo::success "Sehr gut! Ihre Pfadvariable enthält nun $HOME/bin."
    fi
    ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Der Befehl env zeigt Ihnen alle Umgebungsvariablen. Probieren Sie!"
    ;;
  ENTERED_ENV)
    echo::info "In der Umgebung enthält die Variable PATH jene Pfade, die nach ausführbaren Dateien druchsucht werden. Die Pfade werden durch : getrennt."
    echo::info "Ergänzen Sie in der Pfadvariablen das bin Verzeichnis Ihres Heimatverzeichnisses."
    echo::info "Der Wert einer Varialen erhält man durch $ vor dem Variablennamen."
    echo::info "Hinweis: In der Pfadvariablen muss ein absoluter Pfad angegeben sein."
    echo::info "Hinweis: Sie können eine Variable sich selbst zuweisen, damit der ursprüngliche Wert erhalten bleibt."
    ;;
  SUCCESS)
    message::success
    ;;
  esac
}
