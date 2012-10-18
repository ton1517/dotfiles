#!/bin/sh

cd $(dirname $0)

touch ".zsh/zshrc.local"
touch ".zsh/zshenv.local"
touch "$HOME/.gitconfig.local"

for dotfile in .?*
do
    if [ $dotfile != ".." ] && [ $dotfile != ".git" ] && [ $dotfile != ".gitmodules" ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done


