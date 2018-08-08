#!/bin/bash

echo "Enter number: "
read n
mult=1
for (( i=1; i<=n; i++ ))
do
let "mult=i*mult"
done
echo $mult