#!/bin/sh

brews=(
    "git --with-gettext --with-pcre"
    "vim --with-lua --with-luajit --with-python3"
    brew-pip
    caskroom/cask/brew-cask
    ctags
    curl
    ghq
    global
    go
    hub
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
    neovim
    nkf
    node
    python
    python3
    reattach-to-user-namespace
    source-highlight
    the_platinum_searcher
    the_silver_searcher
    tig
    tmux
    tree
    uncrustify
    watch
    wget
    zsh
)

casks=(
    alfred
    atom
    bartender
    bettertouchtool
    caffeine
    charles
    docker
    kitematic
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
    brew install $app
done

# brew cask
for app in "${casks[@]}"
do
    brew cask install $app
done
