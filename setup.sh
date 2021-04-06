#!/bin/bash
set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
chmod +x Miniconda3-latest-MacOSX-x86_64.sh
./Miniconda3-latest-MacOSX-x86_64.sh

echo 'export BASH_SILENCE_DEPRECATION_WARNING=1' >> ~/.bash_profile
# Set CLICOLOR if you want Ansi Colors in iTerm2 
echo 'export CLICOLOR=1' >> ~/.bash_profile
# Set colors to match iTerm2 Terminal Colors
echo 'export TERM=xterm-256color' >> ~/.bash_profile
