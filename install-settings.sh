#!/bin/bash
set -eou pipefail

echo "Setting up both bash and vim profiles!
"
./linux-resources/bash-vimrc-profiles.sh

echo "Downloading and installing gcc and g++ complilers as well as other gnu coreutils and packages...
"
./scripts/brew-port-mac-utils.sh

# echo "Installing miniconda3...
# "
# ./scripts/condasetup.sh

# mkdir -p ~/bin/kentUtils
# rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/macOSX.x86_64/ ~/bin/kentUtils/
