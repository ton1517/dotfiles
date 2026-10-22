#!/bin/bash

function symlink() {
    orig=$1
    dest=$2

    # 実体のディレクトリがあるとその中にリンクが作られてしまうため退避する
    if [ -d "$dest" ] && [ ! -L "$dest" ]; then
        mv "$dest" "$dest.bak" && echo "backup: $dest -> $dest.bak"
    fi

    if [ "$(readlink "$dest")" != "$orig" ]; then
        ln -sni "$orig" "$dest"
    fi
}

cd "$(dirname "$0")" || exit

# OSごとのファイル名に使う (darwin / wsl)
if [ -n "$WSL_DISTRO_NAME" ]; then
    os=wsl
else
    os=$(uname | tr '[:upper:]' '[:lower:]')
fi

touch ".config/zsh/zshrc.local"
touch ".config/zsh/zshenv.local"
touch ".config/zsh/zprofile.local"
touch ".config/git/config.local"

# symlink dotfile
symlink "$PWD/.zshenv" "$HOME/.zshenv"

# symlink config file
mkdir -p "$HOME/.config"
for conffile in .config/*
do
    symlink "$PWD/$conffile" "$HOME/$conffile"
done

# OS固有のセットアップ (Homebrewのインストールなど)
if [ -e "setup/$os.sh" ]; then
    source "setup/$os.sh"
fi

# install brew packages
if type "brew" > /dev/null 2>&1; then
    brew bundle --file=Brewfile
    if [ -e "Brewfile.$os" ]; then
        brew bundle --file="Brewfile.$os"
    fi
fi

# install mise languages
if type "mise" > /dev/null 2>&1; then
  mise install -y
fi
