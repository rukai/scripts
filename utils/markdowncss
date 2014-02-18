#!/bin/sh

{
    echo "<link rel='stylesheet' href='file:///home/rubic/.markdown.css'/>"
    echo "<script type='text/javascript' src='file:///home/rubic/Bin/latexit.js'></script>"
    echo "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>"
    pandoc $1
} > `echo $1 | sed s/.markdown/.html/ | sed s/.md/.html/`
