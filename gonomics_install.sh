#!/bin/bash
set -eou pipefail
release_list=https://golang.org/dl/
SOURCE=https://storage.googleapis.com/golang
arch_probe="uname -m"
os=$(uname -s | tr "[:upper:]" "[:lower:]")

arch=$($arch_probe)
case "$arch" in
    i*)
        arch=386
        ;;
    x*)
        arch=amd64
        ;;
    aarch64)
        #arch=armv6l
        arch=arm64
        ;;
    armv7l)
        # Go project does not provide a binary release for armv71
        echo 'armv7l is not supported, using armv6l'
        arch=armv6l
        ;;
esac

queryReleaseList() {
    local fetch="$*"
    if hash "jq" 2>/dev/null; then
        local rl="$release_list?mode=json"
        $fetch "$rl" | jq -r '.[].files[].version' | sort | uniq | grep -v -E 'go[0-9\.]+(beta|rc)'| sed -e 's/go//' | sort -V
    else
        $fetch "$release_list" | grep -v -E 'go[0-9\.]+(beta|rc)' | grep -E -o 'go[0-9\.]+' | grep -E -o '[0-9]\.[0-9]+(\.[0-9]+)?' | sort -V | uniq
    fi
}

fetchUpdate() {
    local last=
    local fetch=
    if hash "wget" 2>/dev/null; then
	fetch="wget -qO-"
    elif hash "curl" 2>/dev/null; then
	fetch="curl --silent"
    fi
    last=$(queryReleaseList "$fetch" | tail -1)
    if echo "$last" | grep -q -E '[0-9]\.[0-9]+(\.[0-9]+)?'; then
	    release=$last
    fi
}

fetchUpdate

label=go$release.$os-$arch
FILENAME=$label.tar.gz
URL=$SOURCE/$FILENAME

wget $URL
tar xf $FILENAME -C $HOME; rm $FILENAME

# Setting up bash profile for go root, path, and bin
if [ "$SHELL" == "/bin/bash" ]; then
    echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
    echo 'export GOPATH=$HOME' >> ~/.bashrc
    echo 'export GOBIN=${GOPATH}/bin' >> ~/.bashrc
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
fi

# Setting up zsh profile for go root, path, and bin if your default shell is zsh
if [ "$SHELL" == "*zsh*" ]; then
    echo 'export GOROOT=/usr/local/go' >> ~/.zshrc
    echo 'export GOPATH=$HOME' >> ~/.zshrc
    echo 'export GOBIN=${GOPATH}/bin' >> ~/.zshrc
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
fi

GITHUB=~/src/github.com

if ! [ -e "$GITHUB" ] ; then
    echo "mkdir -p $GITHUB"
    mkdir -p $GITHUB
fi

if ! [ -e "$GOBIN" ] ; then
    echo "mkdir -p $GOBIN"
    mkdir -p $GOBIN
fi

vertgenlab=${GITHUB}/vertgenlab
gonomics=${vertgenlab}/gonomics

if ! [ -e "$gonomics" ] ; then
    git clone https://github.com/vertgenlab/gonomics.git $gonomics
fi

cd $gonomics
go test ./...

##
####if [ $(uname -s | tr "[:upper:]" "[:lower:]") == "darwin" ]; then
    # Mac OS X platform
    ####wget https://golang.org/dl/go1.16.3.darwin-amd64.pkg

    ####installer -pkg *go*darwin-amd64.pkg -target /usr/local/
    # Need to figure out how to handle this better, but there is a race condition here
    # Script goes on even thought golang isn't done installing
    ####sleep 7
    # clean up
    ####rm *go*darwin-amd64.pkg
####elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux match
    ####wget  https://golang.org/dl/go1.16.3.src.tar.gz
    ####tar xf *go*.src.tar.gz
    ####rm *go*.src.tar.gz
####else
    # Do something under 64 bits Windows
  ####  echo 'Apologies, only MacOS and Linux systems can be automated for the time being...'
####fi
####