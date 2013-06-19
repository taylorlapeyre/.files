# I like to be explicit with my PATH. the ~/home/bin path is personal.
export PATH=$HOME/home/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# The dollar sign is ubiquitous.
export PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $ "

# Shell options

# <3 vim
set -o vi

# Just misc. useful stuff.
shopt -s cdspell
shopt -s hostcomplete
shopt -s nocaseglob

# Chruby, for switching rubies
hash chruby-exec &> /dev/null
if [ $? -eq 0 ]; then
	source /usr/local/opt/chruby/share/chruby/chruby.sh
	chruby ruby-2.0
fi

# Aliases, seperated between Linux and OSX systems
if [ "$(uname -s)" == "Linux" ]; then
	alias ls='ls --color=auto'
	alias ll='ls -lGh --color=auto --group-directories-first'
	alias open='xdg-open'
	alias cleanarch='sudo pacman -Rsn $(pacman -Qqdt)'
else
	alias ls='ls -G'
	alias ll='ls -lhG'
	alias subl='open -a "Sublime Text"'
fi
# Let's be polite.
alias please='sudo '

# Color is good.
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export TERM='xterm-color'

# History is good.
export HISTSIZE=10000
export HISTCONTROL=erasedups

# A simple todo program that I made.
hash tdo &> /dev/null
if [ $? -eq 0 ]; then
	tdo tasks
fi
