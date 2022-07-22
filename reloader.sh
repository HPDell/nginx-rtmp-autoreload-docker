#!/bin/bash
###########

while true
do
    inotifywait --exclude ".swp|.swx" -e create -e modify -e delete -e move /etc/nginx/rtmp.d
    nginx -t
    if [ $? -eq 0 ]
    then
        echo "Detected Nginx Configuration Change"
        echo "Executing: nginx -s reload"
        nginx -s reload
    fi
done
