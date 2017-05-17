alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias xcode='open -a Xcode'
alias orchid='ssh -o ServerAliveInterval=100 -X orchidterminal@$RM'
alias webmaster='ssh webmaster@$RM'
alias room='ssh -Y room@$RM'
alias plexserver='ssh -X ricky@$PS'
alias lsa="ls -a"
alias l="ls -CF"
alias ll="ls -alF"

alias src='echo -n "Sourcing ~/.bash_profile..."; source ~/.bash_profile; echo "DONE";'

# New aliases go here

alias gPics="cd ~/Pictures"
alias cp="cp -iv"
alias mv="mv -iv"
alias ..="cd .."
alias ...="cd ../.."
alias paths="echo -e ${PATH//:\\n}"
alias gotohw="cd ~/OneDrive\ -\ Georgia\ Institute\ of\ Technology/Dropbox/Classes/CS\ 1315\ TA/Homework\ Team/"

alias syncMusic="unison ~/Music/iTunes/iTunes\ Media/Music/ ssh://ricky@$PS//media/Plex/Music"
