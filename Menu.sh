#!/bin/bash

rm -r -f tmp/emailrecipient.txt tmp/emailSubject.txt tmp/ComposeEmail.txt
clear
echo $(date)
echo

echo "CUSTOMER DATABASE"
echo "======================================"
echo "Please choose one of the following:"
echo	"1.	Add New Customer"
echo	"2.	Remove Existing Customer"
echo	"3.	Search for a Customer"
echo	"4. 	Email a Customer"
echo    "5.	View all Customers"
echo    
echo    "0.     Exit"
echo ======================================
echo "Please select your option (1-5)"
read input

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
	5)
	./ViewCust.sh
	;;
	0)
	echo "Are you sure you want to exit y n?"
	read exitresponse
		if [ $exitresponse = 'y' ]
		then exit
		else ./Menu.sh
	fi
	;;
	*)
	echo '**Please select a valid option** (1-5 only)'
	echo

./Menu.sh
esac

	

