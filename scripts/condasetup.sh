#!/bin/bash
set -eou pipefail

# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh \
#	&& bash Miniconda3-latest-MacOSX-x86_64.sh -b -y && rm Miniconda3-latest-MacOSX-x86_64.sh 

# install miniconda using brew 
brew update && brew install miniconda

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda install -c conda-forge gcc=11.2.0

