#!/bin/bash

set -e

cd $HOME

apt-get update
apt-get install git vim-nox tmux python-setuptools zsh

easy_install pip
pip install virtualenv virtualenvwrapper tox

USER_HOME=/home/jim
useradd -d $USER_HOME -m -s /bin/zsh jim

mkdir $USER_HOME/.ssh
cp $HOME/.ssh/authorized_keys $USER_HOME/.ssh/
chown -R jim:jim $USER_HOME/.ssh

git clone git@github.com:openstack-dev/devstack
cd devstack
STACK_USER=jim
DEST=$USER_HOME
bash tools/create-stack-user.sh
cd -

wget 'https://raw.githubusercontent.com/jimrollenhagen/dotfiles-redux/master/env-scripts/devstack-user.bash'
su jim -c 'bash devstack-user.bash'
