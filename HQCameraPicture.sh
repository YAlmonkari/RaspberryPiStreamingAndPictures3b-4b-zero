#!/bin/bash
DATE=$(date +"%Y-%m-%d_%H%M%S")
raspistill -ex verylong -ss 200000 -o /home/pi/Pictures/$DATE.jpg -w 3280 -h 2464 -q 100
