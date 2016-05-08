source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-completions'

zplug 'm4i/cdd', as:plugin, use:'cdd'

zplug 'rupa/z', as:plugin, use:'z.sh'

zplug 'zsh-users/zsh-syntax-highlighting', nice:10

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:'fzf'
zplug "junegunn/fzf", as:command, use:'bin/fzf-tmux'
zplug "junegunn/fzf", as:plugin, use:'shell/completion.zsh'
zplug "~/.zsh/fzf.zsh", from:local

zplug 'b4b4r07/enhancd', use:'enhancd.sh'
# if zplug check b4b4r07/enhancd; then
#     # setting if enhancd is available
#     export ENHANCD_FILTER=fzf-tmux
# fi


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
