#----------------------------------------
# fzf
#----------------------------------------

#--------------------
# option
#--------------------

export FZF_TMUX=1
export FZF_DEFAULT_OPTS="--color=fg+:11 -m -x --reverse --bind 'ctrl-j:preview-down' --bind 'ctrl-k:preview-up'"

function __fzfcmd() {
    [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -p 80%" || echo "fzf"
}

#--------------------
# git
#--------------------

# gitのローカルブランチを選択する
function fzf-git-branch-local() {
    local current_buffer=$BUFFER

    local selected_lines="$(
        git for-each-ref --color=always --format='%(color:yellow)%(refname:short)|%(color:blue)%(committerdate:relative)|%(color:reset)%(subject)' --sort=-committerdate refs/heads \
        | column -t -s '|' \
        | $(__fzfcmd) --ansi --preview 'git log --color=always --format="%C(magenta)%h %C(blue)%cd %C(green)%<(12,trunc)%cn %C(auto)%d %C(auto)%s" --date=short {+1}' \
        | awk '{print $1}'
    )"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-git-branch-local
bindkey '^g^b' fzf-git-branch-local

function fzf-git-branch-remotes() {
    local current_buffer=$BUFFER

    local selected_lines="$(
        git for-each-ref --color=always --format='%(color:yellow)%(refname:short)|%(color:blue)%(committerdate:relative)|%(color:reset)%(subject)' --sort=-committerdate refs/remotes \
        | column -t -s '|' \
        | $(__fzfcmd) --ansi --preview 'git log --color=always --format="%C(magenta)%h %C(blue)%cd %C(green)%<(12,trunc)%cn %C(auto)%d %C(auto)%s" --date=short {+1}' \
        | awk '{print $1}'
    )"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-git-branch-remotes
bindkey '^g^r^b' fzf-git-branch-remotes

# see https://petitviolet.hatenablog.com/entry/20190708/1562544000
function select_file_from_git_status() {
  unbuffer git status -u --short \
      | $(__fzfcmd) -m --ansi  --preview-window=right:70% --preview 'f() {
      local original=$@
      set -- $(echo "$@");
      if [ $(echo $original | grep -E "^MM" | wc -l) -eq 1 ]; then
        echo "\e[32m\n----------------------------------------\n# staged diff \n----------------------------------------"
        git diff --color --cached $2 | delta
        echo "\e[31m\n----------------------------------------\n# unstaged diff \n----------------------------------------"
        git diff --color $2 | delta
      elif [ $(echo $original | grep -E "^M" | wc -l) -eq 1 ]; then
        git diff --color --cached $2 | delta
      elif [ $(echo $original | grep -E "^\?\?" | wc -l) -eq 0 ]; then
        git diff --color $2 | delta
      elif [ -d $2 ]; then
        ll $2
      else
        git diff --color --no-index /dev/null $2  | delta
      fi
    }; f {}' \
    | awk '{print $NF}'
}

