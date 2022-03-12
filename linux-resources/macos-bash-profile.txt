
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

export BASH_SILENCE_DEPRECATION_WARNING=1
#alias rmStopDocker="docker rm $(docker ps -a -q)"
#alias rmALlUntaged="docker rmi $(docker images | grep "^<none>" | awk "{print $3}")"
export CLICOLOR=1
export GOROOT=/usr/local/go
export GOPATH=$HOME
export GOBIN=${GOPATH}/bin
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#source "`brew --prefix`/etc/grc.bashrc"
#test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true
export TERM=xterm-256color

alias ram="system_profiler SPHardwareDataType | grep 'Memory:'"


