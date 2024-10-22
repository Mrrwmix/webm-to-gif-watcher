#!/bin/bash
CODE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export $(grep -v '^#' $CODE_DIRECTORY/.env | xargs)

echo incoming .webm directory: $WEBM_DIRECTORY
echo output .gif directory: $GIF_DIRECTORY

inotifywait -m $WEBM_DIRECTORY -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        newWebmFile="$path$file"
        gifOutputFile="$GIF_DIRECTORY${file%.*}.gif"
        
        ffmpeg -i "$newWebmFile" -pix_fmt rgb24 "$gifOutputFile"

        echo "$gifOutputFile created"
    done