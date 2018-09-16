#!/bin/sh

rename_with_extension()
{
    extension="${1##*.}"
    mv $1 $2.$extension
}

for filename in $@
do
    new_name=`extract-date.sh "$filename"`

    if [ "$new_name" = "" ]; then
        continue
    fi

    count=`ls | grep -c "$new_name"`

    if [ "$count" -eq "1" ]
    then
        rename_with_extension `ls | grep $new_name` "$new_name"_1
    fi
    
    if [ "$count" -gt "0" ]
    then
        new_name="$new_name"_`expr "$count" + 1`
    fi


    rename_with_extension $filename $new_name
        
done




