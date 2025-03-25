#!/usr/bin/env bash


arr=($(git tag --sort=-creatordate |grep "^v"))

echo ${arr[0]}
