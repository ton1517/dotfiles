#!/bin/sh

git submodule init
git submodule update

binDir="$HOME/bin"
mkdir -p $binDir

confDir="$HOME/.config"
mkdir -p $confDir

cd $(dirname $0)

touch ".vim/vimrc.local"
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

for conffile in .config/*
do
    ln -Fis "$PWD/$conffile" $confDir
    echo $PWD/$conffile
done

# install homebrew
if [[ "$(uname)" == 'Darwin' && ! -n "$(which brew 2> /dev/null)" ]]; then
    sh ./brewfile.sh
fi

sh ./.vim/bundle/neobundle.vim/bin/neoinstall

# install fzf
if [ ! -e ~/.fzf ]; then
    git clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
