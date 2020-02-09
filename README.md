# .files

This is my command line environment. If you think you might want to use it, I suggest reading the files and taking ideas rather than copying them directly.

### Philosophy

The best amount of configuration is the least amount of configuration. Anything that works properly by default stays that way.

I should be able to clone this directory and be productive in less than 10 minutes.

### Installation

I'm going to assume you are doing this on a **new OSX install.**

1. You'll want to **download Xcode**. Go to the App Store and do that. Make sure to do any OSX updates while you're at it.
2. Install the **Xcode Command Line Tools**. You can do it through Xcode preferences.
3. Next you'll **generate an ssh key**.

  ```bash
  $ ssh-keygen -t rsa -C taylorlapeyre@gmail.com
  ```
4. Go ahead and add this key to your **GitHub profile**.
5. You'll need **Homebrew**. Go to their website to install it - I think http://brew.sh
6. **Clone this repository** into your `$HOME` and check it out. 
7. **Install all the brews** that are listed.

  ```bash
  brew install $(cat ~/.files/brews.txt | tr "\\n" " ")
  ```
8. You'll probably also want to install some language versions with `asdf`. Maybe ruby or nodejs?
9. I'd tell you that there's some fancy way to **link every dotfile** here at once, but there really isn't a good way. Do it by hand:

  ```bash
  cd ~
  ln -s .files/vim/.vimrc .
  ln -s .files/vim/.vim .
  
  ln -s .files/zsh/.zshrc .
  
  ln -s .files/git/.gitconfig .

  ln -s .files/bin .

  ln -s .files/.tool-versions .
  ```

