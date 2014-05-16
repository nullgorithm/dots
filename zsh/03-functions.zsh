#!/usr/bin/env zsh

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

lsd() {
  vdir --human-readable --color --group-directories-first\
    --indicator-style=slash
}

pkgs() {
  print "There are $(tput setaf 3)$(pacman -Q | wc -l)$(tput sgr0)\
 packages installed in this system."
}

cfg() {
  case "$1" {
    'bspwm') { "$EDITOR" "${XDG_CONFIG_HOME}/bspwm/bspwmrc" } ;;
    'infinality') { sudoedit "/etc/profile.d/infinality-settings.sh" } ;;
    'ncmpcpp') { "$EDITOR" "${HOME}/.ncmpcpp/config" } ;;
    'pacman') { sudoedit "/etc/pacman.conf" } ;;
    'tmux') { "$EDITOR" "${HOME}/.tmux.conf" } ;;
    'vim') { "$EDITOR" "${HOME}/.vimrc" } ;;
    'x11') { sudoedit "/etc/X11/xorg.conf" } ;;
    'xresources') { "$EDITOR" "${XDG_CONFIG_HOME}/X11/Xresources" } ;;
    'xinit') { "$EDITOR" "${XDG_CONFIG_HOME}/X11/xinitrc" } ;;
    'zsh') { "$EDITOR" "${HOME}/.zshrc" } ;;
    *) { print "Unknown application ("$1")" } ;;
  }
}
