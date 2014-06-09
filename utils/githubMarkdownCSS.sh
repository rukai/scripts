#!/bin/sh

{
    echo "<link rel='stylesheet' href='file:///home/rubic/.githubMarkdown.css'/>"
    echo "<script type='text/javascript' src='file:///home/rubic/Scripts/utils/LaTeXMathML.js'></script>"
    echo "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>"
    pandoc --latexmathml $1
} > `echo $1 | sed s/.markdown/.html/ | sed s/.md/.html/`
