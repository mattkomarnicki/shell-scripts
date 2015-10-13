#!/bin/bash

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "Oh My Zsh is not installed. Install it first to proceed."
  exit
fi

TEMP_FONT_DEST="/tmp/fonts_"$RANDOM

echo "Customizing Oh My Zsh."

echo "Setting a theme."
wget -P $ZSH/themes/ https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > /dev/null 2>&1
sed -i '' -e 's/^ZSH_THEME=.*/ZSH_THEME=\"bullet-train\"/' ~/.zshrc

echo "Bullet Train theme for OMZ requires Powerline Compatible Fonts."
echo "I will download them right now into $TEMP_FONT_DEST and install straight away."

mkdir -p $TEMP_FONT_DEST && cd $TEMP_FONT_DEST
git clone https://github.com/powerline/fonts.git .
./install.sh
rm -rf $TEMP_FONT_DEST

echo "Installing Powerline Compatible Fonts"
echo "However you have to set them manually in your iTerm2."
echo "Open iTerm2, press (⌘ + ,) go to the \"Text\" tab and manually change Regular and Non-ASCII Font to Droid Sans Mono for Powerline."

echo "Setting plugins"
sed -i '' -e 's/^plugins=.*/plugins=(git, sublime)/' $HOME/.zshrc

echo "All done!"
