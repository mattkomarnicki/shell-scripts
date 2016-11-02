#!/bin/bash

PROJECT_NAME= #project name
REPOSITORY= #project repository
DESTINATION_DIR=$HOME"/Documents/Backups/"$PROJECT_NAME

# No need to edit anything below
DATE=$(date +%F_%T | sed -E 's/[-:]+/_/g')
TEMP_DIR="/tmp/"$PROJECT_NAME"_"$DATE
TEMP_ARCHIVE=$PROJECT_NAME"_"$DATE".tar.bz2"

echo "Backing up "$PROJECT_NAME"."

mkdir -p $TEMP_DIR && cd $TEMP_DIR
git clone $REPOSITORY .
tar -cjf /tmp/$TEMP_ARCHIVE $TEMP_DIR
rm -rf $TEMP_DIR

if [ ! -d $DESTINATION_DIR ]; then
  mkdir -p $DESTINATION_DIR
fi

mv /tmp/$TEMP_ARCHIVE $DESTINATION_DIR

echo "Backup of "$PROJECT_NAME" done!"
