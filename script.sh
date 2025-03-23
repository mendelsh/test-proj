#!/bin/bash

#LOG_FILE=~/git-test/test-repo/log-file

while true; do
    HASH=$(git rev-parse master)

    git fetch origin    # pull/fetch the latest changes from the remote repository
    CURRENT_HASH=$(git rev-parse master)

    if [[ "$HASH" != "$CURRENT_HASH" ]]; then
        echo "The commit is changed!"
    fi
    
    sleep 10
done

