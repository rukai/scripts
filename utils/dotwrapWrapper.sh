#!/bin/sh

outputFile=$(echo "$1" | sed "s/\.dot/.png/")

~/Scripts/utils/dotwrap.rb $1 | dot -Tpng > $outputFile
