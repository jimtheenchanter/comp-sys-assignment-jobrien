#!/bin/bash

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
{	echo
	echo "What would you like to do?"
	echo
	echo "[r]emove another customer"
	echo "[m]ain menu"
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

highlight REMOVE CUSTOMER
# submenu to allow the user to proceed with removing a member or 
# return to the main menu


# header refresh	
	clear
	highlight REMOVE CUSTOMER

# display list of customers names and emails	

	cat CustomerDetails.txt | awk '{print $1 " " $2 ", " $3}'
	echo
	echo "Who do you want to delete? (e.g. 'John Smith' or 'Wexford')"
# validate that search criteria has been entered.
	while read custName;
	  do
		
     		if [[ -z "${custName}" ]] ;
		then
			echo "Cannot be blank. "
     		else
		 break
     		fi
	  done

# copy all names that don't match criteria to temp file
  grep -v -i "$custName" CustomerDetails.txt >  tmp/CustomerDetails.txt
# copy all names that do match criteria to temp delete file
  grep  -i "$custName" CustomerDetails.txt >  tmp/CustomerDelete.txt

clear
highlight Remove Customer

# confirm deletion by displaying contact(s) to be deleted
echo CONFIRM DELETION:
cat tmp/CustomerDelete.txt
echo
echo "Are you sure (y/n)?"
read areYouSure

	if [ $areYouSure == 'y' ]
	then mv tmp/CustomerDetails.txt CustomerDetails.txt
# refresh header		
		clear
		highlight REMOVE CUSTOMER
		echo "Customer List"
		cat CustomerDetails.txt
		echo
		echo "Contacts list has been updated."
		echo
# redirect user to remove another customer or return to main menu
		menuredirect
	elif [ $areYouSure == 'n' ]
	then ./RemCust.sh
	else
	  break
fi
