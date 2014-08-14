#!/bin/bash

set -e

cd $HOME

# install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

git clone git@github.com:jimrollenhagen/dotfiles-redux.git

cp dotfiles-redux/.vimrc $HOME
cp dotfiles-redux/.gitconfig $HOME
cp dotfiles-redux/.tmux.conf $HOME
cp dotfiles-redux/.zshrc $HOME

git clone git@github.com:openstack-dev/devstack.git
