dotfiles
========

how to use
----------

### 1. install.sh
    sh install.sh
で設定ファイルのシンボリックリンクをホームディレクトリ直下に配置します。
既に設定ファイルがある場合は予め退避しておいてください。

更に、自動的に

* ~/.zsh/zshrc.local
* ~/.zsh/zshenv.local
* ~/.gitconfig.local

が追加されます。

### 2. submodules
    git submodules init
    git submodules update

### 3. restart zsh
zshを再起動するとzshプラグインがgit cloneされます。

### 4. vim plugins
vimを起動し

    :NeoBundleInstall

を実行してください。
プラグインがgit cloneされます。

config
------

### .gitconfiig
PC固有の設定を追加する場合は、

    git config -f ~/.gitconfig.local user.name hoge

のように、~/.gitconfig.localに追加してください。

### zshrc, zshenv
PC固有の設定を追加する場合は、

* ~/.zsh/zshrc.local
* ~/.zsh/zshenv.local

に設定を追加してください。この2つは自動的に読み込まれます。

### zsh plugins
zshのプラグインはpackage.zshで管理しています。

[see clear-code/zsh.d](https://github.com/clear-code/zsh.d)

プラグインを追加したい場合は~/.zsh/packages.zshに追加してください。

### vim plugins
vimのプラグインはneobundle.vimで管理しています。

[see Shougo/neobundle.vim](https://github.com/Shougo/neobundle.vim)

プラグインを追加したい場合は~/.vim/vimpluginに追加してください。
