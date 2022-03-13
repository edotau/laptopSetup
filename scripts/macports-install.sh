#!/bin/bash

set -eou pipefail

chown -R ${USER}:staff /opt/mports
mkdir -p /opt/mports/macports-base && rm -r /opt/mports/macports-base
git clone https://github.com/macports/macports-base.git /opt/mports/macports-base
cd /opt/mports/macports-base \
	&& git checkout v2.7.2 

./configure --enable-readline \
	&& make -j 10 \
	&& make -j 10 install \
	&& make -j 10 distclean

port -d selfupdate
port -N install nodejs16 typescript
port select --set python python310

mkdir -p /opt/local/lib/node_modules \
	&& chown -R ${USER}:staff /opt/local/lib/node_modules

npm install -y yarn
npm install -y create-react-app

