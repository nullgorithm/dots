#!/bin/zsh

export EDITOR="vim"
export PAGER="vimpager"
export BROWSER="chromium"
export LANG="pt_BR.UTF-8"
export SHELL="/bin/zsh"

export GREP_COLOR="1;31"

export BIN_HOME="${HOME}/bin"
export XDG_CONFIG_HOME="${HOME}/etc"
export XDG_CACHE_HOME="${XDG_DATA_HOME}/cache"
export XDG_DATA_HOME="${HOME}/var"
export XDG_DOWNLOAD_DIR="${HOME}/junk"
export XDG_MUSIC_DIR="/mnt/data/Musics"
export XDG_PICTURES_DIR="/mnt/data/Pics"

export CONCURRENCY_LEVEL=4
export CHOST="x86_64-pc-Linux-gnu"
export CFLAGS="-march=native -j -O2 -pipe"
export CXXFLAGS="${CFLAGS}"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="${XDG_DATA_HOME}/zsh_history"

export PATH="/usr/share/perl5/vendor_perl/auto/share/dist/Cope:/bin:/$HOME/bin:\
/usr/bin:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/local/bin:/sbin"
