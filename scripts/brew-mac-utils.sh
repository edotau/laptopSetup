#!/bin/bash
set -e

sudo echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew install \
	bash \
	bash-completion \
	make \
	cmake \
	git \
	golang \
	openjdk \
	perl \
	miniconda \
	typescript \
	r \
	php
	awscli

# gnu and basic linux utils 
brew update && brew install \
	coreutils \
	gnutls \
	curl \
	wget \
	rsync \
	vim \
	macvim \
	screen \
	watch \
	grep \
	less \
	openssh

# basic compression utils
brew update && brew install \
	gnu-tar \
	pigz \
	bzip2 \
	zip \
	gzip \
	unzip

# library support for gnu, gcc, g++, and others
brew update && brew install \
	zlib \
	lzlib \
	libtool \
	libiconv

# terraform: used to program infrastructure
brew tap hashicorp/tap && brew install hashicorp/tap/terraform

# basic genomic tools to look at sequence data
brew update && brew install \
	htslib \
	samtools \
	bcftools

# Linux bin utils
brew update && brew install \
	arm-linux-gnueabihf-binutils \
	binutils \
	util-linux

# exta pkg that might be useful but also might delete
brew update && brew install \
	git-extras \
	golangci-lint

sudo chown -R ${USER}:admin /opt/mports
mkdir -p /opt/mports/macports-base && rm -r /opt/mports/macports-base
git clone https://github.com/macports/macports-base.git /opt/mports/macports-base
cd /opt/mports/macports-base && git checkout v2.7.2 
./configure --enable-readline \
	&& make -j 10 \
	&& make -j 10 install \
	&& make -j 10 distclean