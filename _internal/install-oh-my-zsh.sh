#!/bin/bash

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Activating theme..."
sed -i '' -e 's/^ZSH_THEME=.*/ZSH_THEME=\"simple\"/' ~/.zshrc

echo "Activating plugins..."
sed -i '' -e 's/^plugins=.*/plugins=(git, sublime)/' ~/.zshrc

echo "Great! Oh My Zsh is installed."

exit 0