# gitで変更のあるファイルを選択する
function fzf-git-status() {
    local current_buffer=$BUFFER
    local selected_lines="$(select_file_from_git_status)"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-git-status
bindkey "^g^s" fzf-git-status

# gitで変更のあるファイルを選択してgit addする
function fzf-git-add() {
    local current_buffer=$BUFFER
    local selected_lines="$(select_file_from_git_status)"

    if [ -n "$selected_lines" ]; then
        BUFFER="git add ${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
        zle .accept-line
    fi
}
zle -N fzf-git-add
bindkey "^g^a" fzf-git-add

# git logを表示し、選択したコミットのハッシュを返す
function fzf-git-log() {
    local current_buffer=$BUFFER
    local selected_line="$(
        git log --color=always --format="%C(magenta)%h %C(blue)%cd %C(green)%<(12,trunc)%cn %C(auto)%d %C(auto)%s" --date=short \
        | $(__fzfcmd) --ansi --preview "git show --color=always {+1} | delta --width=${FZF_PREVIEW_COLUMNS:-$COLUMNS}" \
        | awk '{print $1}'
    )"

    if [ -n "$selected_line" ]; then
        BUFFER="${current_buffer}${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-git-log
bindkey "^g^l" fzf-git-log

#--------------------
# misc
#--------------------

# agで検索し、選択したものをvimで編集する
function agvim () {
    local selected_line="$(ag $@ | $(__fzfcmd) | head -n 1)"

    if [ -n "$selected_line" ]; then
        vim $(echo ${selected_line} | awk -F : '{print "-c " $2 " " $1}')
    fi
}

# 履歴を選択する
function fzf-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    local selected_line="$(history -n 1 | eval $tac | $(__fzfcmd) --no-sort --query "$LBUFFER" | head -n 1)"

    if [ -n "${selected_line}" ]; then
        BUFFER="${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-history
bindkey '^r' fzf-history

# zを利用し、ディレクトリのあいまい検索を行う
function fzf-z() {
    local current_buffer=$BUFFER
    local selected_line="$(_z -l $current_buffer 2>&1 | $(__fzfcmd) +s --tac | awk '{ print $2 }' | head -n 1)"

    if [ -n "${selected_line}" ]; then
        BUFFER="cd ${selected_line}"
        zle .accept-line
    fi
}
zle -N fzf-z
bindkey "^z" fzf-z

function fzf-ghq() {
    local selected_dir=$(ghq list -p | $(__fzfcmd) --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle .accept-line
    fi
}
zle -N fzf-ghq
bindkey '^g^h' fzf-ghq

# ファイル検索
# cd が入力されていた場合は選択したファイルのディレクトリを返す
function fzf-files() {
    local current_buffer=$BUFFER
    local selected_lines="$(ag -l --hidden --ignore .git -g "" | $(__fzfcmd) --preview 'bat --color always {-1}')"

    if [ -n "$selected_lines" ]; then
        if [[ $current_buffer =~ cd ]]; then
            selected_lines=$(dirname "$selected_lines")
        fi
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-files
bindkey '^l^s' fzf-files

# locateを使ってファイルを検索する
function fzf-locate() {
    local current_buffer=$BUFFER
    local selected_lines="$(locate / | $(__fzfcmd) -q "$LBUFFER")"
    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-locate
bindkey '^l^o' fzf-locate

# tmuxが開いているpaneのディレクトリに移動する
function cdd() {
    local selected_line="$(tmux list-panes -s -F "#I.#P:#{pane_current_path}" | $(__fzfcmd) | head -n 1)"

    if [ -n "$selected_line" ]; then
        cd $(echo ${selected_line} | awk -F : '{print $2}')
    fi
}

#--------------------
# docker
#--------------------

# dockerコンテナにshで入る
function fzf-docker-sh() {
    local selected_line="$(docker ps --format "{{.ID}} {{.Names}} {{.Image}} {{.Command}}" | $(__fzfcmd) | awk '{ print $1}')"

    if [ -n "$selected_line" ]; then
        BUFFER="docker exec -it $selected_line sh"
        zle .accept-line
    fi
}
zle -N fzf-docker-sh
bindkey '^d^s' fzf-docker-sh

# docker exec
function fzf-docker-exec() {
    local selected_line="$(docker ps --format "{{.ID}} {{.Names}} {{.Image}} {{.Command}}" | $(__fzfcmd) | awk '{ print $1}')"

    if [ -n "$selected_line" ]; then
        BUFFER="docker exec -it ${selected_line} "
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-docker-exec
bindkey '^d^e' fzf-docker-exec 

# docker images list
function fzf-docker-images() {
    local current_buffer=$BUFFER
    local selected_lines="$(docker images --format "{{.ID}} {{.Repository}} {{.Tag}} {{.CreatedSince}} {{.Size}}" | $(__fzfcmd) | awk '{ print $1}' | tr '\n' ' ')"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}${selected_lines}"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-docker-images
bindkey '^d^i' fzf-docker-images

# docker containers list
function fzf-docker-ps() {
    local current_buffer=$BUFFER
    local selected_lines="$(docker ps -a --format "{{.ID}} {{.Names}} {{.Image}} {{.Command}}" | $(__fzfcmd) | awk '{ print $1}' | tr '\n' ' ')"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}${selected_lines}"
        CURSOR=$#BUFFER
    fi
}
zle -N fzf-docker-ps
bindkey '^d^p' fzf-docker-ps
