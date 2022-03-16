#!/bin/bash
set -eou pipefail

# sudo rm -rf ~/miniconda3
brew update && brew install miniconda
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh \
# 	&& bash Miniconda3-latest-MacOSX-x86_64.sh -b -y && rm Miniconda3-latest-MacOSX-x86_64.sh 

conda config --add channels conda-forge
conda config --add channels defaults
conda config --add channels bioconda


