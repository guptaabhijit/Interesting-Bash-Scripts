#!/bin/bash

filename=$1

if [ -z "$filename" ]
then
	echo "Enter filename"
else
	awk '!x[$0]++' $filename
fi
