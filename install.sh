#!/bin/sh

binDir="$HOME/bin"
mkdir -p $binDir

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

for binfile in bin/*
do
    chmod 755 "$PWD/$binfile"
    ln -Fis "$PWD/$binfile" $binDir
    echo $PWD/$binfile
done

chmod -R 755 .git_template/

