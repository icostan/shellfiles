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
  checkbashisms
  # consul
  chromedriver
  ctags
  curl
  docker
  # docker-completion
  elixir
  emacs
  erlang
  ffmpeg
  fleetctl
  git
  gnu-prolog
  go
  graphicsmagick
  heroku-toolbelt
  hub
  imagemagick
  ispell
  leiningen
  mackup
  markdown
  midnight-commander
  mongodb
  mysql
  node
  packer
  postgresql
  pow
  python
  redis
  ruby-completion
  terminal-notifier
  terraform
  the_silver_searcher
  tig
  tree
  vagrant-completion
  wget
)
brew install ${binaries[@]}

echo '==> Cleaning up brew recipes...'
brew cleanup

echo '==> Running doctor...'
brew doctor

echo '==> Done.'

