cd ..
ls
cd ..
ls
ls
cd mongo-odbc-driver/
ls
cd mysql-connector-odbc/
ls
git checkout BI-1482
ls
cd ..
ls
cd ..
ls
cd ..
ls
cp -R resources/* ~/
git checkout pdf_test 
ls
mv ~/win32_installer src/mongo-odbc-driver/
mv ~/win64_installer src/mongo-odbc-driver/
ls src/mongo-odbc-driver/
git status
git commit -am "moved wix resources"
ls
gg me
ls
ls resources/
rm -Rf resources/
ls
git status
git commit -am "delete old resources dir"
gg me
ls
vim bin/win32_odbc_build.sh 
git commit -am "fix build script"
gg me
ls
vim bin/win32_odbc_build.sh 
ls
ls src/mongo-odbc-driver/
mkdir src/mongo-odbc-driver/installer
mkdir src/mongo-odbc-driver/installer/msi
cd src/mongo-odbc-driver/installer/msi/
ls
mv ../../win32_installer ./
mv ../../win64_installer ./
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd ..
ls
git add src/
git status
git commit -am "installer resources"
gg me
ls
git status
git commit -am "updated setup bmp"
gg me
git status
git commit -am "Updated setupgui bmps"
gg me
git status
git rm src/.DS_Store
git rm src/.DS_Store -f
git status
git commit -am "wix image edit"
gg me
ls
git co BI-1482
git cherry-pick pdf_test
git log
ls
gg me
ls
vim bin/win32_odbc_build.sh 
vim bin/win32_odbc_build.sh 
vim bin/win64_odbc_build.s
cp bin/win32_odbc_build.sh ~/
git checkout BI-1482
git log
git checkout pdf_test
git log
ls
vim bin/win64_odbc_build.sh 
git commit -am "updated build scripts"
gg me
gg me =f
gg me -f
vim bin/win64_odbc_build.sh 
git commit -am "fix 64bit build script"
gg me
vim bin/win64_odbc_build.sh 
ls
ls
cd src/mongo-odbc-driver/
ls
cd installer/msi/win64_installer/
ls
vim odbc.wxs 
git commit -am "test full rebrand except for file names"
gg me
ls
ls
ls
cd ..
ls
vim win32_installer/odbc.wxs 
pwd
git commit -am "Update win32 wix file"
gg me
ls
cd ..
ls
cd ..
ls
ls
ls
ls
cd installer/
ls
vim msi/win32_installer/odbc.wxs 
vim msi/win32_installer/odbc.wxs 
git commit -am "changed versions 32 bit"
gg me
vim msi/win32_installer/odbc.wxs 
vim msi/win32_installer/odbc.wxs 
git commit -am "upgrade versions"
gg me
vim msi/win32_installer/odbc.wxs 
git commit -am "test upgrade"
gg me
vim msi/win32_installer/odbc.wxs 
git commit -am "test upgrade"
gg me
vim msi/win32_installer/odbc.wxs 
git commit -am "test upgrade"
gg me
vim msi/win64_installer/odbc.wxs 
vim msi/win32_installer/odbc.wxs 
vim msi/win64_installer/odbc.wxs 
git commit -am "64 bit versions"
gg me
l
ls
vim msi/win64_installer/odbc.wxs 
vim msi/win32_installer/odbc.wxs 
git commit -am "fix upgrade version again"
gg me -f
ls
cd .
cd ..
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd odbc/
ls
ls
ls
git checkout -b rename_dlls
ls
vim src/mongo-odbc-driver/mysql-connector-odbc/CMakeLists.txt 
ls
cd src/mongo-odbc-driver/
ls
rg myodbc
rg myodbc | rg dll
vim mysql-connector-odbc/driver/driver.rc.cmake
vim mysql-connector-odbc/driver/info.c
rg myodbc | rg dll
ls
vim installer/msi/win32_installer/odbc.wxs 
vim installer/msi/win64_installer/odbc.wxs 
ls
cd ..
ls
cd ..
ls
vim bin/win*
vim bin/win*
ls
vim src/mongo-odbc-driver/installer/msi/win*
vim src/mongo-odbc-driver/installer/msi/win32_installer/odbc.wxs 
git commit -am "test renamed dlls"
gg me
ls
vim bin/win*
git log
git diff c5d4fc5d7f622dc63f0ad9570f0c4f3bf958df40 bin/win32_odbc_build.sh
vim bin/win*
git commit -am "whoops, need mysql not mongosql for the dls"
gg me
git checkout BI-1482
ls
git branch -D rename_dlls
ls
evergreen patch -p mongo-odbc-driver -- --binary
evergreen patch -p mongo-odbc-driver -- --binary --large
evergreen patch -p mongo-odbc-driver --large -- --binary
evergreen patch -p mongo-odbc-driver --large -- --binary
evergreen
evergreen patch -p mongo-odbc-driver --large -- --binary
evergreen get-update --install
evergreen patch -p mongo-odbc-driver --large -- --binary
git tag v1.0.0.beta
git checkout v1.0.0.beta
git checkout BI-1482
git push origin v1.0.0.beta 
evergreen patch -p mongo-odbc-driver -- v1.0.0.beta
git diff v1.0.0.beta
evergreen patch -p mongo-odbc-driver --large -- v1.0.0.beta
evergreen patch -- v1.0.0.beta 
ls
git checkout master
git pull
ls
git co BI-1482
ls
git rebase -i
git rebase -i HEAD~20
git rebase --continue
git rebase --edit-todo
git rebase --edit-todo
git rebase --edit-todo
git rebase --edit-todo
git rebase --abort
git rebase -i HEAD~20
git rebase --abort
git rebase -i HEAD~20
git log
git rebase -i HEAD~10
ls
git log
git rebase -i HEAD~3
ls
git log
git rebase -i HEAD~2
git log
ls
git diff master
ls
ls src/mongo-odbc-driver/installer/msi/win32_installer/
ls src/mongo-odbc-driver/installer/msi/win32_installer/odbc.wxs 
ls
ls
ls bin/win32_odbc_build.sh 
ls
git checkout master
git log
git checkout BI-1482
ls
git log
git reflog
git reset --hard b088c14
git log
git reset --hard 35311da
git log
git reflog
git checkout master
git branch -D BI-1482
git checkout BI-1482
ls
git log
git rebase -i
git rebase -i HEAD ~20
git rebase -i HEAD~20
ls
git rebase -i HEAD~10
git rebase --edit-todo
git rebase --abort
git rebase -i HEAD~10
git log
git rebase -i HEAD~3
git log
ls
git co -b BI-1482-rebase
ls
git log
git checkout master
git diff BI-1482-rebase 
git checkout BI-1482-rebase 
git rebase master
git checkout master
git merge BI-1482-rebase
ls
git log
history | rg eve
git log
git reset --hard b088c14f5016707b83ddbcddb4e47ad34a754c30
git checkout BI-1482-rebase 
ls
git diff master --binary > evg_test.patch
vim evg_test.patch 
evergreen patch-file -p mongo-odbc-driver --base master --diff-file evg_test.patch 
evergreen patch-file -p mongo-odbc-driver --base master --diff-file evg_test.patch --large
ls
gg me
gg me -f
ls
ls
vim src/mongo-odbc-driver/installer/msi/win32_installer/odbc.wxs 
vim src/mongo-odbc-driver/installer/msi/win64_installer/odbc.wxs 
vim src/mongo-odbc-driver/installer/msi/win32_installer/odbc.wxs 
git commit -am "new urls"
gg me
ls
vim .evg.yml 
evergreen -p mongo-odbc-driver
evergreen patch -p mongo-odbc-driver
ls
cp .evg.yml ~/
git stash
git checkout master 
git merge BI-1482
git merge --abort
ls
git diff BI-1482
git diff BI-1482
ls
git log
git checkout BI-1482
git log
ls
git log
git branch
git diff BI-1482-rebase BI-1482
ls
git checkout master
git merge BI-1482 -i
git checkout BI-1482
git rebase master
git rebase --abort
git rebase master -i
vim src/mongo-odbc-driver/installer/msi/win32_installer/odbc.wxs
git add src/mongo-odbc-driver/installer/msi/win32_installer/odbc.wxs
git rebase --continue
vim src/mongo-odbc-driver/installer/msi/win64_installer/odbc.wxs
git add src/mongo-odbc-driver/installer/msi/win64_installer/odbc.wxs
vim src/mongo-odbc-driver/mysql-connector-odbc/ChangeLog
git add src/mongo-odbc-driver/mysql-connector-odbc/ChangeLog
git --continue
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/Install.bat.cmake
git add src/mongo-odbc-driver/mysql-connector-odbc/Install.bat.cmake
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/README
git add src/mongo-odbc-driver/mysql-connector-odbc/README
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/driver/CMakeLists.txt
git add src/mongo-odbc-driver/mysql-connector-odbc/driver/CMakeLists.txt
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/driver/driver.rc.cmake 
git add src/mongo-odbc-driver/mysql-connector-odbc/driver/driver.rc.cmake 
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/driver/error.h
git add src/mongo-odbc-driver/mysql-connector-odbc/driver/error.h
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/driver/info.c
git add src/mongo-odbc-driver/mysql-connector-odbc/driver/info.c
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/installer/myodbc-installer.c
git add src/mongo-odbc-driver/mysql-connector-odbc/installer/myodbc-installer.c
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/scripts/macosx/ReadMe.html.in
git add src/mongo-odbc-driver/mysql-connector-odbc/scripts/macosx/ReadMe.html.in
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/scripts/macosx/postflight.in
git add src/mongo-odbc-driver/mysql-connector-odbc/scripts/macosx/postflight.in
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/setupgui/CMakeLists.txt
git add src/mongo-odbc-driver/mysql-connector-odbc/setupgui/CMakeLists.txt
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/setupgui/windows/odbcdialogparams.rc
git add src/mongo-odbc-driver/mysql-connector-odbc/setupgui/windows/odbcdialogparams.rc
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/test/CMakeLists.txt 
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/test/CMakeLists.txt
git add src/mongo-odbc-driver/mysql-connector-odbc/test/CMakeLists.txt
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/test/odbc.ini.in
git add src/mongo-odbc-driver/mysql-connector-odbc/test/odbc.ini.in
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/version.cmake
git add src/mongo-odbc-driver/mysql-connector-odbc/version.cmake
git rebase --continue
vim src/mongo-odbc-driver/mysql-connector-odbc/wix/mysql_odbc.xml.in
git add src/mongo-odbc-driver/mysql-connector-odbc/wix/mysql_odbc.xml.in
git rebase --continue
git diff RenameDLLS 
vim src/mongo-odbc-driver/mysql-connector-odbc/driver/error.h
git diff RenameDLLS 
vim src/mongo-odbc-driver/mysql-connector-odbc/test/odbc.ini.in
git diff RenameDLLS 
ls src/mongo-odbc-driver/mysql-connector-odbc/setupgui
git checkout RenameDLLS 
git stash
git checkout RenameDLLS 
git log
gg me
git co -b PareEvg
cp ~/.evg.yml ./
vim .evg.yml 
ls
git commit -am "Pare down evg"
git rebase -i HEAD~10
git rebase -i HEAD~10
git log
git rebase -i HEAD~3
git log
gg me
git checkout master
git merge PareEvg 
ls
git log
git push
evergreen patch -p mongo-odbc-driver
evergreen validate .evg.yml 
vim .evg.yml 
evergreen validate .evg.yml 
evergreen validate .evg.yml 
evergreen validate .evg.yml 
evergreen patch -p mongo-odbc-driver
ls
ls
ls
ls
ls
vim bin/win32_odbc_build.sh 
vim test
wget https://s3.amazonaws.com/mciuploads/mongo-odbc-driver/artifacts/5aaa975e2a60ed497a9c3c69/mongo-odbc-win32.msi
rm mongo-odbc-win32.msi 
cd ~/sqlproxy
ls
vim .evg.yml 
rg PROJECT_DIR
rg SCRIPT_DIR
vim changes
vim changes
x=$(readlink $(pwd))
echo $x
man readlink
pwd -P
man pwd
man pwd
pwd
pwd -P
brew install libsdl2-dev
brew install libsdl2-dev
brew install sdl2
cargo install sodium
ls
cd ~/Rust/
https://s3.amazonaws.com/mciuploads/mongo-odbc-driver/releases/5aaac83ec9ec442eba877513/mongo-odbc-win32.msi
cd ~/Downloads/https://s3.amazonaws.com/mciuploads/mongo-odbc-driver/releases/5aaac83ec9ec442eba877513/mongo-odbc-win64.msi
ls
cd sodium/
ls
cargo run --features orbital
cd ~/git/odbc/
ls
vim bin/win32_odbc_build.sh 
git remote -v
ls
vim bin/win32_odbc_build.sh 
vim bin/win64_odbc_build.sh 
git commit -am "fix bucket for 64 bit"
cd ~/Downloads/
ls
rm -Rf mongo-*
ls
wget https://s3.amazonaws.com/mciuploads/mongo-odbc-driver/releases/5aaac83ec9ec442eba877513/mongo-odbc-win64.msi
cd ~/git/odbc/
ls
vim .evg.yml 
evergreen patch -p mongo-odbc-driver
ls
vim .evg.yml 
vim .evg.yml 
evergreen patch -p mongo-odbc-driver
vim .evg.yml 
evergreen patch -p mongo-odbc-driver
brew install fish
fish
ll
which ls
ls
which \ls
\ls
fish
