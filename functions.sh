#!/bin/bash

for i in ../functions.d/*; do
  # shellcheck disable=SC1090
  . "$i"
done
