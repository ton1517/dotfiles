#!/bin/bash

brews=(
    awscli
    bat
    brew-pip
    ctags
    curl
    diff-so-fancy
    direnv
    gh
    ghq
    git
    htop
    imagemagick
    jhead
    jpeg
    jq
    lua
    luajit
    lv
    moreutils
    neovim
    nkf
    oath-toolkit
    pngquant
    python
    python3
    shellcheck
    source-highlight
    the_silver_searcher
    tig
    tmux
    tree
    vim
    watch
    wget
    zsh
)

casks=(
    alacritty
    alfred
    authy
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
    brew install --cask "$app"
done
