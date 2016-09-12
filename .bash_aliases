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

# Pword Manager
alias password='java -jar ~/Desktop/Code/PW_V3.jar'
