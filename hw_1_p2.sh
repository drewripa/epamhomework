#!/bin/sh

echo "Please enter some arithmetic operations like '2+3'and  press 'Enter' button";
read stringline;

#Regexp for 
reg=^[1-9]+[\+-][1-9]+;

#Checking for positive salary
while ! [[ $stringline =~ ${reg} ]]; do
	echo "Please enter valid expression";
	read stringline;
done

#Print result
let result="$stringline"
echo "Your result is $result";

exit 0;
