_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
##### set colors #####
export PS1="\[\033[36m\]\u\[\033[m\]\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
######################
PATH="/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin"

