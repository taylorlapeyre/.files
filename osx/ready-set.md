1. Make a new SSH Key: `ssh-keygen -t rsa -C taylorlapeyre@gmail.com`
2. Add it on [GitHub][gssh] and on [Heroku][hssh]
3. Clone this repository.
4. Use Cider to install your things:
  - `ln -s ~/.files ~/.cider`
  - `pip install cider`
  - `cider restore`
5. Set up Ruby:
  - `ruby-install ruby`
  - `exec $SHELL`
  - `gem install bundler`
6. Install vim plugins: `:BundleInstall`

Go.
