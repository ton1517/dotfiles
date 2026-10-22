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
# (起動したagentのソケットはzshrcで ~/.ssh/ssh_auth_sock にリンクされる)
if [[ ! -S $SSH_AUTH_SOCK ]]; then
    SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock ssh-add -l > /dev/null 2>&1
    # 2: agentに接続できない
    if (( $? == 2 )); then
        eval "$(ssh-agent -s)" > /dev/null
    fi
fi
