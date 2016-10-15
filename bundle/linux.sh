#!/bin/bash

sudo apt-get update
sudo apt-get install -y tmux vim zsh

chsh -s $(which zsh)
