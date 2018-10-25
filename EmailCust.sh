#!/bin/bash
echo ======================================
echo "Email Wizard"
echo ======================================
echo "Please select your option:"
echo "1. Add a recipient"
echo "2. Add all recipients"
echo "3. Add Subject"
echo "4. Compose Email"
echo "5. Return to Main Menu"
echo 
echo "0. Exit"

echo ======================================

read input

case $input in

	1) 
clear
	echo ======================================
	echo "Email Wizard"
	echo ======================================
	grep @ CustomerDetails.txt | awk '{print $1 " " $2 ", " $6}'
	echo
	echo "Please enter email address and press return"
	read emailRecipient 
	e cho "$emailRecipient" >> tmp/emailrecipient.txt
	chmod +x tmp/emailrecipient.txt
clear
	echo "Email to:"
	
	if [ tmp/emailrecipient.txt != null ]
	then
		cat tmp/emailrecipient.txt 
	fi
	./EmailCust.sh
	;;
	 

	2) 
clear 
	grep "$email" CustomerDetails.txt | awk '{print $6}' >> tmp/emailrecipient.txt
#	cat CustomerDetails.txt >> tmp/emailrecipient.txt
	chmod +x tmp/emailrecipient.txt
	echo "Email to: " 
	cat tmp/emailrecipient.txt 
	./EmailCust.sh
	;;

	3) 
clear
	echo "Please enter subject and press return"
	echo 
	read emailSubject 
	echo "$emailSubject" >> tmp/emailSubject.txt
	chmod +x tmp/emailSubject.txt
clear
	./EmailCust.sh 
	echo
	
	
	echo "Email to:"  
	cat tmp/emailrecipient.txt
	echo "Subject: " 
	cat tmp/emailSubject.txt
	
	;;

	4) 
	nano tmp/ComposeEmail.txt 
	#grep $ComposeEmail.txt >> tmp/EmailBody.txt
	if [ 'tmp/emailrecipient.txt' != null ] || [ tmp/emailSubject.txt != null ]
		then
			echo "Recipients:" 
			cat tmp/emailrecipient.txt
			echo "Subject:"
			cat tmp/emailSubject.txt
			echo
			echo "Email Body:"
			cat tmp/ComposeEmail.txt
			echo
		
	else
		./EmailCust.sh
	
	fi


echo "Press s to send or <e> to edit"

read input

	if [ $input == 's' ] 
		then mail 'tmp/emailrecipient.txt' -s 'tmp/emailSubject.txt' < 'tmp/ComposeEmail.txt'
	elif [ $input == 'e' ]
		then  ./EmailCust.sh
	fi
clear
echo "Message sent."
echo
echo "Press <e> for email menu or <m> for main menu"
echo
read menuinput

if [ $menuinput == 'e' ]
		then ./EmailCust.sh
	elif [ $menuinput == 'm' ]
		then ./Menu.sh
	
fi
	;;

	5) ./Menu.sh
	;;
esac

	

