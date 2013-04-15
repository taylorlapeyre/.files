#!/bin/bash

mkdir ~/.oldconfigs

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
ln ~/home/.config/.bashrc ~/.bashrc
echo

if [ -f ~/.gitconfig ]; then
  echo "gitconfig exists. Moving old gitconfig to ~/.oldconfigs.."
  mv ~/.gitconfig ~/.oldconfigs/.gitconfig
fi
ln ~/home/.config/.gitconfig ~/.gitconfig
echo

if [ -f ~/.vimrc ]; then
  echo "vimrc exists. Moving old vimrc to ~/.oldconfigs.."
  mv ~/.vimrc ~/.oldconfigs/.vimrc
fi
ln ~/home/.config/.vimrc ~/.vimrc
echo

if [ -d ~/.vim ]; then
  echo ".vim/ exists. Moving old .vim/ to ~/.oldconfigs.."
  if [ -d ~/.oldconfigs/.vim ]; then rm -rf ~/.oldconfigs/.vim; fi
  mv ~/.vim ~/.oldconfigs/.vim
fi
cp -r ~/home/.config/.vim ~/.vim
echo

if [ -d ~/.ssh ]; then
  echo ".ssh/ exists. Moving old .ssh/ to ~/.oldconfigs.."
  if [ -d ~/.oldconfigs/.ssh ]; then rm -rf ~/.oldconfigs/.ssh; fi
  mv ~/.ssh ~/.oldconfigs/.ssh
fi
cp -r ~/home/.config/.ssh ~/.ssh
echo

if [ ! git ]; then echo "[Problem] git is not installed."; fi
if [ ! wget ]; then echo "[Problem] wget is not installed."; fi
if [ ! rbenv ]; then echo "[Problem] rbenv is not installed."; fi
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! brew ]; then echo "[Problem] brew is not installed."; fi
fi
