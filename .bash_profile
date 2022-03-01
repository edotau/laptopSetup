
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

#Dalias python=python3
alias ram="system_profiler SPHardwareDataType | grep 'Memory:'"
#export PATH="/usr/local/opt/python@3.7/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/python@3.7/lib"
#gcloud auth login
alias illuminaadmin="ssh ilmnadmin@172.16.100.195"
alias edotau_illumina="ssh edotau@172.16.100.195"


export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"


alias sql="gcloud sql connect robotnik --access-token-file=/Users/eric.au/.api_keys/robotnik-sql.json"
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
#cat /Users/eric.au/.api_keys/bcr_admin.json | docker login -u _json_key --password-stdin https://us.gcr.io > /dev/null 2>&1
#gcloud auth activate-service-account --quiet --key-file /Users/eric.au/.api_keys/bcr_admin.json
#for i in /Users/eric.au/.api_keys/*.json;
#do
#	gcloud auth activate-service-account --quiet --key-file $i > /dev/null 2>&1
#done

	
alias auth_gcloud="/Users/eric.au/.api_keys/auth.sh"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/usr/local/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/usr/local/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/google-cloud-sdk/completion.bash.inc'; fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/google-cloud-sdk/completion.bash.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/eric.au/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/eric.au/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/eric.au/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/eric.au/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda deactivate
