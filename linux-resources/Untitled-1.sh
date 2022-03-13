#!/bin/bash
set -e

curl -L https://ftpmirror.gnu.org/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz | tar xf -
cd gcc-11.2.0
contrib/download_prerequisites
cd ~/gcc_all/gcc-11.2.0
mkdir build && cd build

../configure --prefix=/usr/local/gcc-11.2.0 --enable-checking=release --enable-languages=c,c++ --program-suffix=-11.2-macos