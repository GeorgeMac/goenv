# goenv used to set GOPATH variable
function goenv {
START="$(pwd)"
if [ -z $1 ]; then
    echo $GOPATH
    return
fi
case "$1" in
    global)
        export GOPATH="$HOME/go"
        ;;
    local)
        if [ -f ./.gopath ]; then
            export GOPATH=`pwd`
        else
            goenv-parent
        fi
        ;;
    init)
        touch .gopath
        goenv "local"
        ;;
    *)
        echo "Usage: goenv [global | local | init]"
        return
        ;;
esac
cd START>/dev/null 2>&1
unset START
}

# goenv-parent sets the GOPATH to the ancestor folder with a .gopath file
function goenv-parent {
if [ `pwd` = "/" ]; then echo "Cannot find .gopath" && return false; fi
cd ..
if [ -f ./.gopath ]; then
    export GOPATH=`pwd`
    return true
fi
goenv-parent
}
