#!/bin/bash
set -e

sudo echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew install \
	bash \
	bash-completion \
	make \
	cmake \
	git \
	git-extras \
	golang \
	golangci-lint \
	openjdk \
	typescript \
	node \
	yarn \
	php \
	perl \
	awscli

# gnu and basic linux utils 
brew update && brew install \
	coreutils \
	gnutls \
	util-linux \
	gcc-aarch64-embedded \
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
	gnu-tar  \
	pigz \
	bzip2 \
	zip \
	unzip \
	gzip \

# library support for gnu, gcc, g++, and others
brew update && brew install \
	zlib \
	lzlib \
	libtool \
	libiconv \
	isl \
	mpc \
	gdb \
	glib \
	glibc \
	glibmm \
	libb2 \
	mpfr \
	lz4 \
	lzma \
	xz \
	m4 \
	apt \
	file-formula \
	pkg-config \
	openssl \
	glib-openssl \
	boost \
	boost-mpi \
	boost-build \
	gettext \
	asciidoc \
	help2man \
	xxhash

# terraform: used to program infrastructure
brew tap hashicorp/tap && brew install hashicorp/tap/terraform

# Command line program for generating flag code references.
brew tap launchdarkly/tap && brew install ld-find-code-refs
#  homebrew/cask/r and conda
# basic genomic tools to look at sequence data
brew update && brew install \
	htslib \
	samtools \
	bcftools

