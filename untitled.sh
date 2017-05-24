#!/bin/sh 
dirname=/home/karl/Documents/Test
tempfile=myTempfileName
dupFile=dupFile
counter=0
find $dirname -type f  > $tempfile
cat $tempfile | sed 's_.*/__' | sort |  uniq -d| 
while read fileName
do
if [ $counter = 0 ]; then
   grep "$fileName" $tempfile > dupFile
else
   grep "$fileName" $tempfile >> dupFile
fi
echo $counter
counter=$((counter+1))
done
#rm -f tempfile