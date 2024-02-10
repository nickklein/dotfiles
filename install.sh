#!usr/bin/env sh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Neovim
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

#tmux
rm -rf $HOME/.tmux.conf
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

#bash
rm -rf $HOME/.bashrc
ln -sf $DOTFILES/bash/bashrc $HOME/.bashrc

# mycli
rm -rf $HOME/.my.cnf
ln -sf $DOTFILES/mycli/myclicnf $HOME/.my.cnf
