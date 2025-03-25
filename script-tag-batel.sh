#!/bin/bash

#git tag | grep "^Rel"
latest_tag=$(git tag | grep "^Rel" | tail -n 1) 
echo "$latest_tag"

commit=$(git show "$latest_tag" | head -n 1 | awk '{print $2}')
echo "$commit"