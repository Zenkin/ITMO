#!/bin/bash

myVar=1

echo "Enter var"
read data
if !(echo "$data" | grep -E -q "^?[0-9]+$") 
	then
		echo "Not Number, please try again"
		read data
fi

if [ $data -eq $myVar ] 
	then
		echo "Variant is correct"
fi