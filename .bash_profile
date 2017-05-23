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
export GOPATH="$HOME/coding/go"



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

eval $(thefuck --alias)
