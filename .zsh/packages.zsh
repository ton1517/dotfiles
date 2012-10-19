#--------------------------------------------------------------------------------
# plugin settings
#--------------------------------------------------------------------------------

source ~/.zsh/packages/package.zsh/package.zsh

#----------------------------------------
# zsh-completions
#----------------------------------------

package-install github zsh-users/zsh-completions
fpath=($(package-directory zsh-users/zsh-completions)/src $fpath)

#----------------------------------------
# cdd
#----------------------------------------

package-install github m4i/cdd
source $(package-directory m4i/cdd)/cdd

#----------------------------------------
# z
#----------------------------------------

package-install github rupa/z
source $(package-directory rupa/z)/z.sh

precmd() {
      _z --add "$(pwd -P)"
}

#----------------------------------------
# zaw
#----------------------------------------

package-install github nakamuray/zaw
source $(package-directory nakamuray/zaw)/zaw.zsh

bindkey '^R' zaw-history

#----------------------------------------
# zsh-syntax-highlighting
#----------------------------------------

package-install github zsh-users/zsh-syntax-highlighting
source $(package-directory zsh-users/zsh-syntax-highlighting)/zsh-syntax-highlighting.zsh
