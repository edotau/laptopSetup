
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi
export CLICOLOR=1
export TERM=xterm-256color

export GOROOT=/usr/local/go
export GOPATH=$HOME
export GOBIN=${GOPATH}/bin
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export CC=/usr/bin/gcc-11
export CXX=/usr/bin/g++-11
export CFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"

alias gcc=$CC
alias g++=$CXX

# conda init "$(basename "${SHELL}")"
# conda deactivate

export PATH=$PATH:/opt/local/bin
# alias ram="system_profiler SPHardwareDataType | grep 'Memory:'"
# export BASH_SILENCE_DEPRECATION_WARNING=1
# alias rmStopDocker="docker rm $(docker ps -a -q)"
# alias rmALlUntaged="docker rmi $(docker images | grep "^<none>" | awk "{print $3}")"

