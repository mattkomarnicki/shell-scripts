#!/bin/bash

SCRIPTS_DIR=_internal
RED=`tput setaf 1`
YEL=`tput setaf 3`
GRE=`tput setaf 2`
RESET=`tput sgr0`

echo "${GRE}+----------------------------------------------------------------+"
echo "${GRE}| Hi! Brand new Mac? Let's make it more customized to your needs.|"
echo "${GRE}+----------------------------------------------------------------+"
echo ${RESET}

# Change host name
read -r -p "Would you like to change your Mac host name? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        sh $SCRIPTS_DIR/change-host-name.sh
        result=$?
        if [ $result -eq 1 ]; then
            echo "${RED}Host name has not been changed${RESET}"
        fi
        ;;
    *)
        echo "${YEL}Skipping${RESET}"
        ;;
esac

# Generate SSH keys
read -r -p "Would you like to generate SSH keys? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        sh $SCRIPTS_DIR/generate-ssh-keys.sh
        result=$?
        if [ $result -eq 1 ]; then
            echo "${RED}SSH keys have not been generated${RESET}"
        fi
        ;;
    *)
        echo "${YEL}Skipping${RESET}"
        ;;
esac

# Command Line Tools and Homebrew
read -r -p "Would you like to install Homebrew? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        sh $SCRIPTS_DIR/install-xcode-homebrew.sh
        result=$?
        if [ $result -eq 1 ]; then
            echo "${RED}Homebrew has not been installed${RESET}"
        fi
        ;;
    *)
        echo "${YEL}Skipping${RESET}"
        ;;
esac

# Oh My Zsh
read -r -p "Would you like to install Oh My Zsh? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        sh $SCRIPTS_DIR/install-oh-my-zsh.sh
        result=$?
        if [ $result -eq 1 ]; then
            echo "${RED}Oh My Zsh has not been installed${RESET}"
        fi
        ;;
    *)
        echo "${YEL}Skipping${RESET}"
        ;;
esac

echo "${GRE}+----------------------------------------------------------------+"
echo "${GRE}| Congratulations! Seems that all done!                          |"
echo "${GRE}+----------------------------------------------------------------+"
echo ${RESET}
