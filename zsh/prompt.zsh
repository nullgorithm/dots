#!/bin/zsh

autoload -U vcs_info && vcs_info

local FMT_ACTION="%F{8}(%F{3}%a%F{8}%f)"
local FMT_BRANCH="%F{11}%B%b%%b%f"
local FMT_REPO="%s:%F{7}%B%r%%b%f"
local PS_USER="%(#.%F{1}.%F{3})%n%f"
local PS_MACH="%F{1}%M%f"
local PS_PWD="%F{5}%~%f"
local PS_TTY="%F{4}%y%f"
local PS_EXIT="%(?..%F{202}%?%f)"

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr       "%K{235}%F{62}D%F{237}IRTY%f%k"
zstyle ':vcs_info:*' stagedstr         "%K{235}%F{62}S%F{237}TAGED%f%k"
zstyle ':vcs_info:git:*' formats       "%F{9}(${FMT_REPO}%F{9}) ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:hg:*'  formats       "%F{13}(${FMT_REPO}%F{13}) ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:svn:*' formats       "%F{14}(${FMT_REPO}%F{14}) ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:git:*' actionformats "%F{9}(${FMT_REPO}%F{9}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"
zstyle ':vcs_info:hg:*'  actionformats "%F{13}(${FMT_REPO}%F{13}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"
zstyle ':vcs_info:svn:*' actionformats "%F{14}(${FMT_REPO}%F{14}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"

precmd() {
  vcs_info
  RPROMPT=${vcs_info_msg_0_}
  PS1="${PS_EXIT} ${PS_VENV}${PS_PENV}%F{14}%~ %F{11}»%f "
  [ $VIRTUAL_ENV ] && local PS_VENV="%F{10}(venv:%f%B${VIRTUAL_ENV##*/}%b%F{10})%f %B$(python -V 2>&1 | cut -d ' ' -f 2)%b "
  [ $PENV_ENV ] && local PS_PENV="%F{11}(venv:%f%B${PENV_ENV##*/}%b%F{11})%f %B$(perl -v | sed -e '2!d' -e 's/.*v\([5-6]\.[0-9]\{2\}\.[0-9]*\).*/\1/')%b "
}
