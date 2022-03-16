#!/bin/bash
set -eou pipefail

echo "Setting up both bash and vim profiles!
"
./linux-resources/bash-vimrc-profiles.sh

echo "Downloading xcode onto new macbook pro!
"
if /usr/bin/xcode-select --version; then
	softwareupdate --all --install --force
else
	sudo rm -rf /Library/Developer/CommandLineTools
	xcode-select --install
	softwareupdate --all --install
fi

echo "Downloading and installing gcc and g++ complilers as well as other gnu coreutils and packages...
"
./scripts/brew-mac-utils.sh

echo "Installing MacPorts to manage nodejs and yarn npm-check -u...
"
sudo ./scripts/macports-install.sh

echo "Using conda to mangage gcc, g++ compiler and gnu libs
"
./scripts/condasetup.sh

echo "Download VS Code: 

https://code.visualstudio.com/download

"

echo "Download NodeJS:

https://nodejs.org/dist/v16.14.1/node-v16.14.1.pkg

"
# mkdir -p ~/bin/kentUtils
# rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/macOSX.x86_64/ ~/bin/kentUtils/
