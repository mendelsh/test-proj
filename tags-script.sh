#!/usr/bin/env bash


arr=($(git tag |grep "^Rel"))

arr=$(python3 -c "

from functools import cmp_to_key

def compare_elements(a, b):
    
    a = str(a)[4:].split('.')
    b = str(b)[4:].split('.')

    for index in range(len(a)):
        if a[index] > b[index]:
            return -1
        elif a[index] < b[index]:
            return 1
    return 0

sorted_arr = sorted($arr, key=cmp_to_key(compare_elements))
print(sorted_arr)
")

echo ${arr[*]}
