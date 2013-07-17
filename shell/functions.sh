#!/bin/zsh

# cd + ls
function cd { builtin cd "$@"; ls++ }

# copy and follow file(s) to new dir
function cpf {
  if [[ -d $*[-1] ]]; then
    cp $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    cp $* && cd ${*[-1]%/*}
  fi
}

# move and follow file(s) to new dir
function mvf {
  if [[ -d $*[-1] ]]; then
    mv $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    mv $* && cd ${*[-1]%/*}
  fi
}

# Gentoo specific
function genv {
  sudo . "/etc/profile"
  sudo env-update
}

# Update fonts
function upf {
  builtin cd "$HOME/.fonts"
  mkfontdir
  mkfontscale
  fc-cache -vf
  xset fp rehash
}

# Package count
function pck { print "There are $(pacman -Q | wc -l) packages installed on your system." }
