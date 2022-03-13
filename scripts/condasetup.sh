#!/bin/bash
set -eou pipefail

sudo rm -rf ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh \
	&& bash Miniconda3-latest-MacOSX-x86_64.sh -b -y && rm Miniconda3-latest-MacOSX-x86_64.sh 

export PATH=$PATH:"~/miniconda3/condabin"
export PATH=$PATH:"~/miniconda3/bin"

conda config --add channels conda-forge
conda config --add channels defaults
conda config --add channels bioconda

MacOSX=11.2.0
WORK_DIR="~/miniconda3/gcc-MacOSX"

cd ~/miniconda3

curl -L https://ftpmirror.gnu.org/gcc/gcc-${MacOSX}/gcc-${MacOSX}.tar.xz | tar xf -
cd gcc-${MacOSX} && ./contrib/download_prerequisites
mkdir build && cd build

../configure --prefix=/usr/local/gcc-${MacOSX}-MacOSX --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk --program-suffix=-${MacOSX}-MacOSX
make -j $(nproc) && sudo make -j $(nproc) install-strip

export PATH=/usr/local/gcc-${MacOSX}/bin:$PATH

sudo rm -r $WORK_DIR

