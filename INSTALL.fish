#!/usr/bin/env fish

if not type -q stow
     set un (uname -o ^ /dev/null; or uname -s)
	if test $un = "Cygwin"
	    cp apt-cyg /usr/bin
	    apt-cyg install stow
        else if test $un = "Darwin"
	    brew install stow
	else #assuming Ubuntu for now, come back later
  	    sudo apt-get install stow
     end
end

for i in (ls | grep -v INSTALL.sh | grep -v apt-cyg | grep -v INSTALL.fish | grep -v omf.fish | grep -v omf.fish | grep -v README.md | grep -v pipeformatter.py)
    echo "stowing $i ..."
    stow $i
end

./omf.fish --path=~/.local/share/omf --config=~/.config/omf
