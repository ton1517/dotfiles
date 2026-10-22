# dotfiles

Mac / WSL(Ubuntu) 対応

## install

```bash
bash install.sh
```

- `setup/<os>.sh` : OS固有のセットアップ (Homebrewのインストールなど)
- `Brewfile` : 共通のパッケージ / `Brewfile.<os>` : OS固有のパッケージ
- `.config/zsh/os/<os>.zsh` : OS固有のzsh設定

## change shell (Mac)

1. add `/opt/homebrew/bin/zsh` path in /etc/shells
2. exec `chpass -s /opt/homebrew/bin/zsh`

WSLでは `setup/wsl.sh` で `/usr/bin/zsh` に変更される

## WSL

- Nerd Font (HackGen35 Console NF) はWindows側にインストールし、Windows Terminalで設定する
