#!/usr/bin/env bash

set -euo pipefail

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install autojump rbenv fzf neovim direnv git ctags

brew cask install google-chrome slack ngrok vimr karabiner-elements insomnia itsycal clipy sensiblesidebuttons spectacle selfcontrol devdocs spotify iterm2 omnidisksweeper
