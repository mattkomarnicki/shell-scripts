#!/bin/bash

echo "Installing Homebrew and some essential apps."

xcode-select --install > /dev/null 2>&1

echo "Downloading Homebrew."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

HOMEBREW_CLI_APPS=(
 cask
 git
 git-flow
 tree
 unrar
 wget
 youtube-dl
)

# 1Password bought from App Store won't work with Google Chrome installed through Homebrew Cask
# So for now, those two will be installed manually
HOMEBREW_GUI_APPS=(
  iterm2
)

echo "Installing CLI apps."
for CLI_APP in "${HOMEBREW_CLI_APPS[@]}"; do
  brew install $CLI_APP
done

echo "Installing GUI apps."
for GUI_APP in "${HOMEBREW_GUI_APPS[@]}"; do
  brew cask install $GUI_APP
done

# Customize iTerm2 if needed
if [[ " ${GUI_APP[@]} " =~ "iterm2" ]]; then
  ITERM2_COLOR_THEME_NAME="Brogrammer.itermcolors"
  ITERM2_COLOR_THEME_DEST=$HOME/Desktop
  ITERM2_COLOR_THEME_SOURCE="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Brogrammer.itermcolors"

  cd $ITERM2_COLOR_THEME_DEST
  wget -O $ITERM2_COLOR_THEME_NAME $ITERM2_COLOR_THEME_SOURCE > /dev/null 2>&1

  echo "Downloading $ITERM2_COLOR_THEME_NAME theme to $ITERM2_COLOR_THEME_DEST."
  open "${ITERM2_COLOR_THEME_DEST}/${ITERM2_COLOR_THEME_NAME}"

  echo "Open iTerm2 Preferences, press (⌘ + ,) go to \"Profiles\" -> \"Colors\" tab and manually load imported preset."
fi

echo "All done!"
