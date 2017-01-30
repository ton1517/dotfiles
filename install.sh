#!/bin/sh

function symlink() {
    orig=$1
    dest=$2

    if [ "$(readlink $dest)" != "$orig" ]; then
        ln -Fis $orig $dest
    fi
}

git submodule init
git submodule update

cd $(dirname $0)

touch ".vim/vimrc.local"
touch ".zsh/zshrc.local"
touch ".zsh/zshenv.local"
touch ".zsh/zprofile.local"
touch "$HOME/.gitconfig.local"

# symlink dotfile
for dotfile in .?*
do
    if [ $dotfile != ".." ] && [ $dotfile != ".git" ] && [ $dotfile != ".gitmodules" ] && [ $dotfile != ".config" ]
    then
        symlink "$PWD/$dotfile" "$HOME/$dotfile";
    fi
done

# symlink bin file
mkdir -p "$HOME/bin"
for binfile in bin/*
do
    chmod 755 "$PWD/$binfile"
    symlink "$PWD/$binfile" "$HOME/$binfile"
done

# symlink config file
mkdir -p "$HOME/.config"
for conffile in .config/*
do
    symlink "$PWD/$conffile" "$HOME/$conffile"
done

# install homebrew
if [[ "$(uname)" == 'Darwin' && ! -n "$(which brew 2> /dev/null)" ]]; then
    sh ./brewfile.sh
fi

# install zplug
if [ ! -e ~/.zplug ]; then
    git clone -b 2.3.1 https://github.com/zplug/zplug ~/.zplug

fi
