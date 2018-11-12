#!/bin/bash




clear
echo  $(date)
echo =======================================
echo "Email Wizard"
echo =======================================
echo
echo "Email to: " 
cat tmp/emailRecipients.txt
echo
echo "Subject: "
cat tmp/emailSubject.txt
echo
echo "Email body: "
cat tmp/composeEmail.txt
echo
echo ..................................
echo 
echo "1. Add a recipient"
echo "2. Add all recipients"
echo "3. Add Subject"
echo "4. Compose Email"
echo "5. --> Send"
echo "6. Main Menu"
echo
echo "Please select menu number:"
read input

case $input in
	1) 
clear
	grep @ CustomerDetails.txt | awk '{print $1 " " $2 "\t " $6}'
	echo
	echo "Please enter email address and press return"
	read emailRecipients 
	
# validate email contains valid characters
	case $emailRecipients in
		*@?*.?*) 
		;;
		*)

		echo $emailRecipients  is not a valid email address
		echo
		echo "Please enter email address"
		read emailRecipients

	esac

	echo "$emailRecipients" >> tmp/emailRecipients.txt
	chmod +x tmp/emailRecipients.txt
		
	./EmailCust.sh
	;;
	 

	2) 
clear 
# removes existing recipients to avoid dupilicate sending.
	cp /dev/null tmp/emailRecipients.txt 
# takes the email field from all customers and sends them to temporary emailRecipients
	grep "$email" CustomerDetails.txt | awk '{print $6}' >> tmp/emailRecipients.txt

# grant read n'write access to file
	chmod +x tmp/emailRecipients.txt
	./EmailCust.sh
	;;

	3) 
# takes in a single line subject
clear
	echo "Please enter subject and press return"
	echo 
	read emailSubject 
	echo "$emailSubject" >> tmp/emailSubject.txt
	chmod +x tmp/emailSubject.txt
clear
	./EmailCust.sh 
	echo
	
	
		echo "Subject: " 
	cat tmp/emailSubject.txt
	
	;;
	4) 
# creat a temporary email body file
	nano tmp/composeEmail.txt 
# returns user to email menu
		./EmailCust.sh 
	;;
	
	5) 	
#	#clear
#		echo "Recipients:" 
#		cat tmp/emailRecipients.txt
#		echo
#		echo "Subject:"
#		cat tmp/emailSubject.txt
#		echo
#		echo "Email Body:"
#		cat tmp/composeEmail.txt
#		echo
#	echo "Press <s> to send or <e> to edit"
#	
#	read input
#
	#error possibly
#	if [ $input == 's' ] 
#		then 
		#send mail to recipients
			mail 'tmp/emailRecipients.txt' -s 'tmp/emailSubject.txt' < 'tmp/ComposeEmail.txt' 
		# write details to email log	
			echo "//////////////////////////" >> tmp/emailLog.txt
			echo "Date:" "$(date)"  >> tmp/emailLog.txt
			cat tmp/emailRecipients.txt >> tmp/emailLog.txt
			cat tmp/emailSubject.txt >> tmp/emailLog.txt
			cat tmp/ComposeEmail.txt >> tmp/emailLog.txt
#	elif [ $input == 'e' ]
#		then  
#		./EmailCust.sh
#	fi
#	
        clear
		echo  $(date)
		echo =======================================
		echo "Email Wizard"
		echo =======================================
		echo
        echo "Message sent to:"
		echo
        cat tmp/emailRecipients.txt
	echo
        echo "[s]end another Email or "
	    echo "[m]ain Menu"
        echo
        read menuinput

# clear tmp email files to prepare to send another email
	if [ $menuinput == "s" ]
		then 
		cp /dev/null tmp/composeEmail.txt
		cp /dev/null tmp/emailRecipients.txt 
		cp /dev/null tmp/emailSubject.txt	
		./EmailCust.sh
	elif [ $menuinput == "m" ]
	then
		#cp /dev/null tmp/composeEmail.txt
		#cp /dev/null tmp/emailRecipients.txt 
	   # cp /dev/null tmp/emailSubject.txt
		 ./Menu.sh
	
        fi
    ;;    

	6) 
# return to main menu
	./Menu.sh
	;;

	*)
# if any other key is pressed the email menu screen is refreshed
	./EmailCust.sh	
	;;
	
esac
