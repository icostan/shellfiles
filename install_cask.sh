#!/usr/bin/env sh
set -e

echo '==> Installing cask...'
brew install caskroom/cask/brew-cask

echo '==> Updating cask recipes...'
brew cask update

echo '==> Installing apps...'
apps=(
  appcleaner
  dropbox
  firefox
  flux
  google-chrome
  serf
  skype
  transmission
  transmit
  vagrant
  virtualbox
  vlc
)
brew cask install --appdir='/Applications' ${apps[@]}

echo '==> Cleaning up cask recipes...'
brew cask cleanup

echo '==> Running doctor...'
brew cask doctor

echo '==> Done.'
