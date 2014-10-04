#!/usr/bin/env sh
set -e

if test ! $(which brew); then
  echo '==> Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo '==> Found homebrew. Carry on...'
fi

echo '==> Updating brew recipes...'
brew update

echo '==> Upgrading existing recipes...'
brew upgrade

echo '==> Installing binaries...'
binaries=(
  ack
  bash-completion
  boot2docker
  cheat
  consul
  ctags
  curl
  docker
  emacs
  ffmpeg
  git
  go
  graphicsmagick
  hub
  ispell
  mackup
  markdown
  midnight-commander
  mongodb
  mysql
  node
  packer
  postgresql
  python
  redis
  ruby-completion
  terraform
  the_silver_searcher
  tig
  tree
  vagrant
  vagrant-completion
  wget
)
brew install ${binaries[@]}

echo '==> Cleaning up brew recipes...'
brew cleanup

echo '==> Running doctor...'
brew doctor

echo '==> Done.'

