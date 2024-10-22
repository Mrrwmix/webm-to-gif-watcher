#!/bin/bash
CODE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export $(grep -v '^#' $CODE_DIRECTORY/.env | xargs)

echo $WEBM_DIRECTORY
echo $GIF_DIRECTORY

inotifywait -m $WEBM_DIRECTORY -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        newWebmFile="$path$file"
        gifOutputFile="$GIF_DIRECTORY${file%.*}.gif"
        echo "$newWebmFile"
        echo "$gifOutputFile"
        ffmpeg -i "$newWebmFile" -pix_fmt rgb24 "$gifOutputFile"
    done