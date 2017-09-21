vim testdata/bin/test-log-newlines.sh 
pkill sql; make test-log-newlines
cat testdata/artifacts/log/test-log-newlines.log 
vim testdata/bin/test-log-newlines.sh 
pkill sql; make test-log-newlines
cat testdata/artifacts/log/test-log-newlines.log 
vim testdata/bin/test-log-newlines.sh 
ls
grep -c $'\n' log/log.go 
grep -c $'\n' log/log.go; echo $?
grep -c $'\r' log/log.go; echo $?
vim testdata/bin/test-log-newlines.sh 
pkill sql; make test-log-newlines
vim testdata/bin/test-log-newlines.sh 
vim testdata/bin/test-log-newlines.sh 
git status
git add testdata
git status
git commit -a --amend
git status
tig
evergreen patch
evergreen
evergreen cancel-patch -i 59b17f3de3c3314ea20001da
ls
git diff master
vim testdata/bin/download-mongodb.sh 
git diff master | less
vim testdata/bin/download-mongodb.sh 
git diff master | less
git commit --amend
git diff master
evergreen cancel-patch -i 59b17f3de3c3314ea20001da
evergreen patch
mongo
mongo
ls
cd ~/git/sqlproxy
ls
ls
~/Tools/
ls ~/Tools/
vim ~/Tools/cr 
cr
ls
vim testdata/bin/test-log-newlines.sh 
ls
vim log/log.go 
git status
git commit --amend
make test-log-newlines
make _test-log-newlines
ls
ls
find  testdata/ | grep mk
vim testdata/config/tests/log-newlines.mk 
git diff
make _test-log-newlines
pull orign/master
git pull orign/master
git checkout master
git pull orign master
git commit -ammend
git commit -amend
git commit -amend -a
git commit --amend -a
git commit -a -amend
git commit -a --amend
git commit -a --amend
git checkout master
git pull
git checkout BI-1190
git rebase master
tig
git checkout master
git merge BI-1190
tig
git rebase -i
tig
git rebase -i
tig
git push
tig
git describe
mongo
ls
git pull
vim schema/map.go 
mongo < ~/Downloads/understanding_explain_part_2.js 
ps aux | grep mongod
kill 29370
ps aux | grep mongod
which mongo
ls /usr/local/bin/
cd ~/git/
git clone https://github.com/rueckstiess/mtools.git
cd mtools/
ls
which python
python setup.py 
vim README.md 
vim INSTALL.md 
sudo python setup.py install
which mlaunch
ls
ls
mlaunch init --single --sharded 2
sudo mlaunch init --single --sharded 2
which vagrant
cd ~/Downloads/m312-vagrant-env.d36b22e2ac00/
vagrant plugin install vagrant-vbguest
vagrant up
vagrant status
ls /
ls
pwd
echo hello >> shared/test.txt
vagrant ssh
ls
cd ~
ls
brew install vim-plug
vim
which vim
brew install vim
vim
which vim
vim
ls /usr/local/Cellar/vim/
ls /usr/local/bin/
ls /usr/local/bin/vim
ls -lshd /usr/local/bin/vim
vim /usr/local/Cellar/vim/8.0.1050/bin/vim -v
/usr/local/Cellar/vim/8.0.1050/bin/vim -v
/usr/local/Cellar/vim/8.0.1050/bin/vim 
vim
which vim
/usr/local/vim
/usr/local/bin/vim
/usr/local/bin/vim
which vim
vim
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
ls -lshd /usr/local/bin/vim
/usr/local/bin/vim
echo $PATH
/usr/bin/vim
ls -lshd /usr/bin/vim
PATH=/usr/local/bin/ vim
PATH=/usr/local/bin vim
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
vim ~/.tmux.conf 
tmux
tmux
cd ~/git/
cd sqlproxy
tig
cat ~/.gitconfig 
git config
git config --global email=pmeredit@gmail.com
ps -ef | grep mongod
killall mongod
ps -ef | grep mongod
pkill mongod
ps -ef | grep mongod
sudo pkill mongod
ps -ef | grep mongod
top
htop
brew install htop
htop
cd ~/Downloads/
ls
cd m312-vagrant-env.d36b22e2ac00/
ls
cd shared/
ls
ls filtered.log 
mlogfilter --help
sudo chmod -R 666 /usr/local/lib/
mlogfilter --help
pip2 install pkg_resources
pip2 install mtools
sudo chmod -R 777 /usr/local/lib/
pip2 install mtools
mplotqueries --help
pip2 install matplotlib
mplotqueries --help
mplotqueries --histogram filtered.log 
mplotqueries --type histogram filtered.log 
mplotqueries --type histogram --help filtered.log 
mplotqueries --type histogram --bucket=1s --help filtered.log 
mplotqueries --type histogram --bucketsize=1 filtered.log 
htop
which VirtualBox
ls /usr/local/bin/VirtualBox 
ls -lshd /usr/local/bin/VirtualBox 
cp run_w_x509.sh ~/
ls ~/
ls
ls
cd ~
ls
unzip m310-vagrant-env.zip 
ls
vagrant init
vagrant up
mongod
mongos
tmux
ls
vim
cd ~/git/sqlproxy
ls
cr
git log
vim ~/Tools/cr 
vim
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
ls ~/.vim/pack/plugins/start/vim-go/
ls
vim main/sqlproxy.go 
vim main/sqlproxy.go 
vim main/sqlproxy.go 
vim
vim main/sqlproxy.go 
vim
vim
vim ~/.vim/pack/plugins/start/vim-go/README.md 
ls
cd ~/git/sqlproxy
ls
vim main/sqlproxy.go 
ls
vim log/log.go 
ls
vim main/sqlproxy.go 
/usr/bin/vim main/sqlproxy.go 
brew uninstall vim
ls
vim
which vim
vim
tmux
ls
cd ~/
ls
vagrant up
vagrant ssh
vagrant ssh m310
vagrant list
vagrant global-status
vagrant ssh infrastructure
vagrant ssh database
vagrant tear down
vagrant destroy database
vagrant destroy infrastructure
vagrant global-state
vagrant global-status
ls
ls .vim
ls .vim/
ls .vim/.netrwhist 
rm -Rf ~/.vim/pack/
ls ~/.vim
ls
cd git/sqlproxy
ls
vim main/sqlproxy.go 
go env
go build main/sqlproxy.go 
vim main/sqlproxy.go 
vim log/log.go 
go build main/sqlproxy.go 
vim log/log.go 
vim main/sqlproxy.go 
go build main/sqlproxy.go 
sudo ./sqlproxy install --config=foo.yml
touch foo.yml
sudo ./sqlproxy install --config=foo.yml
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=foo.yml
sudo launchctl load -w /Library/LaunchDaemons/mongosql.plist 
vim /var/log/system.log
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=$(pwd)foo.yml
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=$(pwd)/foo.yml
sudo launchctl load -w /Library/LaunchDaemons/mongosql.plist 
vim /var/log/system.log
vim foo.yml 
sudo launchctl load -w /Library/LaunchDaemons/mongosql.plist 
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=$(pwd)/foo.yml
vim foo.yml 
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=$(pwd)/foo.yml
vim foo.yml 
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=$(pwd)/foo.yml
sudo launchctl load -w /Library/LaunchDaemons/mongosql.plist 
vim /var/log/system.log
git status
rm sqlproxy foo.yml 
ls
git commit --amend
vim ~/Tools/cr 
cr -i 154760001 -m "create a default configured service so that we can system log failures to read the config file"
cd ~
ls
ls shared/
cp run_w_x509.sh shared/
vim shared/validate-hw-1.3.sh 
./shared/validate-hw-1.3.sh 
vim shared/validate-hw-1.3.sh 
pwd
cd ~/git/sqlproxy
git describe
git branch
ls
vim log/log.go 
ls
vim main/sqlproxy.go 
vim main/sqlproxy.go 
go buid main/sqlproxy.go 
go build main/sqlproxy.go 
history | grep sqlproxy
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=foo.yml
touch foo.yml
sudo ./sqlproxy uninstall; sudo ./sqlproxy install --config=foo.yml
history | grep launch
sudo launchctl load -w /Library/LaunchDaemons/mongosql.plist 
vim /var/log/system.log
git commit --amend
cr -i 154760001
ls
rm foo.yml 
git status
rm sqlproxy 
cr -i 154760001
git push origin BI-1190
ssh Administrator@ec2-54-205-71-4.compute-1.amazonaws.com
git branch
git log
git push
git push
git push origin BI-1185
vim main/sqlproxy.go 
git push
git status
git diff
git commit --amend
git push
git push --set-upstream origin BI-1185
git fetch --all
git push --set-upstream origin BI-1185
git pull --rebase
git status
git commit --amend -a
git push
git push --set-upstream origin BI-1185
git pull --rebase
git branch --set-upstream origin/BI-1185 BI-1185
git pull --rebase
git status
git branch --set-upstream-to origin/BI-1185 BI-1185
git push --set-upstream origin BI-1185
git branch --set-upstream-to origin/BI-1185 BI-1185
git branch --set-upstream-to origin BI-1185 BI-1185
git branch --set-upstream-to origin BI-1185
git branch --set-upstream-to origin/BI-1185 BI-1185
git status
git branch --set-upstream-to origin/BI-1185 
rm .git/refs/heads/origin/BI-1185 
git branch --set-upstream-to origin/BI-1185 BI-1185
ls
git diff
git push
git pull --rebase
vim main/sqlproxy.go 
go build main/sqlproxy.go 
ls
vim log/log.go 
go build main/sqlproxy.go 
vim log/log.go 
go build main/sqlproxy.go 
vim main/sqlproxy.go 
go build main/sqlproxy.go 
git log
git status
git commit -a --amend
git log
git push
git status
git push HEAD:BI-1185
rm sqlproxy 
git push HEAD:BI-1185
git branch
git rebase --continue
git status
git rebase --continue
git rebase --skip
git status
git pull
ls
vim main/sqlproxy.go 
git stash
git status
vim log/log.go 
git merge --abort
ls
vim log/log.go 
ls
ls .git
git branch -b BI-1185-test
git co -b BI-1185-test
git checkout -b BI-1185-test
ls
git push origin BI-1185-test
vim main/sqlproxy.go 
ls
cd ~
ls
cp run_w_x509.sh shared/
mongod --dbpath data/db --auth --setParameter auditAuthorizationSuccess=true --auditDestination file --auditFilter '{ atype: "authCheck", "param.command": { $in: [ "find", "insert", "delete", "update", "findandmodify" ] } }' --auditFormat BSON --auditPath data/db/auditLog.bson
mongod --dbpath /data/db --auth --setParameter auditAuthorizationSuccess=true --auditDestination file --auditFilter '{ atype: "authCheck", "param.command": { $in: [ "find", "insert", "delete", "update", "findandmodify" ] } }' --auditFormat JSON --auditPath /data/db/auditLog.json
mongod --help
mongod --help | grep audit
cd ~/git/sqlproxy
ls
git status
git checkout master
git pull
git checkout BI-1185-test
git rebase master
git checkout master
git merge BI-1185-test
git log
git push
git describe
git log
:q
cd ~/git/sqlproxy
git lg
ssh Administrator@ec2-54-161-103-112.compute-1.amazonaws.com
git status
ssh Administrator@ec2-54-211-251-223.compute-1.amazonaws.com
pwd
cd ~
ssh Administrator@ec2-54-211-251-223.compute-1.amazonaws.com
ls
cd ~/git/sqlproxy
git st
git co BI-1189
ls
cr -i 161490001
~/Tools/cr -i 161490001
ssh Administrator@ec2-54-144-245-28.compute-1.amazonaws.com
ls
ssh Administrator@ec2-54-211-251-223.compute-1.amazonaws.com
ssh Administrator@ec2-54-211-251-223.compute-1.amazonaws.com
rm ~/.ssh/known_hosts 
ssh Administrator@ec2-54-211-251-223.compute-1.amazonaws.com
ssh Administrator@ec2-54-144-245-28.compute-1.amazonaws.com
which vim
hash -r
which vim
echo $PATH
ls ~/Tools/
cd ~/Tools/
pwd
ls /Users/patrickmeredith/Tools/
chmod a+x vi 
chmod a+x vim
ls vi
ls -lashd *
./vim
ls
which nvim
rm vi
rm vim
ln -s /usr/local/bin/nvim vi
ln -s /usr/local/bin/nvim vim
ls
./vi
which vi
which vim
vim ~/.bashrc 
ls
cd ..
ls
cd /Users/
ls
cd pmeredit/
ls
ls -a
cd ..
ls
sudo ln -s pmeredit patrickmeredith
ls
