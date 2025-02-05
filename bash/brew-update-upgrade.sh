#!/bin/bash
echo "" > ~/.config/bash/brew-update-upgrade.log
export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH  # Ensure Homebrew is in the PATH
brew update
brew upgrade
brew cleanup
