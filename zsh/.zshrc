export PS1=$'%~ $ '
export PATH=$HOME/bin:$PATH

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export RUBYOPT='-W:no-deprecated -W:no-experimental'

alias ll='ls -lhG'
alias subl='open -a /Applications/Sublime\ Text.app'
alias code='open -a /Applications/Visual\ Studio\ Code.app'
alias firefox-with-server='/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox -start-debugger-server'
alias gti='git'

source /usr/local/opt/asdf/asdf.sh
if [[ -a ~/.env ]]; then
  source ~/.env
fi

function session_token {
  heroku run "node backend/scripts/generateSessionToken.js $1" --app wren-production
}
