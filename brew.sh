#!/usr/bin/env bash

set -euo pipefail

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
  autojump \
  ctag \
  direnv \
  Schniz/tap/fnm \
  fzf \
  git \
  neovim \
  python \
  ripgrep \
  rbenv

brew cask install \
  clipy \
  devdocs \
  google-chrome \
  insomnia \
  iterm2 \
  itsycal \
  karabiner-elements \
  ngrok \
  omnidisksweeper
  selfcontrol \
  sensiblesidebuttons \
  slack \
  spectacle \
  spotify \
  sublime-text \
  vimr \
  visual-studio-code \
  webtorrent
