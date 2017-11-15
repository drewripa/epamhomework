#!/bin/sh

echo "Please enter your salary ad press 'Enter' button";
read salary;

#Regexp for numbers
reg=^[1-9]+;

#Checking for positive salary
while ! [[ "${salary}" =~ ${reg} ]]; do
	echo "Please enter valid salary";
	read salary;
done

#Vadiable for taxes
tax=;

if [ $salary -lt 5000 ]; then
	tax="0%"
elif [ $salary -gt 30000 ]; then
	tax="20%"
else
	tax="10%"
fi

#Print tax depends on salary
echo "Your current tax is $tax";

exit 0;
