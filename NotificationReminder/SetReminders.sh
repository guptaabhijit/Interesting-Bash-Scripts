#!/bin/bash

#afplay /System/Library/Sounds/Sosumi.aiff
#crontab -e

if [ $# -ne 2 ]
  then 
  	echo "Please pass title and message"
  	exit
fi

title=$1
message=$2


/usr/bin/osascript -e "display notification \"$message\" with title \"$title\" "