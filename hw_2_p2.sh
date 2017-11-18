#/!bin/bash

filepath="/etc/resolv.conf"

counter=0

checkifnotsymbol()
{
	case $1 in
		[a-zA-Z0-9]* ) ((counter++));;
		*);;
	esac
}

DONE=false
	until $DONE ;do
	read || DONE=true
	[[ ! $REPLY ]] && continue
	checkifnotsymbol "$REPLY"
done < "$filepath"

echo "DNS servers count is \"$counter\"" 
