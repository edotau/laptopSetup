#!/bin/bash
set -eou pipefail

echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor

brew install \
	bash \
	bash-completion \
	make \
	cmake \
	git \
	git-extras \
	curl \
	wget \
	rsync \
	golang \
	golangci-lint \
	gcc-aarch64-embedded \
	typescript \
	node \
	yarn \
	php \
	awscli

brew install coreutils \
	gnutls \
	less \
	vim \
	macvim \
	gzip \
	unzip \
	screen \
	watch \
	file-formula \
	openssh

brew tap hashicorp/tap && brew install hashicorp/tap/terraform

brew install \
	htslib \
	samtools \
	bcftools 

mkdir -p /opt/mports/macports-base && rm /opt/mports/macports-base && \
	sudo git clone https://github.com/macports/macports-base.git /opt/mports/macports-base && \
	sudo chown -R ${USER}:admin /opt/mports/macports-base && \
	cd /opt/mports/macports-base && \
	git checkout v2.7.2 && \
	./configure --enable-readline && \
	make && \
	make install && \
	make distclean

sudo xcode-select --install

sudo port -N install \
	coreutils \
	gnutls \
	util-linux \
	zlib \
	lzlib \
	lz4 \
	lzma \
	libzip \
	libidn \
	libtool \
	libiconv \
	glib2 \
	bzip2 \
	zip \
	grep \
	openssl \
	glib-openssl \
	flex \
	swig \
	file \
	gettext \
	m4 \
	perl \
	fastjar \
	openjdk17 \
	openjdk7-zulu \
	xxhashlib \
	boost \
	boost-jam \
	boost-build \
	asciidoc

