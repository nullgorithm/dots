#!/usr/bin/env zsh

precmd() { print -Pn "\e]0;%n@%M:%~\a" }

# cd() { builtin cd "$@"; ls++ }
mvf() { mv -v "$@"; cd "$@" }
cpf() { cp -v "$@"; cd "$@" }
mkf() { mkdir -v "$@"; cd "$@" }
xfont() { xrdb -query | grep "font" }

upf() {
  mkfontdir "$HOME/.fonts"
  mkfontscale "$HOME/.fonts"
  fc-cache -v
}

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[38;5;246m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}
