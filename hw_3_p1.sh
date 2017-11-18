#!/bin/sh

counter=1

if [ $# -eq 1 ]; then
	boilingpoint=$1
else
	boilingpoint=10
fi


mpoint=
sizepors=
tcounter=0

checksize()
{
	let free=99-$1

	if [ $free -le $boilingpoint ]; then

		echo "FREE DISK SPACE IS LOW FOR $2"
		let tcounter+=1

	fi
}

finalfree()
{
	if [ "$1" -eq 0 ]; then
	echo "WE HAVE A LOT OF FREE SPACE"
	fi
}


df | 
while read -r i
do
	if [ $counter -gt 1 ]; then
		mpoint=`echo $i | awk '{print $6}'`
		sizepers=`echo $i | awk '{print $5}' | sed -e 's/\%//g'`
		checksize "$sizepers" "$mpoint"

	fi
	((counter++))
	echo $tcounter > tmp
	
done

read -r line < tmp
finalfree $line
rm -f tmp
