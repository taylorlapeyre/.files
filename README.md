# .files

This is my command line environment. If you think you might want to use it, I suggest reading the files and taking ideas rather than copying them directly.

### Philosophy

The best amount of configuration is the least amount of configuration. Anything that works properly by default stays that way.

I should be able to clone this directory and be productive in less than 10 minutes.

### Installation

``` bash
$ # Install Homebrew..
$ # Clone this repository into $HOME:
$ git clone --recursive git@github.com:taylorlapeyre/.files.git $HOME

$ # Install Brews:
$ brew install $(cat ~/.files/brews.txt | tr "\\n" " ")

$ # Install Casks:
$ brew tap caskroom/cask
$ brew cask install $(cat ~/.files/casks.txt | tr "\\n" " ")

$ # Link dotfiles:
$ ln -s ~/.files/vim/* ~
$ ln -s ~/.files/bash/* ~
$ ln -s ~/.files/git/* ~
```