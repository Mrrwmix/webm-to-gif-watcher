#!/bin/bash
export $(grep -v '^#' .env | xargs)

echo $FOLDER_WITH_WEBM
echo $FOLDER_WITH_GIF

inotifywait -m $FOLDER_WITH_WEBM -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        newWebmFile="$path$file"
        gifOutputFile="$FOLDER_WITH_GIF${file%.*}.gif"
        echo "$newWebmFile"
        echo "$gifOutputFile"
        ffmpeg -i "$newWebmFile" -pix_fmt rgb24 "$gifOutputFile"
    done