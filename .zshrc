# 対話型でない場合は読み込まない
[ -z "$PS1" ] && return

#----------------------------------------
# source zshrc
#----------------------------------------

source ~/.zsh/zshrc

#----------------------------------------
# source plugins
#----------------------------------------

source ~/.zsh/zim.zsh

#----------------------------------------
# local settings
#----------------------------------------
# PC固有の設定を追加するときは
# ~/.zsh/zshrc.local ファイルを作成し
# その中に記述すること
local_settings=~/.zsh/zshrc.local
if [ -e $local_settings ]; then
    source $local_settings
fi
