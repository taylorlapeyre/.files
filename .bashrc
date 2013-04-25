PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/home/bin

shopt -s cdspell
shopt -s hostcomplete
shopt -s nocaseglob
set -o vi

if [ -d $HOME/.rbenv ]; then
  eval "$(rbenv init -)"
fi

export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lGh'
alias subl='open -a "Sublime Text 2"'
alias home='~/home'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

export HISTSIZE=10000
export HISTCONTROL=erasedups

PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $ "

