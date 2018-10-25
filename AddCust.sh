#!/bin/bash



echo "ADD NEW CUSTOMER"
echo =======================

echo Please enter first name

read fName

echo Please enter surname

read sName

echo Please enter county

read address

echo Please enter eircode

read eircode

echo Please enter mobile number

read mobile

echo Please enter email address

read email


echo $fName $sName $address $eircode $mobile $email >> CustomerDetails.txt
echo
sort -o CustomerDetails.txt CustomerDetails.txt
cat CustomerDetails.txt


echo
echo Thank you.
echo $fName $sName has been added to Customer Directory.
echo Press any key to continue
read anykey

./Menu.sh