if [ "$(uname -s)" == "Darwin" ]; then
    mac=1
elif [ "$(uname -s)" == "Linux" ]; then
    linux=1
fi
# we are making a big assumption here
# ultimately if spf13 is installed then everything else is
if [ -d ~/.spf12-vim-3 ];then 
    setup=1
fi

# default these to 0
mac=${mac:-0}
linux=${linux:-0}
setup=${setup:-0}

##### set colors #####
export PS1="\[\033[36m\]\u\[\033[m\]\[\033[33;1m\]\w\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
######################
# export GOROOT="`which go`"
PATH="/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin" #:${GOROOT}"

if [ $mac -eq 1 ] && [ -d ~/homebrew ]; then
	PATH="${HOME}/homebrew/bin:${PATH}"
fi

if [ -d ~/bin ]; then
	PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${GOPATH}" ]; then
	PATH="${PATH}:${GOPATH}/bin"
fi


# https://github.com/nvbn/thefuck/
# brew install thefuck
if [ "$mac" -eq 1 ]; then
    eval $(thefuck --alias)
fi


# personal is my personal mac
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


export PATH


# https://github.com/magicmonty/bash-git-prompt#via-homebrew-on-mac-os-x
# brew install bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
else
  GIT_PROMPT_ONLY_IN_REPO=1
  source ~/.bash-git-prompt/gitprompt.sh
fi

# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
# brew install git && brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
