#!/bin/bash

bash::check() {

  local color
  if exercise::is_success; then
    color="${C_SUCCESS}"
  else
    color="${C_INFO}"
  fi

  header::set "$(echo::line "" "${EXERCISE_NAME}" "${color}${C_REVERSE}" "${C_NORMAL}")"

  local list_history
  list_history=$(history 1)

  check "${list_history:7}"
}

# To be overwritten by exercise
check() {
  echo::error "Add check function to your bashrc file."
}

shopt -s promptvars

# shellcheck disable=SC2154
PS1="\$(bash::check)\[\n\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
