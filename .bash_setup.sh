# vim: autoindent tabstop=4 shiftwidth=4 expandtab softtabstop=4 filetype=sh

function setup_pbcopy() {
    # update stuff
    sudo apt update

    #  Check to see if Xclip is installed if not install it
    if [ $(dpkg-query -W -f='${Status}' xclip 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
        sudo apt install xclip -y;
    fi
    #  Add the aliases to the .bashrc
    #echo "#pbcopy & pbpaste aliases" >> ~/.bash_aliases
    #echo "alias pbcopy='xclip -selection clipboard'" >> ~/.bash_aliases
    #echo "alias pbpaste='xclip -selection clipboard -o'"  >> ~/.bash_aliases
}
