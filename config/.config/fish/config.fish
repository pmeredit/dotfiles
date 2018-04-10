#!/usr/bin/fish

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

set -x PATH $HOME/.cargo/bin\
       $HOME/Go/bin\
       $HOME/Tools\
       /usr/local/bin\
       /usr/bin\
       /bin\
       /usr/sbin\
       /sbin\
       $HOME/Library/Haskell/bin\
       $HOME/.fzf/bin

alias vim nvim
