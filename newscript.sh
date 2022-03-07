#!/usr/bin/env bash
if [ $# -eq 0 ];
then 
    STARTSIZE=10000 
    ENDSIZE=100000
elif [ $# -eq 1 ];
then
    STARTSIZE="$1"
    ENDSIZE=10000
elif [ $# -eq 2 ];
then
    STARTSIZE="$1"
    ENDSIZE="$2"
else
    echo "ERROR: Too Many Arguments, expected 0-2"
    echo "USAGE: testloop.sh [STARTSIZE] [ENDSIZE]"
    exit 1
fi

rm subpage.txt
rm overpage.txt

for((i = STARTSIZE ; i <= ENDSIZE ; i += 10000)); 
    do 
        echo $i
        (time ./massmalloc $i 4094 >> subpage.txt) 2>> subpage.txt
        echo "================================" >> subpage.txt
        (time ./massmalloc $i 4097 >> overpage.txt) 2>> overpage.txt
        echo "================================" >> overpage.txt
done