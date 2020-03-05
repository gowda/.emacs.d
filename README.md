### .emacs.d

##### Clone the repository
```bash
$ git clone https://github.com/gowda/.emacs.d.git $HOME/dot-emacs.d
```

##### Start emacs by specifying config file
```bash
$ emacs --no-init-file --load dot-emacs.d/init.el
```

##### Use with emacs by default
```bash
$ mv $HOME/.emacs.d $HOME/.emacs.d.old
$ mv $HOME/dot-emacs.d $HOME/.emacs.d
$ emacs
```
