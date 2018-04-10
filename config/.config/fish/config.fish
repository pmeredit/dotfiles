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
       $HOME/.fzf/bin

set haskPlatform $HOME/Library/Haskell/bin
if test -d $haskPlatform
    set PATH $haskPlatform $PATH
end

alias vim nvim
