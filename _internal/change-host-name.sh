#!/bin/bash

echo "Provide new host name that you would like to use with your Mac:"

read HOST

if [ "_" = "_$HOST" ];
then
    echo "Nothing given!"
    exit 1
fi

sudo scutil --set ComputerName "$HOST"
sudo scutil --set LocalHostName "$HOST"
sudo scutil --set HostName "$HOST"

echo "Great! Your Mac has been renamed. You may have to restart your computer to see changes."

exit 0
