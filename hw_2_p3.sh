#/!bin/bash

DEFPATH=`pwd`
NOT_TEXT=-1

if [ $# -lt 1 ]; then
        MYPATH="$DEFPATH"
else
        MYPATH="$1"
fi

echo "******PATH is $MYPATH"

linescounter()
{	echo -n "Have "
        echo -n `wc -l <$1`
	echo -n " lines"
}

iftext()
{ 

	if [[ -n `file -i "$1" | grep "text/"` ]];
        then
         echo -n `linescounter "$1"`;
		#echo "text"
	#else
	#	echo "binary";
        fi
}

checktype()
{
	
        shortname=${1##*/}
		
	tabs=`echo -e $1 | tr -cd '/' | sed -e 's/\//\\t/g'` 
		
        if [ -d $1 ]; then
                echo -e -n "$tabs Directory:\t$shortname\n"
	elif [ -f $1 ]; then
		echo -e -n "$tabs File:\t$shortname\t"
		echo -n `iftext $1`
		echo -n -e "\n"
        fi

}


for whatisit in `find "$MYPATH" -not -path '*/.*'`
do
	checktype $whatisit
done
