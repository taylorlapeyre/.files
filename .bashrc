if [ $UID == 0 ]; then
  token="#"
else
  token="$"
fi

export PATH=$HOME/home/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $token "

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
else
  alias ls='ls -G'
  alias ll='ls -lhG'
  alias subl='open -a "Sublime Text 2"'
fi
alias xopen='xdg-open'
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
