To install

```
git clone https://github.com/MichaelThessel/rc.git ~/.rc
cd ~/.rc
git submodule init
git submodule update
cd ~
ln -s .rc/.bashgit .rc/.bashrc .rc/.gitconfig .rc/.gitignore .rc/.profile .rc/.screenrc .rc/.vim .rc/.vimrc .rc/.inputrc .rc/.octaverc .rc/.zshrc ~/
vim +PluginInstall +qall
cd .vim/bundle/YouCompleteMe/
./install.py --clang-completer --gocode-completer --tern-completer
cd ~/.rc

```
