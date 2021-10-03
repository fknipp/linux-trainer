#!/bin/bash

message::reset() {
  echo::info "Die Lektion wird an der letzten Stelle fortgesetzt."
  echo "durch Aufruf von $0 reset können Sie die Lektion neu starten."
}

message::start() {
  echo -e "Die Übung ${C_INFO}${EXERCISE_NAME}${C_NORMAL} wird gestartet."
}

message::retry() {
  echo::warn "Die Übung war nicht erfolgreich und wird daher wiederholt."
  echo "Zum Abbrechen der Übung quit eingeben. Fortsetzten mit Enter."
}

message::success() {
  echo::success "Sie haben die Übung erfolgreich absolviert."
  echo "Sie können die nächste Übung mittels Strg+D oder Ausführung von exit starten."
}

message::finished() {
  echo::success "Herzlichen Glückwunsch, Sie haben alle Übungen erfolgreich absolviert."
  echo "Der Übungsmodus ist beendet. Noch viel Spaß mit Linux!"
}
