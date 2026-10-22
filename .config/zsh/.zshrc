# 対話型でない場合は読み込まない
[ -z "$PS1" ] && return

#----------------------------------------
# OS settings
#----------------------------------------
# OS固有の設定は os/darwin.zsh, os/wsl.zsh に記述すること
if [ -n "$WSL_DISTRO_NAME" ]; then
    os_settings=$ZDOTDIR/os/wsl.zsh
else
    os_settings=$ZDOTDIR/os/${OSTYPE%%[-0-9]*}.zsh
fi
if [ -e $os_settings ]; then
    source $os_settings
fi

#----------------------------------------
# source zshrc
#----------------------------------------

source $ZDOTDIR/zshrc

#----------------------------------------
# source plugins
#----------------------------------------

source $ZDOTDIR/zim.zsh

#----------------------------------------
# local settings
#----------------------------------------
# PC固有の設定を追加するときは
# ~/.zsh/zshrc.local ファイルを作成し
# その中に記述すること
local_settings=$ZDOTDIR/zshrc.local
if [ -e $local_settings ]; then
    source $local_settings
fi
