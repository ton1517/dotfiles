# 対話型でない場合は読み込まない
[ -z "$PS1" ] && return

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
