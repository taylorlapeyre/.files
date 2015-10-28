# .files

This is my command line environment. If you think you might want to use it, I suggest reading the files and taking ideas rather than copying them directly.

### Philosophy

The best amount of configuration is the least amount of configuration. Anything that works properly by default stays that way.

I should be able to clone this directory and be productive in less than 10 minutes.

### Installation

I'm going to assume you are doing this on a **new OSX install.**

1. You'll want to **download Xcode**. Go to the App Store and do that. Make sure to do any OSX updates while you're at it.
2. Install the **Xcode Command Line Tools**. You can do it through Xcode preferences.
3. Next you'll **generate an ssh key**. Your own personal _key to the internet_. You know the drill.

  ```bash
  $ ssh-keygen -t rsa -C taylorlapeyre@gmail.com
  ```
4. Go ahead and add this key to your **GitHub profile**.
5. You'll need **Homebrew**. Go to their website to install it - I think http://brew.sh
6. **Clone this repository** (recursively) into your `$HOME` and check it out. Pretty cozy in here.
7. **Install all the brews** that are listed. You can use some fancy unix to do it:

  ```bash
  brew install $(cat ~/.files/brews.txt | tr "\\n" " ")
  ```
8. Install **brew cask** and install the applications listed here:

  ```bash
  $ brew install caskroom/cask/brew-cask
  $ brew cask install $(cat ~/.files/casks.txt | tr "\\n" " ")
  ```
9. I'd tell you that there's some fancy way to **link every dotfile** here at once, but there really isn't a good way. Do it by hand:

  ```bash
  cd ~
  # vim
  ln -s .files/vim/.vimrc .
  ln -s .files/vim/.vim .
  
  # bash
  ln -s .files/bash/.bashrc .
  ln -s .files/bash/.bash_profile .
  
  # git
  ln -s .files/git/.gitconfig .
  ```
10. Open the **solarized.terminal** file in /osx.

You're good to go! You might want to think about installing ruby with ruby-install.
