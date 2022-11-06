# dotfiles

## install

```bash
sh install.sh
```

## change shell

1. add `/opt/homebrew/bin/zsh` path in /etc/shells
2. exec `chpass -s /opt/homebrew/bin/zsh`

## adsf direnv

### setup

```bash
asdf direnv setup --shell zsh --version system
```

### cache shims per project

```bash
asdf direnv local
```
