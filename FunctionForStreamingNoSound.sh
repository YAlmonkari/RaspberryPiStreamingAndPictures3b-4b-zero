#!/bin/bash
function start_stream {
        raspivid -n -a 12 -o - -t 0 -vf -hf -fps 25 -b 4500000 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/STREAMCODE
        while [ "$?" = "1" ]; do
        start_stream
        done
        }
start_stream
