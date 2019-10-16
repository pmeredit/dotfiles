#!/usr/bin/fish

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

alias sshf "ssh patrick@10.1.22.71"

set -gx PATH $PATH\
	   $HOME/.cargo/bin\
       $HOME/Go/bin\
       $HOME/Tools\
       /usr/local/bin\
       /usr/bin\
       /bin\
       /usr/sbin\
       /sbin\
       $HOME/.fzf/bin\
	   $HOME/.local/bin\
	   $HOME/dotfiles/bin

if test -d /usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig
	set -gx PKG_CONFIG_PATH /usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig
end

set -gx GOPATH $HOME/Go

set haskPlatform $HOME/Library/Haskell/bin
if test -d $haskPlatform
    set PATH $haskPlatform $PATH
end

alias vim nvim
alias pinst 'pacaur -S --needed'
alias prm 'pacaur -Rds'
alias pup 'pacaur -Syu'
alias psr 'pacaur -Ss'
alias wtmux '$HOME/dotfiles/bin/tmux'

function ccargo 
	set -lx RUSTC_WRAPPER sccache
	cargo $argv
end
