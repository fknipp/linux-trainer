C_ERROR="\033[0;1;7;31m"
C_INFO="\033[0;1;34m"
C_WARN="\033[0;1;31m"
C_SUCCESS="\033[0;1;4;32m"
C_NORMAL="\033[0m"

echo::error() {
  echo -e "${C_ERROR}$@${C_NORMAL}"
}

echo::info() {
  echo -e "${C_INFO}$@${C_NORMAL}"
}

echo::warn() {
  echo -e "${C_WARN}$@${C_NORMAL}"
}

echo::success() {
  echo -e "${C_SUCCESS}$@${C_NORMAL}"
}

# echo::error "This is an error."
# echo::info "This should render as info."
# echo::warn "This should render as warning."
# echo::success "This should render as success."