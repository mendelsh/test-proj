#!/bin/bash

LOG_FILE=~/source-projects/test-proj/log-file
COUNTER=$(tail -n 1 $LOG_FILE)

while true; do
    HASH=$(git rev-parse master)

    git pull origin    
    CURRENT_HASH=$(git rev-parse master)

    if [[ "$HASH" != "$CURRENT_HASH" ]]; then
        COUNTER=$(python3 - <<EOF
        # Extract version from COUNTER
        ver = "$COUNTER"[1:]  
        ver = int(ver)        
        ver += 1              
        ver = 'v' + str(ver)  
        print(ver)            
        EOF 
        )
        # Output the result to a log file
        echo $COUNTER >> LOG_FILE 
    fi
    
    sleep 10
done

#mashehu

