#----------------------------------------
# open
#----------------------------------------

# Windowsの既定のアプリでファイル・ディレクトリ・URLを開く
function open() {
    local target=${1:-.}
    [[ -e $target ]] && target=$(wslpath -w "$target")
    explorer.exe "$target"
}

#----------------------------------------
# ssh-agent
#----------------------------------------

# WSLではログイン時にssh-agentが起動しないため、起動していなければ起動する
# 全シェルで同じagentを使うため、ソケットを ~/.ssh/ssh_auth_sock に固定する
if [[ ! -S $SSH_AUTH_SOCK ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
    ssh-add -l > /dev/null 2>&1
    # 2: agentに接続できない
    if (( $? == 2 )); then
        rm -f $SSH_AUTH_SOCK
        eval "$(ssh-agent -s -a $SSH_AUTH_SOCK)" > /dev/null
    fi
fi
