#### These are my default configuration files for Unix systems.

I use [GNU Stow](http://www.gnu.org/software/stow/) for installing dotfiles. Feel free to use that as well:

``` bash
$ cd ~/.files
$ stow git
$ stow vim
$ stow bash
```

A firm understanding of the Unix toolchain is recommended before putting them onto your system. If you're using OS X, my [bootstrapping script][bs] may be helpful to you.

If you asked me,

> Taylor, what are your _favorite tools ever_?

I'd probably recommend using [Atom][atom] as your primary editor, [Google Chrome][chrome] as your browser, and [Bash][bash] as your shell.

[bash]: http://www.gnu.org/software/bash/
[atom]: http://atom.io
[chrome]: https://google.com/chrome
[bs]: /osx/bootstrap.sh
