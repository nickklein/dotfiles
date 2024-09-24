#!usr/bin/env sh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

read -p "Replace existing Neovim config inside /.config/nvim?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Neovim
    rm -rf $HOME/.config/nvim
    ln -s $DOTFILES/nvim $HOME/.config/nvim
fi

read -p "Replace existing gitconfig config inside /HOME/.gitconfig?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Git
    rm -rf $HOME/.gitconfig
    ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
fi

read -p "Replace existing tmux config inside /HOME/.tmux.conf?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    #tmux
    rm -rf $HOME/.tmux.conf
    ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
fi

#bash
read -p "Replace existing bash inside /HOME/.bashrc?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf $HOME/.bashrc
    ln -sf $DOTFILES/bash/bashrc $HOME/.bashrc
fi

#bash aliases
read -p "Replace existing bash_aliases inside /HOME/.bash_aliases?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf $HOME/.bash_aliases
    ln -sf $DOTFILES/bash/bash_aliases $HOME/.bash_aliases
fi

# mycli
read -p "Replace existing mycli inside /HOME/.my.cnf?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf $HOME/.my.cnf
    ln -sf $DOTFILES/mycli/myclicnf $HOME/.my.cnf
fi
