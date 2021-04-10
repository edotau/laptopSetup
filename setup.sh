#!/bin/bash
set -e

# #wget https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget
brew install gcc
brew install python@3.7
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

conda create -n genomics -c bioconda python=3.7 setuptools airflow=2.0.1 trim-galore=0.6.6 bwa samtools=1.12 minimap2 bcftools freebayes multiqc picard=2.25.1 -y
pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib
source ~/.bash_profile

brew install apache2
echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> /Users/ericau/.bash_profile
echo 'export PATH="/usr/local/opt/apr-util/bin:$PATH"' >> /Users/ericau/.bash_profile
#For compilers to find apr you may need to set:
  #export LDFLAGS="-L/usr/local/opt/apr/lib"
  #export CPPFLAGS="-I/usr/local/opt/apr/include"