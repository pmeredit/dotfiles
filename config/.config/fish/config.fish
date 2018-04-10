#!/usr/bin/fish

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

set -x PATH $HOME/.cargo/bin\
       $HOME/Go/bin /Users/pmeredit/Tools\
       /usr/local/bin\
       /usr/bin\
       /bin\
       /usr/sbin\
       /sbin\
       /opt/X11/bin\
       /usr/local/go/bin\
       /Applications/Wireshark.app/Contents/MacOS\
       $HOME/.fzf/bin
