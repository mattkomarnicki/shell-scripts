#!/bin/bash

echo "Homebrew requires Command Line Tools. I have to install them first."

xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Great! Homebrew is installed."

exit 0
