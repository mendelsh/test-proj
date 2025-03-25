#!/usr/bin/env bash
arr=($(git tag |grep "^Rel"))
arr=$(python3 -c "
import sys
from functools import cmp_to_key

def compare_elements(a, b):
    a = str(a)[4:].split('.')
    b = str(b)[4:].split('.')
    for index in range(min(len(a), len(b))):
        if int(a[index]) > int(b[index]):
            return -1
        elif int(a[index]) < int(b[index]):
            return 1
    return len(b) - len(a)

# Use sys.argv to pass the list of tags
tags = sys.argv[1:]
sorted_arr = sorted(tags, key=cmp_to_key(compare_elements))
print(' '.join(sorted_arr))
")
echo ${arr[*]}