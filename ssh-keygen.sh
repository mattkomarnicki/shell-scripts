#!/bin/bash

if [ -d "$HOME/.ssh" ]; then
  echo "The .ssh directory in your home folder already exists so I assume that there is nothing to do."
  exit
fi

ssh-keygen -t rsa -b 4096 -C "$1"
