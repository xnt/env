#!/bin/bash
#
# Backup relevant files

files=( ".vimrc" ".bash_profile" ".bashrc" )

for f in "${files[@]}"
do
  :
  cp "${HOME}/${f}" .
done
