# webm-to-gif-watcher

A simple script that watches a directory for new webm files and converts them to gif using ffmpeg.

## Requirements
- ffmpeg
- inotify-tools
- bash
- .env file

## .env setup

```
WEBM_DIRECTORY=/path/to/webm/
GIF_DIRECTORY=/path/to/gif/
```