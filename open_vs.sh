#!/bin/bash

echo "Enter your file path"

read -r path

if [ -z "$path" ]; 
then 

    echo "path can not be empty"
    exit 1
    
fi

if [ ! -e "$path" ]; 
then
     echo "path not found : $path"
     exit 1
fi

echo "======================"
echo "opening VS code........"
echo "======================"

code "$path"