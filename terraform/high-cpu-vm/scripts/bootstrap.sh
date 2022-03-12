#!/bin/bash
set -e

sudo apt-get update \
	&& sudo apt-get install -y apt-transport-https \
	&& sudo apt-get install -y gnupg2 pass

if /usr/bin/docker; then
	echo "PASS: Docker is installed at the correct location"
else
	curl https://get.docker.com | sh \
		&& sudo systemctl --now enable docker
fi

sudo systemctl restart docker \
	&& sudo usermod -aG docker $USER && sudo chmod 777 /var/run/docker.sock


