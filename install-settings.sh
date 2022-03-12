#!/bin/bash
set -e

echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> /Users/ericau/.bash_profile
export LDFLAGS="-L/usr/local/opt/python@3.7/lib"

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
chmod +x Miniconda3-latest-MacOSX-x86_64.sh
./Miniconda3-latest-MacOSX-x86_64.sh

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

mkdir -p ~/bin/kentUtils
rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/macOSX.x86_64/ ~/bin/kentUtils/

echo 'export BASH_SILENCE_DEPRECATION_WARNING=1' >> ~/.bash_profile
# Set CLICOLOR if you want Ansi Colors in iTerm2 
echo 'export CLICOLOR=1' >> ~/.bash_profile
# Set colors to match iTerm2 Terminal Colors
echo 'export TERM=xterm-256color' >> ~/.bash_profile
# Set paths for kentUtils and conda bin
echo 'export PATH=~/miniconda3/bin:$PATH:~/bin/kentUtils' >> ~/.bash_profile
