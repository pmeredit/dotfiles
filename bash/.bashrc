un=$(uname -o 2> /dev/null || uname -s)

eval "$(thefuck --alias)"

alias ll="ls -Glha"

gnames="10gen pmeredit"

if [ "$un" == "Cygwin" ]; then
    for name in $gnames; do
        mkdir -p $HOME/go/src/github.com/$name
    done
    export GOPATH=$(cygpath -d $HOME)\\go
else
    mkdir -p $HOME/git
    for name in $gnames; do
        mkdir -p $HOME/.go/src/github.com/$name
    done
    export GOPATH=$HOME/.go
fi

add_to_PATH () {
  for d; do
    d=$(cd -- "$d" && { pwd -P || pwd; }) 2>/dev/null  # canonicalize symbolic links
    if [ -z "$d" ]; then continue; fi  # skip nonexistent directory
    case ":$PATH:" in
      *":$d:"*) :;;
      *) PATH=$d:$PATH;;
    esac
  done
}

add_to_PATH $HOME/Tools/mongodb-3.6.0rc1/bin $HOME/Tools $GOPATH/bin $HOME/.cargo/bin 

export PATH

if ! [ -x "$(command -v gotab)" ]; then 
    go get github.com/dsnet/gotab
fi

complete -C gotab -o nospace go

[ -f  $HOME/.git-prompt.sh ] && . $HOME/.git-prompt.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -x $(command -v rustc)  ]; then
	export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

function rl {
   . ~/.bashrc
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
