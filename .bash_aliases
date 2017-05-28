alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias xcode='open -a Xcode'
alias orchid='ssh -o ServerAliveInterval=100 orchidterminal@$RM'
alias webmaster=' ssh webmaster@$RM'
alias room='ssh -Y room@$RM'
alias lsa="ls -a"
alias l="ls -CF"
alias ll="ls -alF"

# New aliases go here

alias gPics="cd ~/Pictures"
alias cp="cp -iv"
alias mv="mv -iv"
alias ..="cd .."
alias ...="cd ../.."
alias paths="echo -e ${PATH//:\\n}"


alias mysqlremote="mysql -u remote -h $RM -P 3307 --password='butmonica'"

alias sweden="sudo openvpn /etc/openvpn/se.openvpn.frootvpn.opvn"

