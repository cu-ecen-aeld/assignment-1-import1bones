#!/usr/sh
#Author:Yan Chao
#brief: 

if [ $# -ne 2 ]; then
	echo "input parameter should have 2"
	exit 1
fi

filedir=$1
searchstr=$2

filenum=0
strnum=0

if [ -d "$filedir" ]; then
	for idx in $(ls "$filedir")
	do
		current_file_str_num=0
		currentfile="${filedir}"/"${idx}"
		if [ -f "$currentfile" ]; then
			current_file_str_num=$(cat $currentfile | grep "$searchstr" | wc -l) 
		fi
		strnum=`expr $strnum + $current_file_str_num`
		done
	echo "The number of files are ${filenum} and the number of matching lines are ${strnum}"
else
	echo "$filedir is not a dir"
	exit 1
fi
