#!/bin/bash

header::set() {
  local number_header_lines
  number_header_lines=$#

  local number_lines
  number_lines=$(tput lines)

  echo -e -n "\033[s\033[$((number_header_lines + 1));${number_lines}r\033[1;1H\033[K"
  for i in "$@" ; do
    echo -e "${i}"
  done
  echo -e "\033[u"
}

header::release() {
  header::set
}

if [[ $0 =~ header.sh$ ]]; then
  header::set "This is the non-scrolling header." "It contains two lines."
  for i in {1..200}; do
    echo "Line ${i}"
  done
  read -r -p "Enter new header string: " header
  header::set "${header}"
  echo "Starting bash to test scrolling behavior"
  bash
  header::release
fi
