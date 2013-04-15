PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/taylorlapeyre/home/bin
eval "$(rbenv init -)"

export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
alias subl='open -a "Sublime Text 2"'
alias home='cd ~/home'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

export HISTSIZE=10000
export HISTCONTROL=erasedups

source "`brew --prefix`/etc/grc.bashrc"
source '/usr/local/Cellar/git/1.8.0.2/etc/bash_completion.d/git-completion.bash'

PS1="\u: \[$(tput setaf 6)\]\w\[$(tput sgr0)\] $ "

