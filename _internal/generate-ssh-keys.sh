#!/bin/bash

cd ~

if [ -d ".ssh" ]; then
    echo "It looks like .ssh directory already exists."
    read -r -p "Do you want to remove whole directory and generate new keys? [Y/n] " input

    case $input in
        [yY][eE][sS]|[yY])
            rm -rf .ssh
            echo "Old .ssh directory removed"
            ;;
        *)
            exit 1
            ;;
    esac
fi

echo "Provide GitHub email address:"

read EMAIL

if [ "_" = "_$EMAIL" ];
then
    echo "Nothing given!"
    exit 1
elif [[ $EMAIL != *@* ]];
then
    echo "Provided e-mail address seems to be invalid!"
    exit 1
fi

echo "Generating SSH keys. Follow instructions on the screen"

ssh-keygen -t rsa -b 4096 -C "$EMAIL"

echo "Adding SSH key to the ssh-agent"

ssh-add ~/.ssh/id_rsa

echo "Copying SSH key to your clipboard"

pbcopy < ~/.ssh/id_rsa.pub

echo "Great! Your public key has been copied to clipboard. Go to https://github.com/settings/ssh, add new key and paste the content."

exit 0
