#!/bin/zsh

setopt \
  autocd \
  cdable_vars \
  auto_list \
  auto_name_dirs \
  auto_param_keys \
  auto_remove_slash \
  complete_aliases \
  ksh_glob \
  append_history \
  hist_ignore_all_dups \
  aliases \
  correct \
  multios \
  zle

unsetopt \
  emacs \
  beep \
  list_beep \
  hist_beep \
  mail_warning \
  posix_aliases \
  single_line_zle
