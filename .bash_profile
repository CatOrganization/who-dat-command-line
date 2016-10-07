##### set colors #####
export PS1="\[\033[36m\]\u\[\033[m\]\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
######################
PATH="/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin"


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