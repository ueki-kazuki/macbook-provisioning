#!/bin/bash

if !(which brew > /dev/null); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
if !(which mas > /dev/null); then
    echo "install mas-cli..."
    brew install mas
fi
brew bundle

num_newfonts=$(find $(brew --cellar ricty)/*/share/fonts/Ricty*.ttf -mtime -1 -ls 2>&1 | wc -l)
if [ ${num_newfonts} -gt 0 ]; then
    echo "update font cache..."
    cp -f $(brew --cellar ricty)/*/share/fonts/Ricty*.ttf ~/Library/Fonts
    fc-cache -vf
fi

if [ ! -f ~/Documents/Japanesque.itermcolors ]; then
  (cd ~/Documents && curl -sLO https://raw.githubusercontent.com/aereal/dotfiles/master/colors/Japanesque/Japanesque.itermcolors)
fi
