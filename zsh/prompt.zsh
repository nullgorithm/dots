#!/bin/zsh

autoload -Uz vcs_info
zstyle ':vcs_info:*'    enable git svn cvs
zstyle ':vcs_info:git*' formats "%F{9}%s%F{7}~%F{8}(%F{10}@%F{6}%b%F{8} %F{1}%u%F{2}%c)"

precmd() {
  vcs_info
  prompt_minimal
}

function prompt_full {
  PS1="%F{3}$(whoami)%F{7}@%F{2}$HOST %F{8}[%F{4}%~%F{8}]
%F{10}%#%f "
  RPS1="${vcs_info_msg_0_}"
}

function prompt_minimal {
  PS1="%F{8}[%F{3}%~%F{8}] %F{10}%#%F "
  RPS1="${vcs_info_msg_0_}"
}
