#!/usr/bin/env bash

function install_brews() {
	brew update
	brew upgrade

	echo
	echo "Git is a distributed version control system."
	echo "- Do you want to install git? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install git 2> /dev/null
		echo "Installed Git"
	fi

	echo
	echo "Tig is an ncurses-based text-mode interface for git."
	echo "- Do you want to install tig? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install tig 2> /dev/null
		echo "Installed Tig"
	fi

	echo
	echo "Node.js is a platform built on Chrome's JavaScript runtime."
	echo "- Do you want to install node? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		brew install node 2> /dev/null
		echo "Installed Node"
	fi

	echo
	echo "Harp is a static web server with built-in preprocessing."
	echo "- Do you want to install harp? y/n"
	read RESPONSE
	if [[ "$RESPONSE" == "y" ]]; then
		npm install harp -g 2> /dev/null
		echo "Installed Harp"
	fi

	echo
	echo "GNU Stow is a useful utility for installing dotfiles."
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
		echo "Sublime Text is a sophisticated text editor for code, markup and prose."
		echo "- Do you want to install Sublime Text? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install sublime-text 2> /dev/null
			echo "Installed Sublime Text"
		fi

		echo
		echo "Dropbox is a cloud-based file hosting solution."
		echo "- Do you want to install Dropbox? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install dropbox 2> /dev/null
			echo "Installed Dropbox"
		fi

		echo
		echo "Google Chrome is a popular and modern web browser."
		echo "- Do you want to install Google Chrome? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install google-chrome 2> /dev/null
			echo "Installed Google Chrome"
		fi

		echo
		echo "VirtualBox is a virtualization platform for operating systems."
		echo "- Do you want to install Virtualbox? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install virtualbox 2> /dev/null
			echo "Installed Virtualbox"
		fi

		echo
		echo "Vagrant is a tool for building and distributing working environments."
		echo "- Do you want to install Vagrant? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install vagrant 2> /dev/null
			echo "Installed Vagrant"
		fi

		echo
		echo "Rdio is an ad-free music subscription service."
		echo "- Do you want to install Rdio? y/n"
		read RESPONSE
		if [[ "$RESPONSE" == "y" ]]; then
			brew cask install rdio 2> /dev/null
			echo "Installed Rdio"
		fi

		echo
		echo "Alfred is an award-winning productivity application for Mac OS X."
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
	echo "ATTENTION:"
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
	echo
	configure_settings

else
	install_brew
fi

