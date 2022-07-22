#!/bin/bash
###########

sh -c "/usr/local/bin/reloader.sh &"
exec "$@"
