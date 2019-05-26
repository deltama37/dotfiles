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
    if [ -z $1 ]; then
        if [ -z $(git rev-parse --git-dir 2> /dev/null) ]; then
            builtin cd
        else
            if [ `pwd` = `git rev-parse --show-toplevel` ];then
                builtin cd
            else
                builtin cd `git rev-parse --show-toplevel`
            fi
        fi
    else
        builtin cd $1
    fi
}

# Macの時はosx用の設定を読む
if [ `uname` = "Darwin" ]; then
    . ~/.zshrc.osx
fi