## Clone
```bash
git clone --bare https://github.com/girlpunk/Dotfiles $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME submodule init
git --git-dir=$HOME/.cfg/ --work-tree=$HOME submodule update
```

## Update
```bash
config pull
```
