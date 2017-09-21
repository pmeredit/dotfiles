un=$(uname -o 2> /dev/null || uname -s)

gnames="10gen pmeredit"

if [ "$un" == "Cygwin" ]; then
    for name in $gnames; do
        mkdir -p $HOME/go/src/github.com/$name
    done
    export GOPATH=(cygpath -d $HOME)\\go
else
    mkdir -p $HOME/git
    for name in $gnames; do
	echo $name
        mkdir -p $HOME/.go/src/github.com/$name
    done
    export GOPATH=$HOME/.go
fi

export PATH=$HOME/Tools:$PATH


complete -C gotab -o nospace go

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

function rl {
   . ~/.bashrc
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
