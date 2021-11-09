#!/bin/bash

# shellcheck source=../../functions.sh
. ../functions.sh

check() {

  local state
  state=$(exercise::get_state)

  # State changes
  case $state in
  "")
    if [[ $1 = "ps -fu" || $1 = "ps -uf" ]]; then
      exercise::set_state ENTERED_PS
      echo::success "Sehr gut. ps -fu zeigt Ihnen die Prozessliste des aktuellen Terminals"
      echo::success "hierarchisch an."
    fi
    ;;
  ENTERED_PS)
    currentpwd=$(pwd)
    if [[ $currentpwd = "/proc/$$" ]]; then
      exercise::set_state ENTERED_PROC
      echo::success "Sie haben erfolgreich /proc/$$ erreicht."
    fi
  ;;
  ENTERED_PROC)
    if [[ $1 =~ less\ cmdline.* ]]; then
      exercise::set_success
      echo::info "Der Elternprozess des Kommandos ps ist eine bash."
      echo::info "Diese wird mit einem speziellen bashrc File geladen, das ein Teil des Linux Trainers ist."
    fi
  ;;
  esac

  state=$(exercise::get_state)

  # Additional output according the current state
  case $state in
  "")
    echo::info "Das /proc Filesystem enhält Informationen zu allen laufenden Prozessen."
    echo::info "Diese sind in Verzeichnissen mit der Prozess ID (PID) organisiert"
    echo::info "Mit dem Befehl ps lassen sich diese Prozesseigenschaften ablesen."
    echo::info "Finden Sie mit der Baumansicht ps -fu den Elternprozess des Befehls ps."
    ;;
  ENTERED_PS)
    echo::info "Wechseln Sie in das Verzeichnis im /proc Baum, das zur PID aus dem vorigen Schritt gehört."
  ;;
  ENTERED_PROC)
    echo::info "Finden Sie hier die Kommandozeile des Prozesses."
    echo::info "Hinweis: Die Datei ist eine Textdatei. Sehen Sie diese mit less an."
  ;;
  SUCCESS)
    message::success
    ;;
  esac
}
