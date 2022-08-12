#!/bin/bash

function symlink() {
    orig=$1
    dest=$2

    if [ "$(readlink "$dest")" != "$orig" ]; then
        ln -Fis "$orig" "$dest"
    fi
}

git submodule init
git submodule update

cd "$(dirname "$0")" || exit

touch ".vim/vimrc.local"
touch ".zsh/zshrc.local"
touch ".zsh/zshenv.local"
touch ".zsh/zprofile.local"
touch ".config/git/config.local"

# symlink dotfile
for dotfile in .?*
do
    if [ "$dotfile" != ".." ] && [ "$dotfile" != ".git" ] && [ "$dotfile" != ".gitmodules" ] && [ "$dotfile" != ".config" ]
    then
        symlink "$PWD/$dotfile" "$HOME/$dotfile";
    fi
done

# symlink config file
mkdir -p "$HOME/.config"
for conffile in .config/*
do
    symlink "$PWD/$conffile" "$HOME/$conffile"
done
ln -sfh ~/.vim "$XDG_CONFIG_HOME/nvim"

# install homebrew
if [[ "$(uname)" == 'Darwin' && -z "$(which brew 2> /dev/null)" ]]; then
    sh ./brewfile.sh
fi

# install anyenv
 if [ ! -e ~/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv

    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    anyenv init
    anyenv install --init

    mkdir -p ~/.anyenv/plugins

    git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
    git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git

    anyenv install pyenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv

    anyenv install rbenv
    anyenv install nodenv
    anyenv install goenv
fi
