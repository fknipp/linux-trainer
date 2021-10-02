#!/bin/bash

message::start() {
  echo -e "Die Übung ${C_INFO}${EXERCISE_NAME}${C_NORMAL} wird gestartet."
}

message::retry() {
  echo::warn "Die Übung war nicht erfolgreich und wird daher wiederholt."
}

message::success() {
  echo::success "Sie haben die Übung erfolgreich absolviert."
  echo "Sie können die nächste Übung mittels Strg+D oder Ausführung von exit starten."
}

message::finished() {
  echo::success "Herzlichen Glückwunsch, Sie haben alle Übungen erfolgreich absolviert."
  echo "Der Übungsmodus ist beendet. Noch viel Spaß mit Linux!"
}