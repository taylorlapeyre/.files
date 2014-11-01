#!/usr/bin/env bash
install_command="brew install"

function install_brew() {
  echo
  echo "Looks like you're brand new! Welcome to this bootstrap script."
  echo "I'm not going to install anything onto your system without your explicit permission."
  echo "furthermore, the only way I will install things is via '$install_command'."
  echo
  echo "First things first, I'm going to install $(tput setaf 2)homebrew$(tput sgr0)."
  echo "Type 'ok' to continue."

  read RESPONSE
  if [[ "$RESPONSE" == "ok" ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  echo
  echo "$(tput setaf 3)ATTENTION:$(tput sgr0)"
  echo "Since this is the first time homebrew is being installed, I'm going to give you a chance to correct anything that might have gone ary while installing homebrew. $(tput setaf 3)brew doctor$(tput sgr0) may be useful."
  echo "Run this script again after any issues are resolved."
  echo
  echo "Pro Tips:"
  echo "- You'll probably want to edit $(tput setaf 3)/etc/paths$(tput sgr0) to put $(tput setaf 3)/usr/local/bin$(tput sgr0) first."
  echo "- You can install the most recent Xcode command line tools via: $(tput setaf 3)xcode-select --install$(tput sgr0)"
  echo
  exit
}


function install_brews() {
  echo "Hello! First, I'm going to update homebrew's packages. Type 'ok' to continue."
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

  o "bash" \
    "You might also want the latest version of Bash."

  o "git" \
    "Git is a distributed version control system."

  o "vim" \
    "Vim is the de-facto Unix text editor."

  o "node" \
    "Node is a platform built on Chrome's JavaScript runtime."

  o "python" \
    "Python is probably out of date."

  o "chruby ruby-install" \
    "It's generally a bad idea to use the system ruby. " \
    "chruby is a good way to manage it instead."
  
  o "leiningen" \
    "Leiningen is the easiest way to use Clojure."

  o "tinyscheme" \
    "TinyScheme is a really really small Scheme interpreter."

  o "mysql" \
    "MySQL is the database that you know and love."

  o "postgresql" \
    "PostgreSQL is the database that you'd probably want to use."

  o "redis" \
    "Redis is an advanced key-value cache and store."

  o "mongodb" \
    "MongoDB is a document database powered by JavaScript."

  o "stow" \
    "GNU Stow is a useful utility for installing dotfiles."

  o "heroku-toolbelt" \
    "The Heroku Toolbelt is used for accessing the Heroku platform."

  echo
  echo "This script can install GUI-based user applications, such as Google Chrome."
  echo "- Do you want to install GUI Applications? y/n"
  read RESPONSE
  if [[ "$RESPONSE" == "y" ]]; then
    brew tap phinze/homebrew-cask 2> /dev/null
    brew install brew-cask 2> /dev/null
    install_command="brew cask install"

    o "atom" \
      "Atom is a hackable text editor for the 21st century."

    o "dropbox" \
      "Dropbox is a cloud-based file hosting solution."

    o "google-chrome" \
      "Google Chrome is a popular and modern web browser."

    o "virtualbox vagrant" \
      "Vagrant is a tool for building and distributing working environments."

    o "rdio" \
      "Rdio is an ad-free music subscription service."

    o "skype" \
      "Skype is a popular video conferencing application."

    o "slack" \
      "Slack is a real-time team communication system."

    o "java" \
      "Java is the standard JVM programming language."

    echo
    echo "This script can install fonts, such as Inconsolata."
    echo "- Do you want to install fonts? y/n"
    read RESPONSE
    if [[ "$RESPONSE" == "y" ]]; then
      brew tap caskroom/fonts

      o "font-inconsolata-dz" \
        "Inconsolata DZ is an improved version of the acclaimed Inconsolata."

      o "font-input" \
        "Input is a type family aimed at making code a pleasure to read."
    fi
  fi
}

hash brew &> /dev/null
if [ $? -eq 0 ]; then
  install_brews
  if [[ $? -eq 0 ]]; then
    echo
    echo "All applications have been installed. See you around!"
  else
    echo
    echo "Looks like something went wrong!"
  fi
else
  install_brew
fi
