# Emacs キーバインド
bindkey -e

# 色を使う
autoload -U colors
colors

# 補完をする
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Macの時はosx用の設定を読む
if [ `uname` = "Darwin" ]; then
    . ~/.zshrc.osx
fi