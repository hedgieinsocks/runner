#!/usr/bin/zsh

SCRIPTS_DIR="${HOME}/scripts"

function run {
  # Arguments: $1 - HOST:PORT (if no PORT provided, presume 22)
  ssh "root@${1%:*}" -p "$(awk -F: '{print $2 ? $2 : "22"}' <<< "${1}")" "bash -s" -- < "${SCRIPTS_DIR}/${2}" "${@:3}"
}

function _complete_run {
  [[ "${#COMP_WORDS[@]}" -eq 3 ]] && COMPREPLY=(compgen -W "$(ls ${SCRIPTS_DIR})")
}

complete -F _complete_run run
