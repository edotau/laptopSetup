#!/bin/bash

set -eou pipefail

chown -R ${USER}:staff /opt/mports
mkdir -p /opt/mports/macports-base && rm -r /opt/mports/macports-base
git clone https://github.com/macports/macports-base.git /opt/mports/macports-base
cd /opt/mports/macports-base \
	&& git checkout v2.7.2 

./configure --enable-readline \
	&& make -j $(nproc) \
	&& make -j $(nproc) install \
	&& make -j $(nproc) distclean

export PATH=/opt/local/bin:$PATH

port -d selfupdate && port upgrade outdated

# # port select --set python python310

# mkdir -p /opt/local/lib/node_modules \
# 	&& chown -R ${USER}:staff /opt/local/lib/node_modules

# npm install -y yarn
# npm install -y create-react-app

