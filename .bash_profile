export PATH=${HOME}/homebrew/bin:${PATH}
##### set colors #####
export PS1="\[\033[36m\]\u\[\033[m\]\[\033[33;1m\]\w\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
######################
GRADLE_HOME="/usr/local/Cellar/gradle/3.4.1"
PATH="/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin"
PATH="$PATH:$GRADLE_HOME/bin"
export GOROOT="/usr/local/bin"

#TODO move this to pearlterminal_spec
export GOPATH="$HOME/coding/go"
PATH="${HOME}/bin:${PATH}"

# https://github.com/nvbn/thefuck/
# brew install thefuck
eval $(thefuck --alias)

# source pearlterminal specific environment variables
# pearlterminal is my personal mac
if [ -f ~/.pearlterminal_spec ]; then
    . ~/.pearlterminal_spec
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH


# https://github.com/magicmonty/bash-git-prompt#via-homebrew-on-mac-os-x
# brew install bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
# brew install git && brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
