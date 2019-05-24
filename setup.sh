#!/bin/sh
workdir=`pwd`

for file in `git ls-files | cut -d/ -f1 | uniq | grep -v setup.sh`; do
  ln -s ${workdir}/${file} $HOME/$file
done
