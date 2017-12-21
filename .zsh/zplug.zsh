source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-completions'

zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:'fzf'
zplug "junegunn/fzf", as:command, use:'bin/fzf-tmux'
zplug "junegunn/fzf", as:plugin, use:'shell/completion.zsh'
zplug "~/.zsh/fzf.zsh", from:local


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
