#!/bin/bash

hint() {
  echo "MKV TO MP3 CONVERT SCRIPT SYNTAX"
  echo "./mkv_to_mp3.sh /source/dir/file.mkv /destination/dir"
}

program_exists() {
  command -v "$1" >/dev/null 2>&1
}

if [ "$1" == "-h" ]; then
  hint
  exit
fi

if ! program_exists ffmpeg; then
  echo "Looks like ffmpeg is not installed"
  exit
fi

if [ ! -f "$1" ]; then
  echo "Input file does not exist."
  exit
fi

if [ ! -d "$2" ]; then
  echo "Output directory does not exist."
  exit
fi

TEMP_AVI="/tmp/temp_"$RANDOM".avi"
ffmpeg -i $1 -acodec mp3 -vcodec mpeg4 $TEMP_AVI # firstly, convert mkv to avi
ffmpeg -i $TEMP_AVI $2"/new_audio_"$RANDOM".mp3" # secondly, convert avi to mp3

rm $TEMP_AVI

echo "All done!"
