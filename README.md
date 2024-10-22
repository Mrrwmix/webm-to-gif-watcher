# webm-to-gif-watcher

A simple script that watches a directory for new webm files and converts them to gif using ffmpeg.

## Requirements
- ffmpeg
- inotify-tools
- bash
- .env file

## .env setup

```
FOLDER_WITH_WEBM=/path/to/webm/
FOLDER_WITH_GIF=/path/to/gif/
```