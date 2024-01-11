#!/bin/bash

function symlink() {
    orig=$1
    dest=$2

    if [ "$(readlink "$dest")" != "$orig" ]; then
        ln -Fis "$orig" "$dest"
    fi
}

cd "$(dirname "$0")" || exit

touch ".config/zsh/zshrc.local"
touch ".config/zsh/zshenv.local"
touch ".config/zsh/zprofile.local"
touch ".config/git/config.local"

# symlink dotfile
symlink "$PWD/.zshenv" "$HOME/.zshenv"
symlink "$PWD/.tool-versions" "$HOME/.tool-versions"

# symlink config file
mkdir -p "$HOME/.config"
for conffile in .config/*
do
    symlink "$PWD/$conffile" "$HOME/$conffile"
done

# install homebrew
if [[ "$(uname)" == 'Darwin' && -z "$(which brew 2> /dev/null)" ]]; then
    sh ./brewfile.sh
fi

# install mise languages
if type "mise" > /dev/null 2>&1; then
  mise install -y
fi
