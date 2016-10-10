#!/bin/bash

echo "Removing unused volumes ..."
LIST=($(sudo docker volume ls | awk '{ print $2}' | grep -v VOLUME))
WORKING_LIST=($(sudo docker inspect --format='{{range $mounts := .Mounts}}{{(json $mounts)}}{{end}}' $(sudo docker ps -qa) | jq -c -r {Name} | grep -v null | awk -F \" '{print $4}'))

#echo element count in LIST: ${#LIST[*]}
#for item in ${!LIST[*]}
#do
#       printf "%s\n" "${LIST[$item]}"
#done

#echo element count in WORKING_LIST: ${#WORKING_LIST[*]}
#for item in ${!WORKING_LIST[*]}
#do
#       printf "%s\n" "${WORKING_LIST[$item]}"
#done

echo CLEANING
for wl in ${!WORKING_LIST[*]}; do
        #echo Checking: ${WORKING_LIST[$wl]}
        for line in ${!LIST[*]}; do
                #echo List item: ${LIST[$line]}
                if [ "${WORKING_LIST[$wl]}" != "${LIST[$line]}" ]; then
                        CLEAN_LIST+=( "${LIST[$line]}" )
                fi
        done
        unset LIST
        LIST=("${CLEAN_LIST[@]}")
        unset CLEAN_LIST
done

#echo element count in CLEAN_LIST: ${#LIST[*]}
if [[ -z ${#LIST[*]} ]]; then
        echo "Nothing to remove from volumes"
else
        for item in ${!LIST[*]}; do
                #printf "%s\n" "${LIST[$item]}"
                sudo docker volume rm ${LIST[$item]}
        done
fi
