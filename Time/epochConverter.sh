#!/bin/bash

if [ $# -eq 0 ]
  then
    #echo "No arguments supplied"
    date +%s
    exit 0
fi

date -r $1
date -r $1 '+%d/%m/%Y::%H:%M:%S'