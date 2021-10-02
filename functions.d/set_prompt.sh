#!/bin/bash

shopt -s promptvars

check() {
  echo::error "Add check function to your bashrc file."
}

# shellcheck disable=SC2154
PS1="\$(check)\[\n\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "