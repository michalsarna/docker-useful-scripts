#!/bin/bash

LIST=$(sudo docker images | grep none | awk '{print $3}' | xargs)
if [[ -z $LIST ]]; then
        echo "Nothing to remove from exited list"
else
        echo "Removing <none> images"
        sudo docker rmi $LIST
fi
