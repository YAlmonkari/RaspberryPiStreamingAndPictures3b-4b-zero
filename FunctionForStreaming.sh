#!/bin/bash
function start_stream {
        raspivid -a 12 -n -o - -t 0 -vf -hf -fps 25 -b 6000000 | ffmpeg -i pipe: -f alsa -ac 1 -itsoffset 5.00 -i plughw:0,0 -map 0:v -map 1:a -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/STRERAMCODE
        start_stream
        done
        }
start_stream
