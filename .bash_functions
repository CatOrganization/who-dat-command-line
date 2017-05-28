# makes an alias called argument '1' that is equal to argument '2'
# arg '2' must be in qoutes
make_alias () {
	echo "alias $1=\"$2\"" >> ~/.bash_aliases
	. ~/.bash_aliases
}
alias makeAlias=make_alias

trash() { command mv "$@" ~/.Trash ;}

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
	man $1 | grep -iC2 --color=always $2 | less
}

showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

plex_sync () {
	unison $1 ssh://ricky@$PS/$2
}