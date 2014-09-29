#!/bin/bash
#Syntax: dotwrap file [engine]
#standard dot engine used when not specified

#Need to be careful
set -e;set -u

outputFile=$(echo "$1" | sed "s/\.dot/.png/")

if [[ -z $2 ]]
then
    type=dot
else
    type="$2"
fi

./dotWrap.rb $1 | $type -Tpng > $outputFile
