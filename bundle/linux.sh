#!/bin/bash

sudo apt-get update
sudo apt-get install -y tmux vim-gtk zsh

chsh -s $(which zsh)
