#----------------------------------------
# source zshrc
#----------------------------------------

source ~/.zsh/zshrc

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
