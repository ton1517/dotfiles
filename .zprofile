#----------------------------------------
# source zprofile
#----------------------------------------

source ~/.zsh/zprofile

#----------------------------------------
# local settings
#----------------------------------------
local_settings=~/.zsh/zprofile.local
if [ -e $local_settings  ]; then
    source $local_settings
fi
