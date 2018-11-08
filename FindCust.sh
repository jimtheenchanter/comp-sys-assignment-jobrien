#!/bin/bash

# This file allows the user to search database by customer name
# (first / second or first + second, or county address)
# clear the console to ensure user focus is at top of page
# along with blank echo declarations to improve consistency of layout
# and imporve legibility and navigation

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
# header

highlight "SEARCH CUSTOMERS"

# submenu
echo
#echo	"(s) Search by any criteria"
#echo   "(m) Main Menu"
#echo .................................
#echo "Please choose (s) / (m):"
#read input

# refresh header
clear
highlight Search Customer

#case $input in
#	s)
	echo 'Please enter search criteria'
	while read anysearch;
	  do
     		if [[ -z "${anysearch}" ]];
		then
          		echo "Details cannot be empty. "
     		else
         		break
     		fi
	  done
# refresh header
clear
highlight Search Customer

	echo "Customers matching $anysearch :"
# returns the number of matching entries
	grep -c -i "$anysearch" CustomerDetails.txt
# returns the details of the matching entries 
	grep  -i "$anysearch" CustomerDetails.txt 
#	;;
	
#	m)
echo "Please press enter to continue"
read input
# refresh header
#clear
#highlight Search Customer

#	echo "Return to main menu (y/n)?"
#	read exitresponse
#		if [ $exitresponse='y' ]
#		then ./Menu.sh
#		else ./FindCust.sh
#	fi
#	;;
#	*)
#	clear
#	highlight Search Customer
#	echo '**Please select a valid option**'
#	echo
#
#esac

echo "(s)earch again"
echo "(m)ain menu "
echo "[e]mail found contacts"

read redirect
clear
highlight Search Customer
	while [[ $redirect != 's' ]] && [[ $redirect != 'm' ]] && [[ $redirect != 'e' ]] 
	do
   		echo "Please choose 's' or 'm' "
   	read redirect
done

	if 
	  [ $redirect == 's' ]
	then 
	  ./FindCust.sh
	elif 
   	  [ $redirect == 'm' ]
	then 
	  ./Menu.sh
	elif 
   	  [ $redirect == 'e' ]
	then 
	  awk $anysearch >> tmp/emailRecipients
	  ./EmailCust.sh
	else 
	./FindCust.sh
fi
