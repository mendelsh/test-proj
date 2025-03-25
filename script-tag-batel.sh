#!/bin/bash
rel_array=$(git tag | grep "^v")
echo "${rel_array[*]}"
 
