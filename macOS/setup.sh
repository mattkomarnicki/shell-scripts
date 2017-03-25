#!/bin/bash

echo "Creating SSH keys…"
if [ -d "$HOME/.ssh" ]; then
  echo "The .ssh directory in your home folder already exists. Skipping this step…"
else
  read -p "Please provide your e-mail address as a label: " USER_EMAIL
  if [[ -z "$USER_EMAIL" ]]; then
     echo "No input provided. Exiting…"
     exit 1
  else
    ssh-keygen -t rsa -b 4096 -C "$USER_EMAIL"
    pbcopy < $HOME/.ssh/id_rsa.pub
    echo "The content of the id_rsa.pub file has been copied to your clipboard."
    echo "Add it to your GitHub account."
  fi
fi

echo "Installing Xcode command line tools…"
xcode-select --install > /dev/null 2>&1

echo "Installing Homebrew package manager for macOS…"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# sometimes starting from scratch is the last resort
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

brew update

brew install cask
brew install codeception
brew install composer
brew install coreutils
brew install curl
brew install git
brew install git-flow
brew install mysql
brew install node
brew install phantomjs
brew install php-code-sniffer
brew install php-cs-fixer
brew install php70
brew install php70-pdo-pgsql
brew install phpunit
brew install postgresql
brew install rsync # edit /private/etc/paths to put /usr/local/bin before /usr/bin
brew install tree
brew install unrar
brew install wget
brew install youtube-dl

brew cask install google-chrome
brew cask install iterm2
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant

echo "Customizing iTerm…"
ITERM2_COLOR_THEME_NAME="Brogrammer.itermcolors"
ITERM2_COLOR_THEME_DEST=/tmp
ITERM2_COLOR_THEME_SOURCE="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Brogrammer.itermcolors"

cd $ITERM2_COLOR_THEME_DEST
wget -O $ITERM2_COLOR_THEME_NAME $ITERM2_COLOR_THEME_SOURCE > /dev/null 2>&1
open "${ITERM2_COLOR_THEME_DEST}/${ITERM2_COLOR_THEME_NAME}"

echo "Open iTerm Preferences, press (⌘ + ,) go to \"Profiles\" -> \"Colors\" tab and manually load imported preset."

echo "Installing Oh My Zsh…"
#rm -rf ~/.oh-my-zsh
#rm ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Customizing Oh My Zsh…"
TEMP_FONT_DEST="/tmp/fonts_"$RANDOM
wget -P $HOME/.oh-my-zsh/themes/ https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > /dev/null 2>&1
sed -i '' -e 's/^ZSH_THEME=.*/ZSH_THEME=\"bullet-train\"/' $HOME/.zshrc

echo "Bullet Train theme for OMZ requires Powerline Compatible Fonts."
echo "I will download them right now and install straight away."

mkdir -p $TEMP_FONT_DEST && cd $TEMP_FONT_DEST
git clone https://github.com/powerline/fonts.git .
./install.sh
rm -rf $TEMP_FONT_DEST

echo "Installing Powerline Compatible Fonts…"
echo "However you have to set them manually in your iTerm2."
echo "Open iTerm2, press (⌘ + ,) go to the \"Text\" tab and manually change Regular and Non-ASCII Font to Droid Sans Mono for Powerline."

echo "Setting plugins…"
sed -i '' -e 's/^plugins=.*/plugins=(git, sublime)/' $HOME/.zshrc

echo "Setting Oh My Zsh aliases…"

cat > $HOME/.zsh_aliases << EOF
alias vup='cd $HOME/Homestead && vagrant up'
alias vhalt='cd $HOME/Homestead && vagrant halt'
alias vssh='cd $HOME/Homestead && vagrant ssh'
alias code='cd $HOME/Code'
alias ls='ls -Glah'
alias dumpa='php artisan dump:autoload'
alias yt='youtube-dl -f best -i -o "%(upload_date)s_%(title)s.%(ext)s"'
alias yta='youtube-dl --extract-audio --audio-format mp3'

EOF

grep -q ". $HOME/.zsh_aliases" "$HOME/.zshrc" || echo ". $HOME/.zsh_aliases" >> "$HOME/.zshrc"

# Development environment for toys like PHP and Laravel
echo "Preparing development environment…"

DIR_CODE=$HOME/Code
DIR_REPOSITORIES=$HOME/Repositories
DIR_HOMESTEAD=$HOME/Homestead

echo "Creating directory for further projects…"
mkdir -p $DIR_CODE
mkdir -p $DIR_REPOSITORIES

echo "Installing Homestead for PHP 7…"
mkdir -p $DIR_HOMESTEAD
git clone https://github.com/laravel/homestead.git $DIR_HOMESTEAD

cd $DIR_HOMESTEAD
bash init.sh
