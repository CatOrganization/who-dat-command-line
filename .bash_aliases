alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias xcode='open -a Xcode'
alias lsa="ls -a"
alias l="ls -CF"
alias ll="ls -alF"

alias aliases='vim ~/.bash_aliases'
alias vars='vim ~/.bash_vars'
alias functions='vim ~/.bash_functions'
alias funcs='vim ~/.bash_functions'
alias src='echo -n "Sourcing ~/.bash_profile..."; source ~/.bash_profile; echo "DONE";'

# New aliases go here

alias gPics="cd ~/Pictures"
alias cp="cp -iv"
alias mv="mv -iv"
alias ..="cd .."
alias ...="cd ../.."
alias paths="echo -e ${PATH//:\\n}"

alias dockerRM='docker rm -f $(docker ps -a -q)'


#TODO move this to pearlterminal_spec

alias orchid='ssh -o ServerAliveInterval=100 -X orchidterminal@$RM'
alias webmaster='ssh webmaster@$RM'

alias room='ssh -Y room@$RM'
alias plexserver='ssh -X ricky@$PS'
alias networklab1='ssh rbarillas3@networklab1.cc.gatech.edu'
alias networklab2='ssh rbarillas3@networklab2.cc.gatech.edu'
alias networklab3='ssh rbarillas3@networklab3.cc.gatech.edu'
alias networklab4='ssh rbarillas3@networklab4.cc.gatech.edu'

alias gotohw="cd ~/OneDrive\ -\ Georgia\ Institute\ of\ Technology/Dropbox/Classes/CS\ 1332\ TA/Homework"
alias gotop="cd ~/OneDrive\ -\ Georgia\ Institute\ of\ Technology/Dropbox/Classes/Networking/project3"


alias syncMusic="unison ~/Music/iTunes/iTunes\ Media/Music/ ssh://ricky@$PS//media/Plex/Music"


# Github

alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gstat="git status"
alias gadu="git add -u"
alias gcom="git commit"
alias gcomm="git commit -m"