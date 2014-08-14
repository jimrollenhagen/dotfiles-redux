#!/bin/bash

set -e

cd $HOME

apt-get update
apt-get install -y git vim-nox tmux python-setuptools zsh

easy_install pip
pip install virtualenv virtualenvwrapper tox

USER_HOME=/home/jim
if [[ ! -e "$USER_HOME" ]]; then
    useradd -d $USER_HOME -m -s /bin/zsh jim

    mkdir $USER_HOME/.ssh
    cp $HOME/.ssh/authorized_keys $USER_HOME/.ssh/
    chown -R jim:jim $USER_HOME/.ssh
fi

if [[ ! -e devstack ]]; then
    git clone git@github.com:openstack-dev/devstack
    cd devstack
    STACK_USER=jim
    DEST=$USER_HOME
    bash tools/create-stack-user.sh
    cd -
fi

wget 'https://raw.githubusercontent.com/jimrollenhagen/dotfiles-redux/master/env-scripts/devstack-user.bash' -O $USER_HOME/devstack-user.bash
