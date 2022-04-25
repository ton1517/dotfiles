#!/bin/bash

brews=(
    awscli
    bat
    brew-pip
    ctags
    curl
    diff-so-fancy
    direnv
    fd
    fzf
    gh
    ghq
    git
    git-delta
    htop
    imagemagick
    jhead
    jpeg
    jq
    less
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
    ripgrep
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
    google-japanese-ime
    istat-menus
    karabiner-elements
    visual-studio-code
    stay
)

# install homebrew
if ! command -v brew > /dev/null 2>&1 ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
