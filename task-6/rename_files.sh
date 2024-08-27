#!/usr/bin/bash

dir_path=$1

function rename
{
    content=$(find $dir_path -name "*.txt")

    files_count=0

    for file in $content
    do
        file_name=$(basename $file)
        mv "$dir_path/$file_name" "$dir_path/old_$file_name"
        ((files_count++))
    done
    if [[ $files_count -eq 0 ]]
        then
            echo "Error -> Directory Is Empty .."
    else
        echo "$files_count Files Have Been Renamed Successfully"
    fi
}

if [[ -e $dir_path ]]
    then
        if [[ -d $dir_path ]]
            then
                rename
        else
            echo "Error -> Your Path is Not a Directory .."
        fi
else
        echo "Error -> Directory Not Found .."
fi
