To install

```
git clone https://github.com/MichaelThessel/rc.git ~/.rc
cd ~/.rc
git submodule init
git submodule update
cd ~
ln -s .rc/.vim .rc/.vimrc ~/
vim +PluginInstall +qall
```
