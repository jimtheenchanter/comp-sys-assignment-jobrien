#!/bin/bash


# This is the driver script for the application.
# The user can select 4 menu options or to exit.
# Interface visual formatting for ease of reading
# and to create headings and clear layout.
# Clear function is used throughout to keep current
# task and user focus at the top of the screen 

function highlight
{
	echo "=========================================="
	echo "$*"
	echo "=========================================="
}

# clear the contents of the temporary files
cp /dev/null tmp/composeEmail.txt
cp /dev/null tmp/emailRecipients.txt 
cp /dev/null tmp/emailSubject.txt
cp /dev/null tmp/CustomerDetails.txt
cp /dev/null tmp/CustomerDelete.txt

# refresh screen
clear
# Date & Time at top of the page.
echo $(date)
echo

# introduced some UI to guide the user and help in navigation

highlight "CUSTOMER DATABASE"
echo
echo "MAIN MENU"
echo	
echo	"1. Add New Customer"
echo	"2. Remove Existing Customer"
echo	"3. Search for a Customer"
echo	"4. Email Customers"
echo    
echo    "0. Exit"
echo ======================================
echo "Please select your option (1-4)"
read input

# reads user input by case statement. If any key other than those in the menu
# is selected the screen is refreshed.

case $input in

	1)
	./AddCust.sh
	;;
	2)
	./RemCust.sh
	;;
	3)
	./FindCust.sh
	;;
	4)
	./EmailCust.sh
	;;
# if the user doesn't want to exit they are directed back to the main menu
	0)
clear
	highlight EXIT PROGRAM
	echo "Are you sure you want to exit (y / n)?"
	read exitresponse
		if [ $exitresponse == 'y' ]
			then 
           		  exit
			else 
			  ./Menu.sh
		fi
	;;
	*)
	
    
./Menu.sh
esac

	

