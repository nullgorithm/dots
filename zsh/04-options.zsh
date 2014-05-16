#!/usr/bin/env zsh

setopt aliases \
  appendhistory \
  autocd \
  autolist \
  automenu \
  autonamedirs \
  autoremoveslash \
  banghist \
  completealiases \
  completeinword \
  correct \
  correctall \
  equals \
  extendedglob \
  globdots \
  histignoredups \
  multios \
  vi \
  zle

unsetopt bashautolist \
  beep \
  caseglob \
  dvorak \
  emacs \
  extendedhistory \
  histbeep \
  listbeep \
  menucomplete \
  nullglob \
  verbose
