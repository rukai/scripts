#!/bin/bash
#Syntax: dotwrap file [engine]
#standard dot engine used when not specified

outputFile=$(echo "$1" | sed "s/\.dot/.png/")

if [[ -z $2 ]]
then
    type=dot
else
    type="$2"
fi

~/Scripts/utils/dotwrap.rb $1 | $type -Tpng > $outputFile
