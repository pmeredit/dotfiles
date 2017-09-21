if [ ! hash stow &> /dev/null ]; then
	un=$(uname -o || uname -s)
	if [ "$un" == "Cygwin" ]; then
		cp apt-cyg /usr/bin
		apt-cyg install stow
	elif [ "$un" == "Darwin" ]; then
		brew install stow
	else #assuming Ubuntu for now, come back later
		sudo apt-get install stow
	fi
fi

for i in $(ls | grep -v INSTALL.sh | grep -v apt-cyg | grep -v README.md); do
	echo "stowing $i ..."
	stow $i
done
