#!/bin/bash

message::retry() {
  echo::warn "Die Übung war nicht erfolgreich und wird daher wiederholt."
}

message::success() {
  echo::success "Sie haben die Übung erfolgreich absolviert."
  echo "Sie können die nächste Übung mittels Strg+D oder Ausführung von exit starten."
}