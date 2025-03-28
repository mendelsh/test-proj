#!/bin/bash

#git tag | grep "^Rel"
latest_tag=$(git tag | grep "^Rel" | tail -n 1) 
echo "$latest_tag"

commit=$(git show "$latest_tag" | head -n 1 | awk '{print $2}')
echo "commit hash: $commit"
echo
echo "files changes:"

commits=($(git log --pretty=oneline "$commit" | nl | awk '{print $2}'))
len=${#commits[@]}
declare -A changes
for ((i=0; i<$len-1; i++))
do
   files=($(git diff --name-only "${commits[$i]}" "${commits[$i+1]}"))
   for file in "$files"
    do
        if [ "$file" != "" ]; then
            changes["$file"]="$file"
        fi
    done    
done

for file in "${changes[@]}"
do
    echo "  $file"
done
