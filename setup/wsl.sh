#!/bin/bash
# install.sh から source される

# Homebrew・mise(ruby等のビルド)に必要なパッケージ
sudo apt-get update
sudo apt-get install -y \
    build-essential procps curl file git unzip zsh locales \
    libssl-dev libyaml-dev zlib1g-dev libffi-dev libreadline-dev libgmp-dev

# zshenvで指定しているロケールを生成する
if ! locale -a | grep -qx 'en_US.utf8'; then
    sudo locale-gen en_US.UTF-8
fi

# install homebrew
if [ ! -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Windowsのクリップボードを使うためのコマンド (nvimが自動で使う)
if [ ! -x "$HOME/.local/bin/win32yank.exe" ]; then
    tmpdir=$(mktemp -d)
    curl -fsSL -o "$tmpdir/win32yank.zip" \
        https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
    mkdir -p "$HOME/.local/bin"
    unzip -o "$tmpdir/win32yank.zip" win32yank.exe -d "$HOME/.local/bin"
    chmod +x "$HOME/.local/bin/win32yank.exe"
    rm -rf "$tmpdir"
fi

# change shell
if [ "$(getent passwd "$USER" | cut -d: -f7)" != /usr/bin/zsh ]; then
    chsh -s /usr/bin/zsh
fi
