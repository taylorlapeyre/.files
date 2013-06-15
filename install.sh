#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
git checkout master
git pull -u origin master

if [ ! -d ~/.oldconfigs ]; then
  mkdir ~/.oldconfigs
fi

echo

if [ -f ~/.bash_profile ]; then
  echo "bash_profile exists. Moving old bash_profile to ~/.oldconfigs.."
  mv ~/.bash_profile ~/.oldconfigs/.bash_profile
  echo "source ~/.bashrc" > ~/.bash_profile
else
  if [ -f ~/.bashrc ]; then
    echo "bashrc exists. Moving old bashrc to ~/.oldconfigs.."
    mv ~/.bashrc ~/.oldconfigs/.bashrc
  fi
fi
ln -s -fF $DIR/standard/.bashrc ~/.bashrc

if [ -f ~/.gitconfig ]; then
  echo "gitconfig exists. Moving old gitconfig to ~/.oldconfigs.."
  mv ~/.gitconfig ~/.oldconfigs/.gitconfig
fi
ln -s -fF $DIR/standard/.gitconfig ~/.gitconfig

if [ -f ~/.vimrc ]; then
  echo "vimrc exists. Moving old vimrc to ~/.oldconfigs.."
  mv ~/.vimrc ~/.oldconfigs/.vimrc
fi
ln -s -fF $DIR/standard/.vimrc ~/.vimrc

if [ -d ~/.vim ]; then
  echo ".vim/ exists. Moving old .vim/ to ~/.oldconfigs.."
  if [ -d ~/.oldconfigs/.vim ]; then rm -rf ~/.oldconfigs/.vim; fi
  mv ~/.vim ~/.oldconfigs/.vim
fi
ln -s $DIR/standard/.vim ~/.vim

if [ "$(cat /etc/*-release | head -1 | cut -d '=' -f 2 | sed 's/\"//g')" == "Arch Linux" ]; then
  if [ -f ~/.xinitrc ]; then
    echo ".xinitrc exists. Moving old .xinitrc to ~/.oldconfigs"
    mv ~/.xinitrc ~/.oldconfigs/.xinitrc
  fi
  ln -s -fF $DIR/arch/.xinitrc ~/.xinitrc

  if [ -f ~/.Xresources ]; then
    echo ".Xresources exists. Moving old .Xresources to ~/.oldconfigs"
    mv ~/.Xresources ~/.oldconfigs/.Xresources
  fi
  ln -s -fF $DIR/arch/.Xresources ~/.Xresources

  if [ -f ~/.i3/config ]; then
    echo ".i3/config  exists. Moving old .i3/config to ~/.oldconfigs"
    mv ~/.i3/config ~/.oldconfigs/.i3config
    if [ ! -d $HOME/.i3 ]; then mkdir $HOME/.i3; fi
  fi
  ln -s -fF $DIR/arch/.i3config ~/.i3/config
fi
echo

echo "Installing fonts.."
if [ ! -d ~/.fonts ]; then
  mkdir ~/.fonts
fi
cp -r $DIR/.fonts/* ~/.fonts
fc-cache -fv
