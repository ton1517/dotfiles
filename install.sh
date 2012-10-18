#!/bin/sh

ignorefiles=('..' '.git' '.gitmodules')

cd $(dirname $0)

touch ".zsh/zshrc.local"
touch ".zsh/zshenv.local"
touch "$HOME/.gitconfig.local"

for dotfile in .?*
do
    for ignorefile in ${ignorefiles[@]}
    do
        if [ $dotfile == $ignorefile ]
        then
            continue 2
        fi
    done

    ln -Fis "$PWD/$dotfile" $HOME
done


