#!/bin/bash

#Need to be careful
set -e;set -u

for last; do true; done
source=`echo $last`
output=`echo $source | sed s/.markdown/.html/ | sed s/.md/.html/`
echo "Generating report from $source to $output"

css=/home/rubic/.markdown.css

# When given two arguments the first decides how to format the document
if [ "$#" == "2" ]
then
    if [ "$1" == "github" ]
    then
        css=/home/rubic/.githubMarkdown.css
    fi
    if [ "$1" == "report" ]
    then
        cp /home/rubic/.githubMarkdown.css githubMarkdown.css
        css=githubMarkdown.css
        extra="--toc -s"
    fi
fi
    
pandoc $extra -c $css -H /home/rubic/Scripts/utils/head.html --latexmathml -o $output $source
