#!/bin/bash

LIST=$(sudo docker ps -a | grep Exited | awk '{print $1}' | xargs)
if [[ -z $LIST ]]; then
        echo "Nothing to remove from exited list"
else
        echo "Removing exited containers"
       	sudo docker rm --force $LIST
fi
