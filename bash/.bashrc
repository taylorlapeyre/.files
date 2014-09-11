export PATH=$HOME/bin:$PATH

# Show three directory levels deep before making the path more concise
export PROMPT_DIRTRIM=3

# Color is good.
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export TERM='xterm-color'
export EDITOR='vi'

# History is good.
export HISTSIZE=10000
export HISTCONTROL=erasedups

shopt -s cdspell
shopt -s nocaseglob

# Let me know if I'm on a remote host. Format: "username: ~/path $ "
if [ -z "$SSH_CLIENT" ]; then
	export PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $ "
else
	export PS1="($(hostname)) \u: \[$(tput setaf 3)\]\w\[$(tput sgr0)\] $ "
fi

[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

# Aliases, seperated between Linux and OSX systems
if [ "$(uname -s)" == "Linux" ]; then
	alias ls='ls --color=auto'
	alias ll='ls -lGh --color=auto --group-directories-first'
	alias open='xdg-open'
	alias cleanarch='sudo pacman -Rsn $(pacman -Qqdt)'
else
	alias ls='ls -G'
	alias ll='ls -lhG'
fi

# Let's be polite.
alias please='sudo '

# Rails stuff
alias rtest='bundle exec rspec spec'
alias rconsole='bundle exec rails c'
alias rserver='bundle exec rails s'
alias rrake='bundle exec rake'

# LSU stuff
alias sshproglang='ssh cs410127@classes.csc.lsu.edu'

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.1.2

function todo() {
	touch ~/Desktop/"$*"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
