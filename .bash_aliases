#just ls things
alias lsa='ls -A'
alias lsl='ls -lh'

#alias things
alias aliases='vim ~/.bash_aliases'
alias vars='vim ~/.bash_vars'
alias functions='vim ~/.bash_functions'
alias funcs='vim ~/.bash_functions'
alias src='echo -n "Sourcing ~/.bashrc..."; source ~/.bashrc; echo "DONE";' 

#Input things
alias disable-keyboard='xinput set-int-prop $internal_keyboard "Device Enabled" 8 0'
alias enable-keyboard='xinput set-int-prop $internal_keyboard "Device Enabled" 8 1'

# VPN
alias sweden='openvpn /etc/openvpn/se.openvpn.frootvpn.ovpn'

alias l="ls -CF"
alias ll="ls -alF"

# New aliases go here

alias cp="cp -iv"
alias mv="mv -iv"
alias ..="cd .."
alias ...="cd ../.."
alias paths="echo -e ${PATH//:\\n}"
