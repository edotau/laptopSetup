export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ericau/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ericau/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ericau/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ericau/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH:~/bin/kentUtils
export PATH="/usr/local/opt/sqlite/bin:$PATH:/Users/ericau/bin/google-cloud-sdk/bin"
#export PATH="/Users/ericau/miniconda3/envs/genomics/bin:/usr/local/opt/sqlite/bin:/Users/ericau/bin:/usr/local/go/bin:/usr/local/opt/m4/bin:/Users/ericau/miniconda3/bin:/Users/ericau/miniconda3/condabin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/VMware\ Fusion.app/Contents/Public:/usr/local/go/bin:/Users/ericau/bin/kentUtils"

# Created by `pipx` on 2021-04-06 16:49:27
export PATH="$PATH:/Users/ericau/.local/bin"

[[ -s "/Users/ericau/.gvm/scripts/gvm" ]] && source "/Users/ericau/.gvm/scripts/gvm"

alias duke_vpn="/Users/ericau/scratch/duke_vpn.sh; /Users/ericau/bin/sshpass-1.08/sshpass -p Sparkyx2x2x2@invitae ssh eha17@hardac-login.genome.duke.edu"
export USER_AT_HOST=eha17@hardac-login.genome.duke.edu
export PUBKEYPATH=$HOME/.ssh/id_rsa.pub
alias vpn=/opt/cisco/anyconnect/bin/vpn
alias startup="conda activate genome_discovery"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ericau/src/github.com/goFish/api_google/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ericau/src/github.com/goFish/api_google/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ericau/src/github.com/goFish/api_google/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ericau/src/github.com/goFish/api_google/google-cloud-sdk/completion.bash.inc'; fi

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.7/lib"
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
