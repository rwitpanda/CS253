#!/bin/bash

function help()
{
	echo "Usage $0: give 2 filenames as input"
	echo "first file should exist in pwd"
}

if [ $# != 2 ]
then
	help
	exit
fi
file1=$1
file2=$2

if [ ! -f $file1 ] 
then
    echo " $file1: No such file exists"
    help
fi

sed 's/;/@/g' $file1

awk 'BEGIN{FS=";"}{ if( $9~"Japan") print $1;  }' $file1 > $file2

awk 'BEGIN{FS=";"}{ if($6>4000) print( $1 ":" $6); }' $file1 >> $file2

awk -f rr.awk $file1 > $file2
# awk '
# BEGIN{FS=";"}
# {
# 	id=$9;
# 	tot[id]=tot[id]+$2;
# 	num[id]=num[id]+1;
# }
# END{
# 	for (key in tot)
# 	{
# 		if(key~"Origin");
# 		else
# 		{ 
# 			print (key)
# 			echo " : " 
# 			print(tot[key]/num[key]) 
# 		}
# 	} 
# }' $file1 > $file2