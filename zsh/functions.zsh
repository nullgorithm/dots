#!/bin/zsh

# cd + ls
function cd { builtin cd "$@"; ls++ }

# One line
function cpf() { cp "$@" && goto "$_"; }
function mvf() { mv "$@" && goto "$_"; }
function mkf() { mkdir -p $1; cd $1 }
function pck { print "There are $(pacman -Q | wc -l) packages installed on your system." }

# Extract/compress various archive types with a single command
function ext() {
  case $1 in

    e)
      case $2 in
        *.tar.bz2)   tar xvjf $2      ;;
        *.tar.gz)    tar xvzf $2      ;;
        *.bz2)       bunzip2 $2       ;;
        *.rar)       unrar x $2       ;;
        *.gz)        gunzip $2        ;;
        *.tar)       tar xvf $2       ;;
        *.tbz2)      tar xvjf $2      ;;
        *.tgz)       tar xvzf $2      ;;
        *.zip)       unzip $2         ;;
        *.Z)         uncompress $2    ;;
        *.7z)        7z x $2          ;;
        *)           echo "'$2' couldn't be extracted." ;;
      esac ;;

    c)
      case $2 in
        *.tar.*)    arch=$2; shift 2;
          tar cvf ${arch%.*} $@
          case $arch in
            *.gz)   gzip -9r ${arch%.*}   ;;
            *.bz2)  bzip2 -9zv ${arch%.*} ;;
          esac                                ;;
        *.rar)      shift; rar a -m5 -r $@; rar k $1    ;;
        *.zip)      shift; zip -9r $@                   ;;
        *.7z)       shift; 7z a -mx9 $@                 ;;
        *)          echo "Could not compress '$2'."     ;;
      esac ;;

    *)
      echo "Wrong!" ;;

  esac
}

# Gentoo specific
function genv {
  sudo source "/etc/profile"
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

# List most used commands
function mostused() {
  sed -n 's/^\([a-z]*\) .*/\1/p' $HISTFILE |
  sort |
  uniq -c |
  sort -n -k1 |
  tail -25 |
  tac
}

# Create iso from device or directory
function mkiso() {
  case $1 in
    /dev/*)
      dd if=$1 of=$2 ;;
    *)
      mkisofs -o $2 $1 ;;
  esac
}

# Create a github repo
function mkgit() {
  mkdir $1
  cd $1
  git init
  touch README.md
  git add README.md
  git commit -m 'inital setup - automated'
  git remote add origin git@github.com:suare/$1.git
  git push origin master
}
