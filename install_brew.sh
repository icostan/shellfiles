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

echo '==> Tapping completions...'
brew tap homebrew/completions

echo '==> Installing binaries...'
binaries=(
  ack
  bash-completion
  boot2docker
  bundler-completion
  cheat
  checkbashisms
  chromedriver
  ctags
  curl
  docker
  docker-completion
  elixir
  emacs --with-cocoa
  erlang
  ffmpeg
  git
  go
  gpg
  heroku-toolbelt
  hub
  imagemagick
  ispell
  leiningen
  mackup
  markdown
  memcached
  mongodb
  node
  postgresql
  pow
  python
  rebar
  redis
  rake-completion
  rails-completion
  ruby-completion
  terminal-notifier
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

