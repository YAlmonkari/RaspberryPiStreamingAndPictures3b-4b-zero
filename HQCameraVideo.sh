#!/bin/bash
DATE=$(date +"%Y-%m-%d_%H%M%S")
raspivid -a 12 -n -o - -t 0 -fps 25 -br 70 -co 55 -b 6000000 | ffmpeg -i pipe: -f alsa -ac 1 -itsoffset 5.00 -i plughw:0,0 -map 0:v -map 1:a -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv /home/pi/Pictures/$DATE.h264
ffmpeg -i /home/pi/Pictures/$DATE.h264 -vcodec copy /home/pi/Pictures/$DATE.mp4
#rm /home/pi/Pictures/$DATE.h264
