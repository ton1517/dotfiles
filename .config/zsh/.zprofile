#----------------------------------------
# source zprofile
#----------------------------------------

source $ZDOTDIR/zprofile

#----------------------------------------
# local settings
#----------------------------------------
local_settings=$ZDOTDIR/zprofile.local
if [ -e $local_settings  ]; then
    source $local_settings
fi
