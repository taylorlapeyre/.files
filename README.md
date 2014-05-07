#### These are my default configuration files for Unix systems.

Use [GNU Stow](http://www.gnu.org/software/stow/) to install the dotfiles that you like:

``` bash
$ cd ~/.files
$ stow git
$ stow vim
$ stow bash
```

A firm understanding of the Unix toolchain is recommended before installing them onto your system. If you're using OS X, my [bootstrapping script][bs] may be helpful to you.

I recommend using [Atom][atom] as your primary editor, [Google Chrome][chrome] as your browser, and [Bash][bash] as your shell.

[bash]: http://www.gnu.org/software/bash/
[atom]: http://atom.io
[chrome]: https://google.com/chrome
[bs]: /osx/boostrap.sh
