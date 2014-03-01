#!/usr/bin/env bash

function install_brews() {
	brew update
	brew upgrade

	echo
	echo "$(tput setaf 2)Git$(tput sgr0) is a distributed version control system."
	echo "- Do you want to uprade git? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install git 2> /dev/null
		echo "Installed Git"
	fi

	echo
	echo "$(tput setaf 2)Vim$(tput sgr0) is the de-facto Unix text editor."
	echo "- Do you want to upgrade vim? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install vim 2> /dev/null
		echo "Installed Vim"
	fi

	echo
	echo "$(tput setaf 2)Tig$(tput sgr0) is an ncurses-based text-mode interface for git."
	echo "- Do you want to install tig? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install tig 2> /dev/null
		echo "Installed Tig"
	fi

	echo
	echo "$(tput setaf 2)Node$(tput sgr0) is a platform built on Chrome's JavaScript runtime."
	echo "- Do you want to install node? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install node 2> /dev/null
		echo "Installed Node"
	fi

  echo
  echo "$(tput setaf 2)Python$(tput sgr0) is probably out of date." 
  echo "- Do you want to get the most recent version? y/n"
  read RESPONSE
  if [[ "$RESPONSE" == "y" ]]; then
    brew install python 2> /dev/null
    echo "Updated Python"
  fi

  echo 
	echo "$(tput setaf 2)GNU Stow$(tput sgr0) is a useful utility for installing dotfiles."
	echo "- Do you want to install stow?"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install stow 2> /dev/null
		echo "Installed Stow"
	fi

	echo
	echo "This script can install GUI-based user applications, such as Google Chrome."
	echo "- Do you want to install GUI Applications? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew tap phinze/homebrew-cask 2> /dev/null
		brew install brew-cask 2> /dev/null

		echo
		echo "$(tput setaf 2)Sublime Text$(tput sgr0) is a sophisticated text editor for code, markup and prose."
		echo "- Do you want to install Sublime Text? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install sublime-text 2> /dev/null
			echo "Installed Sublime Text"
		fi

		echo
		echo "$(tput setaf 2)Dropbox$(tput sgr0) is a cloud-based file hosting solution."
		echo "- Do you want to install Dropbox? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install dropbox 2> /dev/null
			echo "Installed Dropbox"
		fi

		echo
		echo "$(tput setaf 2)Google Chrome$(tput sgr0) is a popular and modern web browser."
		echo "- Do you want to install Google Chrome? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install google-chrome 2> /dev/null
			echo "Installed Google Chrome"
		fi

		echo
		echo "$(tput setaf 2)Screenhero$(tput sgr0) is screen sharing made for remote developers"
		echo "- Do you want to install Screenhero? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install screenhero 2> /dev/null
			echo "Installed Screenhero"
		fi

		echo
		echo "$(tput setaf 2)Vagrant$(tput sgr0) is a tool for building and distributing working environments."
		echo "- Do you want to install Vagrant? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install virtualbox 2> /dev/null
			brew cask install vagrant 2> /dev/null
			echo "Installed Vagrant"
		fi

		echo
		echo "$(tput setaf 2)Silverlight$(tput sgr0) is an awful browser plug-in required for watching Netflix."
		echo "- Do you want to install Silverlight? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install silverlight 2> /dev/null
			echo "Installed Silverlight"
		fi

		echo
		echo "$(tput setaf 2)Rdio$(tput sgr0) is an ad-free music subscription service."
		echo "- Do you want to install Rdio? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install rdio 2> /dev/null
			echo "Installed Rdio"
		fi

		echo
		echo "$(tput setaf 2)Alfred$(tput sgr0) is an award-winning productivity application for Mac OS X."
		echo "- Do you want to install Alfred? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install alfred 2> /dev/null
			echo "Installed Alfred"
		fi
	fi
}

function configure_settings() {
	echo "- Do you want to disable the sound effects on boot? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		sudo nvram SystemAudioVolume=" "
	fi

	echo
	echo "- Do you want to disable the “Are you sure you want to open this application?” dialog? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		defaults write com.apple.LaunchServices LSQuarantine -bool false
	fi

	echo
	echo "- Do you want to use list view in all Finder windows by default? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
	fi

	echo
	echo "- Do you want to only use UTF-8 in Terminal.app? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		defaults write com.apple.terminal StringEncodings -array 4
	fi
}

function install_brew() {
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	echo
	echo "A$(tput setaf 3)ATTENTION:$(tput sgr0)"
	echo "Since this is the first time homebrew is being installed, I'm going to run brew doctor for you."
	echo "Run this script again after any issues are resolved."
	echo

	for COUNT in {5..0}; do
		echo -n "$COUNT "
		sleep 1
	done
	brew doctor
	exit
}

hash brew &> /dev/null
if [ $? -eq 0 ]; then
	install_brews
	echo
	echo "All applications have been installed!"
  echo "You'll probably want to edit /etc/paths to put /usr/local/bin first."
	echo
	configure_settings

else
	install_brew
fi

