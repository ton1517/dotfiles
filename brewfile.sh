#!/bin/bash

brews=(
    "git --with-gettext --with-pcre2"
    "vim --with-lua --with-luajit --with-python3"
    awscli
    bat
    brew-pip
    ctags
    curl
    diff-so-fancy
    ghq
    htop
    hub
    hugo
    imagemagick
    jhead
    jpeg
    jq
    lua
    luajit
    lv
    macvim
    mercurial
    mobile-shell
    moreutils
    mycli
    neovim
    nkf
    pngquant
    python
    python3
    shellcheck
    source-highlight
    the_silver_searcher
    tig
    tmux
    tree
    watch
    wget
    zsh
)

casks=(
    alacritty
    alfred
    atom
    bartender
    bettertouchtool
    charles
    dash
    docker
    google-chrome
    google-japanese-ime
    istat-menus
    iterm2
    karabiner-elements
    vagrant
    virtualbox
    visual-studio-code
)

# install homebrew
if ! command -v brew > /dev/null 2>&1 ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew
for app in "${brews[@]}"
do
    brew install "$app"
done

# brew cask
for app in "${casks[@]}"
do
    brew cask install "$app"
done
