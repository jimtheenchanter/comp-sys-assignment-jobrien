#!/bin/bash

#clear the console to ensure user focus is at top of page
clear

#interface visual formatting for ease of reading
function highlight
{
	echo "=========================================="
	echo "$*"
	echo "=========================================="
}


#redirect function after each operation
function menuredirect
{
	echo "What would you like to do next?"
	echo "[m]ain menu"
	echo "[s]earch for another customer"
	read input

	while [[ $input != 'm' ]] && [[ $input != 's' ]]
		do
   			echo "enter valid option "
   			echo "[m]ain menu"
   			echo "[s]earch for another customer"	 
   		read input
	done

  if [ $input == 'm' ]
	then ./Menu.sh

	elif  [ $input == 's' ]
  then ./FindCust.sh
  
 fi

}

highlight "SEARCH FOR A CUSTOMER"

echo "Please choose one of the following:"
echo	"	1. Search first name"
echo	"	2. Search surname"
echo	"	3. Search by county"
echo	"	4. Search by any criteria"
echo    
echo    "0.     >> Return to Main Menu"
echo ======================================
echo "Please enter number "
read input


case $input in

	1)
	echo 'Please enter first name'
	read fname
	#grep "$fname" CustomerDetails.txt | awk '{print $1}'
	echo "Customers matching the name $fname :"
	grep -i "$fname" CustomerDetails.txt 
	
	menuredirect

#echo "What would you like to do next?"
#echo "[m]ain menu"
#echo "[s]earch for another customer"
#read input

#while [[ $input != 'm' ]] && [[ $input != 's' ]]
#do
 #  echo "enter valid option "
  # echo "[m]ain menu"
   #echo "[s]earch for another customer"	 
   #read input
#done

#if [ $input == 'm' ]
#	then ./Menu.sh
#
#	elif  [ $input == 's' ]
#	then ./FindCust.sh
#fi

	;;
	2)
	echo 'Please enter surname'
	read sname
	#grep "$sname" CustomerDetails.txt | awk '{print $1}'
	echo "Customers matching the name $sname :"
	grep -i "$sname" CustomerDetails.txt 
	
	menuredirect
	;;
	3)
	clear
	echo 'Please enter county name:'	
	read county
	#grep "$sname" CustomerDetails.txt | awk '{print $1}'
	echo "Customers from county $county :"
	grep -i "$county" CustomerDetails.txt 
	echo
	menuredirect
	;;
	4)
	echo 'Please enter search criteria'
	read anysearch
	#grep "$fname" CustomerDetails.txt | awk '{print $1}'
	echo "Customers matching $anysearch :"
	grep -i "$anysearch" CustomerDetails.txt 
./Menu.sh
	;;

	
	0)
	echo "Return to main menu (y/n)?"
	read exitresponse
		if [ $exitresponse='y' ]
		then ./Menu.sh
		else ./FindCust.sh
	fi
	;;
	*)
	echo '**Please select a valid option** (1-5 only)'
	echo

./Menu.sh
esac