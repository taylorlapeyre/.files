#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$DIR" == "$HOME/home/.config" ]; then
  cd $HOME/home/.config
  git checkout master
  git pull -u origin master
fi

if [! -d ~/.oldconfigs ]; then
  mkdir ~/.oldconfigs
fi

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
ln $DIR/.bashrc ~/.bashrc
echo

if [ -f ~/.gitconfig ]; then
  echo "gitconfig exists. Moving old gitconfig to ~/.oldconfigs.."
  mv ~/.gitconfig ~/.oldconfigs/.gitconfig
fi
ln $DIR/.gitconfig ~/.gitconfig
echo

if [ -f ~/.vimrc ]; then
  echo "vimrc exists. Moving old vimrc to ~/.oldconfigs.."
  mv ~/.vimrc ~/.oldconfigs/.vimrc
fi
ln $DIR/.vimrc ~/.vimrc
echo

if [ -d ~/.vim ]; then
  echo ".vim/ exists. Moving old .vim/ to ~/.oldconfigs.."
  if [ -d ~/.oldconfigs/.vim ]; then rm -rf ~/.oldconfigs/.vim; fi
  mv ~/.vim ~/.oldconfigs/.vim
fi
cp -r $DIR/.vim ~/.vim
echo
