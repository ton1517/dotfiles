#----------------------------------------
# source zshenv
#----------------------------------------

source ~/.zsh/zshenv

#----------------------------------------
# local settings
#----------------------------------------
# PC固有の設定を追加するときは
# ~/.zsh/zshenv.local ファイルを作成し
# その中に記述すること
local_settings=~/.zsh/zshenv.local
if [ -e $local_settings ]; then
    source $local_settings
fi
