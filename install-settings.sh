#!/bin/bash
set -eou pipefail

echo "Setting up both bash and vim profiles!
"
./linux-resources/bash-vimrc-profiles.sh

echo "Downloading xcode onto new macbook pro!
"
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
softwareupdate --all --install --force

echo "Downloading and installing gcc and g++ complilers as well as other gnu coreutils and packages...
"
./scripts/brew-mac-utils.sh

echo "Using conda to mangage gcc, g++ compiler and gnu libs
"

./scripts/condasetup.sh

echo "Installing MacPorts to manage nodejs and yarn npm-check -u...
"
sudo ./scripts/macports-install.sh

# mkdir -p ~/bin/kentUtils
# rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/macOSX.x86_64/ ~/bin/kentUtils/
