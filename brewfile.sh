#!/bin/bash

brews=(
    autoconf
    automake
    awscli
    bat
    brew-pip
    coreutils
    ctags
    curl
    diff-so-fancy
    direnv
    exa
    expect
    fd
    fzf
    gawk
    gh
    ghq
    git
    git-delta
    gpg
    htop
    httpie
    imagemagick
    jhead
    jpeg
    jq
    less
    libtool
    libxslt
    libyaml
    lua
    luajit
    lv
    mise
    moreutils
    neovim
    ncurses
    nkf
    oath-toolkit
    openssl
    pngquant
    python
    python3
    readline
    ripgrep
    shellcheck
    source-highlight
    the_silver_searcher
    tig
    tmux
    tree
    unixodbc
    unzip
    vim
    watch
    wget
    yq
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
