#!/bin/bash

exercise::run() {

  local exercise
  exercise=$1

  basename="${exercise%.*}"
  export EXERCISE_STATEFILE="${PWD}/.exercise_state"
  exercise::reset_state
  export EXERCISE_NAME="${basename##*/}"

  header::set "$(echo::line "" "${EXERCISE_NAME}" "${C_REVERSE}" "${C_NORMAL}")"

  message::start

  if [[ -x "${basename}.before" ]]; then
    "${basename}.before"
  fi

  if [[ "${exercise}" =~ \.bashrc$ ]]; then
    bash --rcfile "${exercise}"
  elif [[ -x "${exercise}" ]]; then
    "${exercise}" && exercise::set_success
  else
    echo::error "${exercise} cannot be started. Execute flag is missing."
    exit 1
  fi

  if [[ -x "${basename}.after" ]]; then
    "${basename}.after"
  fi

  header::set

  exercise::is_success
}

exercise::set_state() {
  if [[ ! ${EXERCISE_STATEFILE} ]]; then
    echo::error "State file for exercise not set."
    return 1
  fi

  if [[ ! -w ${EXERCISE_STATEFILE} ]]; then
    echo::error "State file for exercise not found nor writeable."
    return 1
  fi

  echo "$@" >"${EXERCISE_STATEFILE}"
}

exercise::get_state() {
  if [[ ! ${EXERCISE_STATEFILE} ]]; then
    echo::error "State file for exercise not set."
    return 1
  fi

  if [[ ! -r ${EXERCISE_STATEFILE} ]]; then
    echo::error "State file for exercise not found nor readable."
    return 1
  fi

  cat "${EXERCISE_STATEFILE}"
}

exercise::reset_state() {
  true >"${EXERCISE_STATEFILE}"
}

exercise::set_success() {
  exercise::set_state "SUCCESS"
}

exercise::is_success() {
  [[ $(exercise::get_state) = "SUCCESS" ]]
}
