#!/bin/sh

brews=(
    caskroom/cask/brew-cask
    brew-pip
    ctags
    curl
    "git --with-gettext --with-pcre"
    global
    go
    imagemagick
    jhead
    jpeg
    lua
    luajit
    lv
    macvim
    mercurial
    mobile-shell
    moreutils
    nkf
    node
    peco
    pyenv
    pyenv-virtualenv
    python
    python3
    reattach-to-user-namespace
    the_silver_searcher
    tig
    tmux
    tree
    uncrustify
    "vim --with-lua --with-luajit --with-python3"
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
    flash-player
    flash-player-debugger
    google-chrome
    google-japanese-ime
    istat-menus
    iterm2
    karabiner
    licecap
    limechat
    totalfinder
    vagrant
    virtualbox
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
