#!/usr/bin/fish

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

set -gx GRADLE_HOME /opt/gradle/latest 
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
	   $HOME/dotfiles/bin\
       $HOME/local/node-v16.16.0-linux-x64/bin
       $GRADLE_HOME/bin

if test -d /usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig
	set -gx PKG_CONFIG_PATH /usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig
end

set -gx GOPATH $HOME/Go

set haskPlatform $HOME/Library/Haskell/bin
if test -d $haskPlatform
    set PATH $haskPlatform $PATH
end

function ccargo 
	set -lx RUSTC_WRAPPER sccache
	cargo $argv
end
