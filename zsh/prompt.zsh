#!/bin/zsh

autoload -Uz vcs_info
# setopt prompt_subst

precmd() {
  vcs_info
  prompt_minimal dark
}

zstyle ':vcs_info:*' enable git svn cvs

prompt_full() {
  PS1="%F{3}$USER%F{7}@%F{2}$HOST%F{7}:%F{4}$TTY %F{8}[%F{6}%~%F{8}]
%F{10}%#%f "
  RPS1="${vcs_info_msg_0_}"
}

prompt_minimal() {
  case $1 in
    dark)
      zstyle ':vcs_info:*' formats "%F{8}(%F{1}%s%F{8})-[%F{5}%b%F{8}]%f"
      PS1="%(0?..%F{1}%B%?%b )%F{8}(%F{3}%B%~%b%F{8}) %B%F{14}%#%F%b "
      RPS1="${vcs_info_msg_0_}"
      ;;
    bright)
      zstyle ':vcs_info:*' formats "%F{8}(%F{9}%s%F{8})-[%F{13}%b%F{8}]%f"
      PS1="%(0?..%F{9}%B%?%b )%F{8}(%F{9}%B%~%b%F{8}) %B%F{10}%#%F%b "
      RPS1="${vcs_info_msg_0_}"
      ;;
  esac
}
