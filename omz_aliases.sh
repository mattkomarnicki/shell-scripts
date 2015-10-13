#!/bin/bash

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "Oh My Zsh is not installed. Install it first to proceed."
  exit
fi

echo "Setting Oh My Zsh aliases"

cat > $HOME/.zsh_aliases << EOF
alias vup='cd $HOME/Homestead && vagrant up'
alias vhalt='cd $HOME/Homestead && vagrant halt'
alias vssh='cd $HOME/Homestead && vagrant ssh'
alias code='cd $HOME/Code'
alias ls='ls -Glah'
alias dumpa='php artisan dump:autoload'

EOF

grep -q ". $HOME/.zsh_aliases" "$HOME/.zshrc" || echo ". $HOME/.zsh_aliases" >> "$HOME/.zshrc"

echo "All done!"
