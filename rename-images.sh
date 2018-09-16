#!/bin/sh

for filename in $@
do
    extension="${filename##*.}"
    new_name=`./extract-date.sh "$filename"`
    count=`ls | grep -c "$new_name"`
    if [ "$count" -gt "0" ]
    then
        new_name="$new_name"_"$count"
    fi
        
    mv $filename $new_name.$extension
done
