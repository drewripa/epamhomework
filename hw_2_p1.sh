#/!bin/bash

counter=1
echo "For loop"
#part 1 'for' loop
for a
do
        echo -e "\tArgument \"$counter\" is \"$a\""
        ((counter++))
done

#save input
save=$@
#echo $save
#part 2 'while' loop
counter=1
echo "While loop"
while [ -n "$1" ]
do
        echo -e "\tArgument \"$counter\" is \"$1\""
        ((counter++))
        shift
done

#load
set -- $save

#part 3 'until' loop
counter=1
echo "Until loop"
until [ -z "$1" ]
do
	echo -e "\tArgument \"$counter\" is \"$1\""
	((counter++))
	shift
done

