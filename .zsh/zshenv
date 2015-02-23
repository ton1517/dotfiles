#--------------------------------------------------------------------------------
# path
#--------------------------------------------------------------------------------

#----------------------------------------
# path settings
#----------------------------------------

## 重複したパスを登録しない。
typeset -U path

path=(
      $HOME/bin(N-/)
      $HOME/local/bin(N-/)
      /opt/local/bin(N-/)
      /usr/local/bin(N-/)
      /usr/bin(N-/)
      /bin(N-/)
      /sbin(N-/)
      /usr/local/sbin(N-/)
      /opt/local/sbin(N-/)
      /usr/sbin(N-/)
      /usr/pkg/sbin(N-/)
     )

#----------------------------------------
# man path settings
#----------------------------------------
## 重複したパスを登録しない。
typeset -U manpath

manpath=(
         $HOME/local/share/man(N-/)
         /opt/local/share/man(N-/)
         /usr/local/share/man(N-/)
         /usr/share/man(N-/)
        )

#----------------------------------------
# environment path settings
#----------------------------------------

export PYTHONSTARTUP=~/.pythonstartup

#--------------------------------------------------------------------------------
# other
#--------------------------------------------------------------------------------

#----------------------------------------
# language
#----------------------------------------

export LANG=en_US.UTF-8
export LC_ALL=$LANG

#----------------------------------------
# pager settings
#----------------------------------------

# ページャの設定
if type lv > /dev/null 2>&1; then
    ## lvを優先する。
    export PAGER="lv"
else
    ## lvがなかったらlessを使う。
    export PAGER="less"
fi

# lvの設定
export LV="-c -l"

if [ "$PAGER" != "lv" ]; then
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

# lessの設定
## -R: ANSIエスケープシーケンスのみ素通しする。
## 2012-09-04
export LESS="-R"

#----------------------------------------
# grep settings
#----------------------------------------

# grepの設定
## GNU grepがあったら優先して使う。
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi
## grepのバージョンを検出。
grep_version="$(grep --version | head -n 1 | sed -e 's/^[^0-9.]*\([0-9.]*\)[^0-9.]*$/\1/')"
## デフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
case "$grep_version" in
    1.*|2.[0-4].*|2.5.[0-3])
    ;;
    *)
    ### grep 2.5.4以降のみの設定
        ### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
    GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
    ;;
esac
### 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
## 管理用ディレクトリを無視する。
if grep --help 2>&1 | grep -q -- --exclude-dir; then
    GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
fi
### 可能なら色を付ける。
if grep --help 2>&1 | grep -q -- --color; then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi

#----------------------------------------
# editor
#----------------------------------------

export EDITOR=vim
## vimがなくてもvimでviを起動する。
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

#----------------------------------------
# git pager
#----------------------------------------

if command -v diff-highlight > /dev/null && command -v nkf > /dev/null; then
    export GIT_PAGER='diff-highlight | nkf -w | less -R'
elif command -v lv > /dev/null; then
    export GIT_PAGER='lv -c'
fi
