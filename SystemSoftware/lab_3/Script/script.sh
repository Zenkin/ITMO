#!/bin/bash

while [ ]
echo Enter your name:
read name
do
if [ "$name" != "" ]; then
echo The name you entered is $name. Hi $name!
echo Do you want to continue?
read answer
if [ "$answer" = "yes" ]; then
	echo Enter your age:
	read age
	
	if ((1<=age && age<=16))
	then
		echo "$name, your group is child"

	elif ((17<=age && age<=25))
	then
		echo "$name, your group is youth"
	elif ((26<=age && age<=100))
	then
		echo "$name, your group is adult"
	else
		echo "Enter correct age"
	fi
else
	break		
fi
else
	break
fi
done
echo Bye