export PATH=$HOME/home/bin:$HOME/bin:$PATH

# Show three directory levels deep before making the path more concise
export PROMPT_DIRTRIM=3
export MARKPATH=$HOME/.marks

# Color is good.
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export TERM='xterm-color'

# History is good.
export HISTSIZE=10000
export HISTCONTROL=erasedups

shopt -s cdspell
shopt -s hostcomplete
shopt -s nocaseglob
shopt -s globstar

# Let me know if I'm on a remote host. Format: "username: ~/path $ "
if [ -z "$SSH_CLIENT" ]; then
	export PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $ "
else
	export PS1="($(hostname)) \u: \[$(tput setaf 3)\]\w\[$(tput sgr0)\] $ "
fi

if [[ -f $HOME/.bash_aliases ]]; then
	source $HOME/.bash_aliases
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
alias branch='git branch | cut -c 3- | selecta | xargs git checkout'

# Ruby stuff
alias brake='bundle exec rake'
alias spec='bundle exec rspec spec'

# Everlane stuff
alias evertest='bundle exec bin/rspec spec'
alias everconsole='bundle exec bin/rails c'
alias everserver='bundle exec bin/rails s'
alias everrake='bundle exec bin/rake'

# RVM, for switching rubies
if [ -d $HOME/.rvm ]; then
	source $HOME/.rvm/scripts/rvm
fi

# A simple todo program that I made.
hash tdo &> /dev/null
if [ $? -eq 0 ]; then
	tdo tasks
fi

function todo() {
	touch ~/Desktop/"$*"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
