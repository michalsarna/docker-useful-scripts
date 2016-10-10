#!/bin/bash

LIST=$(sudo docker ps -a | grep Dead | awk '{print $1}' | xargs)
if [[ -z $LIST ]]; then
       	echo "Nothing to remove from dead list"
else
       	echo "Removing dead containers"
       	sudo docker rm --force $LIST
fi
