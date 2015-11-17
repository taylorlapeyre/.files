export PATH=$HOME/bin:$PATH
export PS1="\u: \[$(tput setaf 4)\]\w\[$(tput sgr0)\] $ "

# Show three directory levels deep before making the path more concise
export PROMPT_DIRTRIM=3

# Color is good.
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export TERM='xterm-color'
export EDITOR='vim'

# History is good.
export HISTSIZE=10000
export HISTCONTROL=erasedups

shopt -s cdspell
shopt -s nocaseglob

# Aliases, seperated between Linux and OSX systems
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases
if [ "$(uname -s)" == "Linux" ]; then
	alias ls='ls --color=auto'
	alias ll='ls -lGh --color=auto --group-directories-first'
	alias open='xdg-open'
	alias cleanarch='sudo pacman -Rsn $(pacman -Qqdt)'
else
	alias ls='ls -G'
	alias ll='ls -lhG'
fi

# ruby
alias be='bundle exec'

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.2.3

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
