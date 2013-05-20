export PATH=$HOME/home/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $ "

# Shell options
set -o vi
shopt -s cdspell
shopt -s hostcomplete
shopt -s nocaseglob

# Rbenv
if [ -d $HOME/.rbenv ]; then
  eval "$(rbenv init -)"
fi

# Aliases
if [ "$(uname -s)" == "Linux" ]; then
  alias ls='ls --color=auto'
  alias ll='ls -lGh --color=auto --group-directories-first'
  alias open='xdg-open'
else
  alias ls='ls -G'
  alias ll='ls -lhG'
  alias subl='open -a "Sublime Text"'
fi
alias home='cd $HOME/home'
alias please='sudo '
alias cleanarch='sudo pacman -Rsn $(pacman -Qqdt)'


# Misc
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export TERM='xterm-color'
export HISTSIZE=10000
export HISTCONTROL=erasedups

hash tdo &> /dev/null
if [ $? -eq 0 ]; then
  tdo tasks
fi
