#!/bin/bash

if !(which brew > /dev/null); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew install mas
brew bundle
cp -f $(brew --cellar ricty)/*/share/fonts/Ricty*.ttf ~/Library/Fonts
fc-cache -vf

if [ ! -f ~/Documents/Japanesque.itermcolors ]; then
  (cd ~/Documents && curl -sLO https://raw.githubusercontent.com/aereal/dotfiles/master/colors/Japanesque/Japanesque.itermcolors)
fi