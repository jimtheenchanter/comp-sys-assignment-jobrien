#!/bin/bash

#interface visual formatting for ease of reading
function highlight
{
	echo "=========================================="
	echo "$*"
	echo "=========================================="
}

clear 
highlight "ADD NEW CUSTOMER"

echo "Please enter first name then press enter"

# validate firstname is not blank
# uses double quotes to encapsulate double-barrelled first names
while read fName; 
do
     if [[ -z "${fName}" ]]; 
	then
          echo "First Name cannot be empty. "
     else
         break
     fi
done

# refresh header
clear 
highlight "ADD NEW CUSTOMER"

echo "First Name:  $fName"
echo "...................................."
echo "Please enter surname then press enter"

# validate surname is not blank
# uses double quotes to encapsulate double-barrelled surnames eg (O Brien)

while read sName; 
do
     if [[ -z "${sName}" ]]; 
	then
          echo "Surname cannot be empty. "
     else        
          break
     fi
done

# refresh header
clear 
highlight "ADD NEW CUSTOMER"

# display data so far
echo "First Name: $fName"
echo "Surname: $sName"
echo "...................................."
echo "Please enter customer county then press enter"

# validate surname is not blank
while read address; 
do
     if [[ -z "${address}" ]]; 
	then
          echo "County cannot be empty. "
	  echo "Please enter customer county then press enter"
     else          
          break
     fi
done

# refresh header
clear 
highlight "ADD NEW CUSTOMER"
# display data so far
echo "First Name: $fName"
echo "Surname: $sName"
echo "County: $address"
echo "...................................."

echo Please enter eircode

# validate eircode is not blank
while read eircode; 
do
     if [[ -z "${eircode}" ]]; 
	then
          echo "Eircode cannot be empty. "
     else          
          break
     fi
done

# refresh header
clear 
highlight "ADD NEW CUSTOMER"

# display data so far
echo "First Name: $fName"
echo "Surname: $sName"
echo "County: $address"
echo "Eircode: $eircode"
echo "...................................."

echo "Please enter mobile number (no spaces, 10 digits)"

# validate mobile No is exactly 10 digits long
while read mobile

do
	if [[ ${#mobile} != 10 ]] ;
	 then
	  echo "Mobile number must be 10 digits long"
         else

	  break
	fi
done	

# refresh header
clear 
highlight "ADD NEW CUSTOMER"

#display data so far
echo "First Name: $fName"
echo "Surname: $sName"
echo "County: $address"
echo "Eircode: $eircode"
echo "Mobile: $mobile"
echo "...................................."

echo "Please enter email address"

read email
case $email in
	*@?*.?*) 
	;;
	*)
	echo $email is not a valid email address
	echo
	echo "Please enter email address"
	read email

esac

# refresh header
clear 
highlight "ADD NEW CUSTOMER"

#display data so far
echo "First Name: $fName"
echo "Surname: $sName"
echo "County: $address"
echo "Eircode: $eircode"
echo "Mobile: $mobile"
echo "Email: $email"
echo "...................................."

# details held in inverted commas to allow for 
# double-barrel names eg John Paul O Brien
# write the input data to CustomerDetails file

echo "Press 'Enter' to add $fName to Customer Directory"
read input

echo "$fName" "$sName" "$address" "$eircode" "$mobile" "$email" >> CustomerDetails.txt

# sort list alphabeticially
sort -o  CustomerDetails.txt CustomerDetails.txt

clear 
highlight "ADD NEW CUSTOMER"

# display updated list
cat CustomerDetails.txt
echo ..........................................
echo $fName $sName has been added to Customer Directory.
# allow user to view list before continuing
echo Press enter to return to main menu
read anykey

./Menu.sh