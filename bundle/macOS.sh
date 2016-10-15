#!/usr/bin/env bash

# install brew if not exist
if [ ! -f $(which brew) ]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # update packages
    brew update

    # install packages
    brew install tmux
    brew install reattach-to-user-namespace
    brew install minidlna
    brew install vim
    brew install dnsmasq
fi

