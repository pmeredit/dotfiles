un=$(uname -o 2> /dev/null || uname -s)

eval "$(thefuck --alias)"

alias l="exa -F"
alias la="exa -Fa"
alias ll="exa -Flg --git"
alias ls="exa -F"

alias v=nvim
alias vim=nvim

gnames="10gen pmeredit"

if hash rg; then
    alias grep="rg"
fi

if [ "$un" == "Cygwin" ]; then
    for name in $gnames; do
        mkdir -p $HOME/go/src/github.com/$name
    done
    export GOPATH=$(cygpath -d $HOME)\\go
else
    mkdir -p $HOME/git
    for name in $gnames; do
        mkdir -p $HOME/Go/src/github.com/$name
    done
    export GOPATH=$HOME/Go
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

add_to_PATH $HOME/Tools $GOPATH/bin $HOME/.cargo/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

export PATH

if ! [ -x "$(command -v gotab)" ]; then 
    go get github.com/dsnet/gotab
fi

complete -C gotab -o nospace go

[ -f  $HOME/.git-prompt.sh ] && . $HOME/.git-prompt.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /etc/bash_completion.d/git-prompt ] && . /etc/bash_completion.d/git-prompt

if [ -r /usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig ]; then
	export PKG_CONFIG_PATH=/usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig
fi

if [ -x $(command -v rustc)  ]; then
	export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

function rl {
   . ~/.bashrc
}

function gcb {
   git branch | grep '[*]' | sed 's/[ *]*//g'
}

function gg {
   remote=$1
   shift
   git push $remote $(gcb) $@ 
}

function gca {
   git commit -a --amend
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ⛧⛧⛧⛧\[\033[0m\] '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
