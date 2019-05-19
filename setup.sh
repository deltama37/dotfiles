#!/bin/sh
workdir=`pwd`

for file in `ls | grep -v setup.sh`; do
  ln -s ${workdir}/${file} $HOME/$file
done
