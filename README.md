To install

```
git clone https://github.com/MichaelThessel/rc.git ~/.rc
cd ~/.rc
git submodule init
git submodule update
cd ~
ln -s .rc/.bashrc .rc/.gitconfig .rc/.gitignore .rc/.profile .rc/.screenrc .rc/.vim .rc/.vimrc .rc/.inputrc .rc/.octaverc .rc/.zshrc .rc/.i3 .rc/.Xresources ~/
ln -s .rc/goblocks .config/goblocks
vim +PluginInstall +qall

```
