# Bash functions wooooo

# displays the size of a given file or folder
sizeof() {

    # if no arg is supplied, assume current working dir
    [[ -z $1 ]] && arg=$(pwd) || arg=$1
    
    if [ -f $arg ]; then
        raw=$(ls -sh $arg 2>/dev/null)
    elif [ -d $arg ]; then
        raw=$(du -hs $arg 2>/dev/null)
    else
        echo "'"$arg"' is not a valid file or folder"
        return
    fi         

    pruned=$(echo $raw | grep -o ^[0-9\\.]\\+[a-zA-Z])
    echo ${arg} ' is ' $pruned
}
