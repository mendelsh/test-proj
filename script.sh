#!/bin/bash


LOG_FILE=$HOME/source-projects/test-proj/log-file
COUNTER=$(tail -n 1 $LOG_FILE)

while true; do
    DATE=$(date +"%H:%M %d-%m-%y")
    HASH=$(git rev-parse master)

    git pull origin    
    CURRENT_HASH=$(git rev-parse master)

    if [[ "$HASH" != "$CURRENT_HASH" ]]; then
        COUNTER=$(python3 -c "
# Extract version from COUNTER
num = '$COUNTER'.split(' ')[0]
ver = num[1:]  
ver = int(ver)        
ver += 1              
ver = 'v' + str(ver)  
print(ver)            
")
        # Output the result to a log file
        echo "Updated COUNTER: $COUNTER"
        echo "$COUNTER $DATE" >> "$LOG_FILE"
        git add .
        git commit -m "updating to $COUNTER"
        git push origin 
    fi
    
    sleep 10
done

#madfj

