#!/bin/bash

while [ 1 -eq 1 ]
do
echo "Enter your name: "
read name
if [ -z "$name" ] 
	then
	break
fi
echo "The name you entered is '$name'. Hi $name!"
echo "Do you want to continue your work? Please, enter 'yes' or 'no'"
read answer
if [ "$answer" = "yes" ] 
then
	echo "Enter your age: "
	read age
	if !(echo "$age" | grep -E -q "^?[0-9]+$") 
	then
		break
	fi
	if [ "$age" -eq 0 ]
		then break
	elif [ $age -ge 1 -a $age -le 16 ]; then
		echo "$name, your group is child"
	elif [ $age -ge 17 -a $age -le 25 ]; then
		echo "$name, your group is youth"
	else echo "$name, your group is adult"	
	fi	
else
	break
fi
done
echo "Bye"