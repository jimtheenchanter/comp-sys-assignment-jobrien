#!/bin/bash

clear 

#interface visual formatting for ease of reading
function highlight
{
	echo "=========================================="
	echo "$*"
	echo "=========================================="
}
#interface visual formatting for ease of reading

#redirect function after each operation
function menuredirect
{	echo
	echo "What would you like to do next?"
	echo "[m]ain menu"
	echo "[r]emove another customer"
	read input

	while [[ $input != 'm' ]] && [[ $input != 'r' ]]
		do	
			echo "!"
   			echo "Please enter valid option "
   			echo "[m]ain menu"
   			echo "[r]emove another customer"	 
   		read input
	done

  if [ $input == 'm' ]
	then ./Menu.sh
	elif  [ $input == 'r' ]
  then ./RemCust.sh
  
 fi
}

highlight Remove Customer
cat CustomerDetails.txt
echo
echo
echo "Who do you want to delete? (e.g. John Smith)"
read custName

grep -v -i "$custName" CustomerDetails.txt >  /tmp/CustomerDetails.txt

echo "Are you sure you want to delete $custName ?"
read areYouSure

	if [ $areYouSure == 'y' ]
	then mv /tmp/CustomerDetails.txt CustomerDetails.txt
		echo
		cat CustomerDetails.txt
		echo
		echo $custName "has been destroyed."
		echo
		menuredirect
	elif [ $areYouSure == 'n' ]
	then ./RemCust.sh
fi
	
	#./Menu.sh