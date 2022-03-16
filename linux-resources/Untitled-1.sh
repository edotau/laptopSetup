#!/bin/bash
set -e

MacOSX=11.1.0
WORK_DIR=~/miniconda3/gcc-MacOSX

mkdir -p $WORK_DIR && cd $WORK_DIR
curl -L https://ftpmirror.gnu.org/gcc/gcc-${MacOSX}/gcc-${MacOSX}.tar.xz | tar xf -
cd gcc-${MacOSX} && ./contrib/download_prerequisites
mkdir build && cd build

../configure --prefix=/usr/local/gcc-${MacOSX}-MacOSX --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk --program-suffix=-${MacOSX}-MacOSX
../configure --prefix=/usr/local/gcc-${MacOSX}-MacOSX --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk --program-suffix=-${MacOSX}-MacOSX
make -j $(nproc) && make $(nproc) install-strip

export PATH=/usr/local/gcc-${MacOSX}/bin:$PATH

sudo rm -r $WORK_DIR