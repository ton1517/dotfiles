#----------------------------------------
# peco
#----------------------------------------

# gitのローカルブランチを選択する
function peco-git-branch-local() {
    local current_buffer=$BUFFER

    local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads | column -t -s '|' | peco | head -n 1 | awk '{print $1}')"

    if [ -n "$selected_line" ]; then
        BUFFER="${current_buffer}${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-git-branch-local
bindkey '^g^b^l' peco-git-branch-local

# gitのリモートブランチを選択する
function peco-git-branch-remote() {
    local current_buffer=$BUFFER

    local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/remotes | column -t -s '|' | peco | head -n 1 | awk '{print $1}')"

    if [ -n "$selected_line" ]; then
        BUFFER="${current_buffer}${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-git-branch-remote
bindkey '^g^b^r' peco-git-branch-remote


# gitで変更のあるファイルを選択する
function peco-git-status() {
    local current_buffer=$BUFFER
    local selected_lines="$(git status --short | peco | awk '{print $NF}')"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-git-status
bindkey "^g^s" peco-git-status

# git logを表示し、選択したコミットのハッシュを返す
function peco-git-log() {
    local current_buffer=$BUFFER
    local selected_line="$( git log --pretty=format:"%h  %cd  %cn  %s" --date=short | peco | awk '{print $1}')"

    if [ -n "$selected_line" ]; then
        BUFFER="${current_buffer}${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-git-log
bindkey "^g^l" peco-git-log

# agで検索し、選択したものをvimで編集する
function agvim () {
    local selected_line="$(ag $@ | peco | head -n 1)"

    if [ -n "$selected_line" ]; then
        vim $(echo ${selected_line} | awk -F : '{print "-c " $2 " " $1}')
    fi
}

# 履歴を選択する
function peco-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    local selected_line="$(history -n 1 | eval $tac | peco --query "$LBUFFER" | head -n 1)"

    if [ -n "${selected_line}" ]; then
        BUFFER="${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-history
bindkey '^r' peco-history

# zを利用し、ディレクトリのあいまい検索を行う
function peco_z() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    local selected_line="$(_z -r 2>&1 | eval $tac | peco --query "$LBUFFER" | awk '{ print $2 }' | head -n 1)"

    if [ -n "${selected_line}" ]; then
        BUFFER="cd ${selected_line}"
        zle accept-line
    fi
}
zle -N peco_z
bindkey "^@" peco_z

function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-src
bindkey '^g^h' peco-src

# カレントディレクトリ内のファイルを選択する
function peco-ls() {
    local current_buffer=$BUFFER
    local selected_lines="$(ls | peco | awk '{print $NF}')"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-ls
bindkey '^l^s' peco-ls
