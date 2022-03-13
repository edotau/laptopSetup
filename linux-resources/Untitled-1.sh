#!/bin/bash
set -e

curl -L https://ftpmirror.gnu.org/gcc/gcc-10.1.0/gcc-10.1.0.tar.xz | tar xf -
cd gcc-10.1.0
./contrib/download_prerequisites

mkdir build && cd build

../configure --prefix=/usr/local/gcc-10.1-MacOSX --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk --program-suffix=-10.1-MacOSX