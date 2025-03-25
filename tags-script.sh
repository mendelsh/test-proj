#!/usr/bin/env bash

arr=($(git tag | grep "^Rel"))

arr=$(python3 -c "

from functools import cmp_to_key

arr = '${arr[*]}'.split()


def compare_elements(a, b):
    a = str(a)[4:].split('.')
    b = str(b)[4:].split('.')
    for index in range(min(len(a), len(b))):
        if int(a[index]) > int(b[index]):
            return -1
        elif int(a[index]) < int(b[index]):
            return 1
    return len(b) - len(a)


sorted_arr = sorted(arr, key=cmp_to_key(compare_elements))

print(' '.join(sorted_arr))
")

echo "$arr"

