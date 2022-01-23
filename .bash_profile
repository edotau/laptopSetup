
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

export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR=1
export TERM=xterm-256color
export GOROOT=/usr/local/go
export GOPATH=$HOME
export GOBIN=${GOPATH}/bin
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eric.au/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/eric.au/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eric.au/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/eric.au/bin/google-cloud-sdk/completion.bash.inc'; fi
