#!/usr/bin/env zsh

autoload -U vcs_info

zstyle ':vcs_info:*'      enable git
zstyle ':vcs_info:*'      check-for-changes true
zstyle ':vcs_info:*'      unstagedstr " %B%K{235}%F{10}D%F{7}IRTY%f%k%b"
zstyle ':vcs_info:*'      stagedstr   " %B%K{235}%F{62}S%F{240}TAGED%f%k%b"
zstyle ':vcs_info:git:*'  formats     "%F{8}(%F{11}%b%F{8})%f% %u%c"

ARROW="%F{10}%B%#%b%f"
DIR="%F{6}%~%f"
EXITNUM="%(0?..%F{9}%? )"

precmd() {
  vcs_info
  RPROMPT="${vcs_info_msg_0_}"
  case "$TERM" {
    *xterm*)
      print -Pn "\e]0;%n@%M: %~\a" ;; # this is for the window title
  }
}

PROMPT=" ${EXITNUM}${ARROW} "
SPROMPT="Correct %B%F{1}%R%f%b to %B%F{2}%r%b? %F{8}(%F{15}nyae%F{8})%f "
