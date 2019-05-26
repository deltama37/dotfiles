#!/bin/sh
workdir=`pwd`

# ファイルが存在する場合は削除する場合は一度ファイルをどうするか確認させる

for file in `git ls-files | cut -d/ -f1 | uniq | grep -v setup.sh`; do
# シンボリックリンクが存在する場合はシンボリックリンクを削除する
# osごとの設定ファイルはos次第にする
  ln -s ${workdir}/${file} $HOME/$file
done
