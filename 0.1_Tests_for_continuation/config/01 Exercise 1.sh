#!/bin/bash

echo "Hier läuft $0"
read -r -p "Geben Sie 1 für einen erfolgreichen Abschluss ein: " answer

if [[ $answer = 1 ]]; then
  exit 0
else
  exit 1
fi
