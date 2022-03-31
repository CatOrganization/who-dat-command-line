if [ "$(uname -s)" == "Darwin" ]; then
    MAC=true
elif [ "$(uname -s)" == "Linux" ]; then
    LINUX=true
fi

# default these to false
MAC=${MAC:-false}
LINUX=${LINUX:-false}
IS_BASH=true

##### set colors #####
export PS1="\[\033[36m\]\u\[\033[m\]\[\033[33;1m\]\w\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -Fh'
######################
# export GOROOT="`which go`"
PATH="/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin" #:${GOROOT}"

export GOPATH="${HOME}"

if [ $MAC ] && [ -d ~/homebrew ]; then
	PATH="${HOME}/homebrew/bin:${PATH}"
fi

if [ -d ~/bin ]; then
	PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${GOPATH}" ]; then
	PATH="${PATH}:${GOPATH}/bin"
fi

if [ -f ~/.bash_setup ]; then
  . ~/.bash_setup
fi

# personal is my whatever computer this is
if [ -f ~/.personal_spec ]; then
  . ~/.personal_spec
fi

if [ -f ~/.randall_spec ]; then
  . ~/.randall_spec
fi

if [ -f ~/.work_spec ]; then
  . ~/.work_spec
fi

if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
# export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rickybarillas/OneDrive-GeorgiaInstituteofTechnology/coding/google-cloud-sdk/path.bash.inc' ]; then source '/Users/rickybarillas/OneDrive-GeorgiaInstituteofTechnology/coding/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rickybarillas/OneDrive-GeorgiaInstituteofTechnology/coding/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/rickybarillas/OneDrive-GeorgiaInstituteofTechnology/coding/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"

complete -C /Users/rbarillas/homebrew/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

complete -C /usr/local/bin/mc mc

complete -C /usr/local/bin/terraform terraform

[[ -s "/Users/rickybarillas/.gvm/scripts/gvm" ]] && source "/Users/rickybarillas/.gvm/scripts/gvm"

complete -C /Users/rickybarillas/bin/terraform terraform
