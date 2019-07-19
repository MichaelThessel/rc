To install

```
git clone https://github.com/MichaelThessel/rc.git ~/.rc
cd ~/.rc
git submodule init
git submodule update
cd ~
ln -s ~/.rc/.config/goblocks .config/
ln -s ~/.rc/.config/i3 .config/
ln -s ~/.rc/.config/dunst .config/
ln -s ~/.rc/.config/nvim .config/
ln -s ~/.rc/.dircolors .
ln -s ~/.rc/.gitconfig .
ln -s ~/.rc/.gitignore .
ln -s ~/.rc/.octaverc .
ln -s ~/.rc/.profile .
ln -s ~/.rc/.screenrc .
ln -s ~/.rc/.Xresources .
ln -s ~/..rc/.zshrc .

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

```
