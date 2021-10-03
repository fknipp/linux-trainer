#!/bin/bash

export C_ERROR="\033[0;1;7;31m"
export C_INFO="\033[0;1;34m"
export C_WARN="\033[0;1;31m"
export C_SUCCESS="\033[0;1;32m"
export C_BOLD="\033[1m"
export C_REVERSE="\033[7m"
export C_NORMAL="\033[0m"

echo::error() {
  echo -e "${C_ERROR}$*${C_NORMAL}"
}

echo::info() {
  echo -e "${C_INFO}$*${C_NORMAL}"
}

echo::warn() {
  echo -e "${C_WARN}$*${C_NORMAL}"
}

echo::success() {
  echo -e "${C_SUCCESS}$*${C_NORMAL}"
}


#######################################
# Echoes a full line with the given string and fill characters.
# Arguments:
#   Fill character(s)
#   String (might be empty)
#   Prefix characters (must be zero width)
#   Postfix characters (must be zero width)
# Outputs:
#   Generated line
#######################################
echo::line() {

  local line_length
  line_length=$(tput cols)

  local fill_string
  fill_string=${1:-" "}

  local maybe_shortened_string
  maybe_shortened_string="${2:0:$line_length}"

  local string_length
  string_length=${#maybe_shortened_string}

  local fill_characters_length
  fill_characters_length=${#fill_string}

  echo -n -e "$3"
  echo -n "${maybe_shortened_string}"

  for ((i = string_length; i < line_length; i+=fill_characters_length)); do
    echo -n "${fill_string:0:$((line_length-i))}"
  done

  echo -e "$4"
}

if [[ $0 =~ echo.sh$ ]]; then
  echo::error "This is an error."
  echo::info "This should render as info."
  echo::warn "This should render as warning."
  echo::success "This should render as success."
  echo::head "This is the header."

  echo::line "-"
  echo::line "*" "Filled with stars "
  echo::line ":-) " "Filled with pattern "
  echo::line "─" "" "${C_ERROR}" "${C_NORMAL}"
  echo::line "" "Successful" "${C_SUCCESS}${C_REVERSE}" "${C_NORMAL}"
fi
