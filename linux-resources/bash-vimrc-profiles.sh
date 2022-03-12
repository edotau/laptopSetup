#!/bin/bash
set -e

echo "First: setting up vim profile and color theme ...
"

rm -rf ~/.vim && cp -r linux-resources/vim-resources/ ~/.vim

touch ~/.vimrc && rm ~/.vimrc
cp linux-resources/vimrc-mac-linux.txt ~/.vimrc

cat ~/.vimrc

echo "Done: vim profile setup complete!
"

echo "Next: Setting up bash profile and color theme ...
"

touch ~/.bashrc && rm ~/.bashrc
cp linux-resources/linux-bashrc.txt ~/.bashrc

cat ~/.bashrc

touch ~/.bash_profile && rm ~/.bash_profile
cp linux-resources/macos-bash-profile.txt ~/.bash_profile

cat linux-resources/macos-bash-profile.txt

cat ~/.bash_profile

echo "Done: bash_profile and bashrc mac profile setup is complete!
"

