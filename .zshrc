# Emacs キーバインド
bindkey -e

# 色を使う
autoload -U colors
colors

# 補完をする
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# setup nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# project root
alias pjroot="git rev-parse --show-toplevel"

# 色付きのgrep拡張
grep() { command grep --color=tty "$@"; }

cd() {
    PJROOT=`git rev-parse --show-toplevel 2> /dev/null`
    if [ -z $1 ]; then
        if [ -z $PJROOT ]; then
            builtin cd
        else
            if [ `pwd` = $PJROOT ];then
                builtin cd
            else
                builtin cd $PJROOT
            fi
        fi
    else
        builtin cd $1
    fi
}

# Macの時はosx用の設定を読む
if [ `uname` = "Darwin" ]; then
    source ~/.zshrc.osx
fi