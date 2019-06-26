# 履歴の設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

# Emacs キーバインド
bindkey -e

# 色を使う
autoload -U colors
colors

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types
# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt
# 日本語ファイル名等8ビットを通す
setopt print_eight_bit
# 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt extended_glob
# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots
# タブキーの連打で自動的にメニュー補完
setopt AUTO_MENU
# /foo/barでいきなりcd
setopt AUTO_CD
# "~$var" でディレクトリにアクセス
setopt AUTO_NAME_DIRS
# 補完が/で終って、つぎが、語分割子か/かコマンドの後(;とか&)だったら、補完末尾の/を取る
unsetopt AUTO_REMOVE_SLASH
# 曖昧な補完で、自動的に選択肢をリストアップ
setopt AUTO_LIST
# 変数名を補完する
setopt AUTO_PARAM_KEYS
# プロンプト文字列で各種展開を行なう
setopt PROMPT_SUBST
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt AUTO_RESUME
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt MARK_DIRS
# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt GLOBDOTS
# 行の末尾がバッククォートでも無視する
setopt SUN_KEYBOARD_HACK
# ~hoge以外にマッチする機能を使わない
setopt EXTENDED_GLOB
# 補完対象のファイルの末尾に識別マークをつける
setopt LIST_TYPES
# BEEPを鳴らさない
setopt NO_BEEP
# 補完候補など表示する時はその場に表示し、終了時に画面から消す
setopt ALWAYS_LAST_PROMPT
# cd kotaで/home/kotaに移動する
setopt CDABLE_VARS
# クォートされていない変数拡張が行われたあとで、フィールド分割
setopt SH_WORD_SPLIT
# 定義された全ての変数は自動的にexportする
setopt ALL_EXPORT
# ディレクトリ名を補完すると、末尾がスラッシュになる。
setopt AUTO_PARAM_SLASH
# 普通のcdでもスタックに入れる
setopt AUTO_PUSHD
# 補完候補を詰めて表示
setopt LIST_PACKED
# ディレクトリスタックに、同じディレクトリを入れない
setopt PUSHD_IGNORE_DUPS
# 複数のリダイレクトやパイプに対応
setopt MULTIOS
# ファイル名を数値的にソート
setopt NUMERIC_GLOB_SORT
# 補完候補リストの日本語を正しく表示
setopt PRINT_EIGHT_BIT
# 余分な空白は詰めて記録
setopt HIST_IGNORE_SPACE
# ヒストリファイルを上書きするのではなく、追加するようにする
setopt APPEND_HISTORY
# ヒストリに時刻情報もつける
setopt EXTENDED_HISTORY
# 履歴がいっぱいの時は最も古いものを先ず削除
setopt HIST_EXPIRE_DUPS_FIRST
# 履歴検索中、重複を飛ばす
setopt HIST_FIND_NO_DUPS
# 前のコマンドと同じならヒストリに入れない
setopt HIST_IGNORE_DUPS
# 重複するヒストリを持たない
setopt HIST_IGNORE_ALL_DUPS
# 履歴をインクリメンタルに追加
setopt INC_APPEND_HISTORY
# 履歴から冗長な空白を除く
setopt HIST_REDUCE_BLANKS
# 履歴を共有
setopt SHARE_HISTORY
# 古いコマンドと同じものは無視
setopt HIST_SAVE_NO_DUPS
# 補完時にヒストリを自動的に展開する
setopt HIST_EXPAND
# 改行コードで終らない出力もちゃんと出力する
setopt NO_PROMPTCR
# ディレクトリの最後のスラッシュを自動で削除
unsetopt AUTOREMOVESLASH
# コマンドラインでも # 以降をコメントと見なす
setopt INTERACTIVE_COMMENTS
# 語の途中でもカーソル位置で補完
setopt COMPLETE_IN_WORD
# フロー制御をオンにする
setopt noflowcontrol

bindkey "^I" menu-complete # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)

# 補完をする
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=2

# グループ名に空文字列を指定すると，マッチ対象のタグ名がグループ名に使われる。
# したがって，すべての マッチ種別を別々に表示させたいなら以下のようにする
zstyle ':completion:*' group-name ''

# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
# apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*' use-cache true
#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#履歴のインクリメンタル検索でワイルドカード利用可能
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

function branch-status-check() {
    local prefix branchname suffix
    sharp='\uE0B0'
    FIRST_B='237m%}'
    FIRST='001m%}'
    FG='%{\e[38;5;'
    BG='%{\e[30;48;5;'
    RESET='%{\e[0m%}'
    # .gitの中だから除外
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        echo ${FG}${FIRST_B}${sharp}${RESET}
        return
    fi
    branchname=$(get-branch-name)
    # ブランチ名が無いので除外
    if [[ -z $branchname ]]; then
        echo ${FG}${FIRST_B}${sharp}${RESET}
        return
    fi
    prefix=$(get-branch-status) #色だけ返ってくる
    echo "${BG}${prefix}m%}${FG}${FIRST_B}${sharp}${RESET}${BG}${prefix}m%}${branchname}${RESET}${FG}${prefix}m%}${sharp}${RESET}"
}
function get-branch-name() {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo $(git rev-parse --abbrev-ref HEAD 2>/dev/null)
}
function get-branch-status() {
    local res color
    output=$(git status --short 2>/dev/null)
    if [ -z "$output" ]; then
        res=':' # status Clean
        color='002' # green
    elif [[ $output =~ "[\n]?\?\? " ]]; then
        res='?:' # Untracked
        color='003' # yellow
    elif [[ $output =~ "[\n]? M " ]]; then
        res='M:' # Modified
        color='001' # red
    else
        res='A:' # Added to commit
        color='004' # cyan
    fi
    # echo ${color}${res}'%{'${reset_color}'%}'
    echo ${color} # 色だけ返す
}

PROMPT='`left-prompt`'
RPROMPT='[%*]'
function left-prompt() {
    FIRST='178m%}'
    FIRST_B='237m%}'
    SECOND='007m%}'
    SECOND_B='067m%}'

    sharp='\uE0B0'
    FG='%{\e[38;5;'
    BG='%{\e[30;48;5;'
    RESET='%{\e[0m%}'
    USER_AND_HOST="${BG}${FIRST_B}${FG}${FIRST}"
    DIR="${BG}${SECOND_B}${FG}${SECOND}"
    echo "${USER_AND_HOST}%~${RESET}`branch-status-check`$ "
}

# setup nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# setup pyenv
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# setup rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# setup gopath
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Macの時はosx用の設定を読む
# Macのコマンドパスが変わるのでaliasの上に書く
if [ $(uname) = "Darwin" ]; then
    source ~/.zshrc.osx
fi

alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias sl="ls"

# 色付きのgrep拡張
grep() { command grep --color=tty "$@"; }

# cdコマンドでgitのtoprevelにすぐに移動できるように変更
cd() {
    local pjroot
    pjroot=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -z $1 ]; then
        if [ -z $pjroot ]; then
            builtin cd
        else
            if [ $pjroot = `pwd` ]; then
                builtin cd
            else
                builtin cd $pjroot
            fi
        fi
    else
        builtin cd $1
    fi
}
