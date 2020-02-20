export PS1=$'%~ \$ '
export PATH=$HOME/bin:$PATH

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

alias ll='ls -lhG'
alias subl='open -a /Applications/Sublime\ Text.app'
alias firefox-with-server='/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox -start-debugger-server'
alias fucksophos='while sleep 2; do sudo killall -9 SophosScanD; done'

source /usr/local/opt/asdf/asdf.sh
if [[ -a ~/.env ]]; then
  source ~/.env
fi
