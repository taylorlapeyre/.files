#!/usr/bin/env bash
install_command="brew install"

function install_brew() {
  echo
  echo "Looks like you're brand new! Welcome to this bootstrap script."
  echo "I'm not going to install anything onto your system without your explicit permission."
  echo "furthermore, the only way I will install things is via homebrew."
  echo "First things first, I'm going to install $(tput setaf 2)homebrew$(tput sgr0)."
  echo "Type 'ok' to continue."
  read RESPONSE
  if [[ "$RESPONSE" == "y" ]]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi
  echo
  echo "A$(tput setaf 3)ATTENTION:$(tput sgr0)"
  echo "Since this is the first time homebrew is being installed, I'm going to run brew doctor for you."
  echo "Run this script again after any issues are resolved. Running brew doctor in..."
  echo
  for COUNT in {5..0}; do
    echo -n "$COUNT "
    sleep 1
  done
  brew doctor
  echo
  echo "Message from the script:"
  echo "You'll especially want to edit $(tput setaf 3)/etc/paths$(tput sgr0) to put $(tput setaf 3)/usr/local/bin$(tput sgr0) first."
  echo
  exit
}


function install_brews() {
  echo "I'm going to update homebrew's packages. Type 'ok' to continue."
  read RESPONSE
  if [[ "$RESPONSE" == "ok" ]]; then
    brew update
    brew upgrade
  else
    exit
  fi

  o() {
    echo
    echo "${*:2}"
    echo "- Do you want to install $(tput setaf 2)$1$(tput sgr0)? y/n"
    read RESPONSE
    if [[ "$RESPONSE" == "y" ]]; then
      $install_command $1 2> /dev/null
      echo "Installed $1"
    fi
  }

  o "libtool libxslt libksba openssl libyaml" \
    "There are some basic C libraries for development that I think you should have."

  o "git" \
    "Git is a distributed version control system."

  o "vim" \
    "Vim is the de-facto Unix text editor."

  o "node" \
    "Node is a platform built on Chrome's JavaScript runtime."

  o "python" \
    "Python is probably out of date."

  o "chruby ruby-install" \
    "It's generally a bad idea to use the system ruby. \n" \
    "chruby is a good way to manage ruby."

  o "stow" \
    "GNU Stow is a useful utility for installing dotfiles."

  echo
  echo "This script can install GUI-based user applications, such as Google Chrome."
  echo "- Do you want to install GUI Applications? y/n"
  read RESPONSE
  if [[ "$RESPONSE" == "y" ]]; then
    brew tap phinze/homebrew-cask 2> /dev/null
    brew install brew-cask 2> /dev/null
    install_command="brew cask install"

    o "sublime-text" \
      "Sublime Text is a sophisticated text editor for code, markup and prose."

    o "dropbox" \
      "Dropbox is a cloud-based file hosting solution."

    o "google-chrome" \
      "Google Chrome is a popular and modern web browser."

    o "screenhero" \
      "Screenhero is screen sharing made for remote developers"

    o "virtualbox vagrant" \
      "Vagrant is a tool for building and distributing working environments."

    o "silverlight" \
      "Silverlight is an awful browser plug-in required for watching Netflix."

    o "rdio" \
      "Rdio is an ad-free music subscription service."

    o "alfred" \
      "Alfred is an award-winning productivity application for Mac OS X."

    o "nvalt" \
      "Notational Velocity is a fast and lightweight note taking application."
  fi
}


function configure_settings() {
  echo "- Do you want to disable the sound effects on boot? y/n"
  read RESPONSE
  if [[ "$RESPONSE" == "y" ]]; then
    sudo nvram SystemAudioVolume=" "
  fi

  echo
  echo "- Do you want to only use UTF-8 in Terminal.app? y/n"
  read RESPONSE
  if [[ "$RESPONSE" == "y" ]]; then
    defaults write com.apple.terminal StringEncodings -array 4
  fi
}


hash brew &> /dev/null
if [ $? -eq 0 ]; then
  install_brews
  configure_settings
  echo
  echo "All applications have been installed! See you around."
else
  install_brew
fi
