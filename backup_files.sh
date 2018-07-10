#!/bin/bash
#
# Backup relevant files

files=( ".vimrc" ".bash_profile" ".bashrc" "Library/Application Support/Code/User/settings.json")

for f in "${files[@]}"
do
  :
  echo "Backing up ${HOME}/${f}"
  cp "${HOME}/${f}" .
done

echo "Writing VSCode extensions list"
rm -f vscode
echo "# Restore with code --install-extension {extension id}" >> vscode
code --list-extensions >> vscode
