export PS1=$'\e[0;95m%~\e[0m \$ '
export PATH=$HOME/bin:$PATH

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

alias ll='ls -lhG'
alias subl='open -a /Applications/Sublime\ Text.app'
alias firefox-with-server='/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox -start-debugger-server'

source /usr/local/opt/asdf/asdf.sh
if [[ -a ~/.env ]]; then
  source ~/.env
fi
