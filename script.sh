#!/bin/bash

#LOG_FILE=~/git-test/test-repo/log-file

while true; do
    HASH=$(git rev-parse origin/main)

    git fetch origin/main 
    CURRENT_HASH=$(git rev-parse origin/main)

    if [[ "$HASH" != "$CURRENT_HASH" ]]; then
        echo "The commit is changed!"
    fi
    
    sleep 10
done

