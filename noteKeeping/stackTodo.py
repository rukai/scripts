#!/usr/bin/env python2
#          DO WHAT THE **** YOU WANT TO PUBLIC LICENSE
#                   Version 2, December 2004
# 
# Copyright (C) 2013 ZwodahS(ericnjf@gmail.com) 
# zwodahs.wordpress.com
# 
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
# 
#           DO WHAT THE **** YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# 
#  0. You just DO WHAT THE **** YOU WANT TO.
# 
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details. 
# 
import sys
import os


# This is supposed to be a very simple todo stack application with very little functionality.
# The basic is this. 
# 1. When you call the this script without any argument, it will display what is on the top of the stack.
# 2. The mains functions are
#   2a. push|add <item>    # add the item to the top of the stack
#   2b. pop|done           # remove the top item and consider it done
#   2c. wait|procrastinate # move the top item one down.
#   2d. pushback|dolater   # add item to the bottom of the stack
# THERE IS NO LIST FUNCTIONS. LIST FUNCTIONS IS GOING TO MAKE YOU NOT WANT TO DO ANYTHING BECAUSE OF THE OVERWHELMING AMOUNT OF
# TASK TO BE DONE

# global variable - too lazy to make a obj
filepath = os.path.realpath(__file__)
dirpath = os.path.dirname(filepath)
config_path = os.path.join(dirpath,'.config')

def get_list_of_stack():
    l = []
    for files in os.listdir(dirpath):
        if files.endswith(".stack"):
            l.append(os.path.splitext(files)[0])
    return l

def get_stack_path(stack_name):
    return os.path.join(dirpath,stack_name+".stack")

def save(path, lines):
    fileout = open(path,'w')
    for v in lines:
        fileout.write("%s\n" % v)
    fileout.close()


if __name__ == '__main__':
    # create file if not exist

    # potentially the first time open the program
    if not os.path.isfile(config_path) :
        fileout = open(config_path,'w')
        fileout.write("%s\n" % "default")
        fileout.close()
    # read the config file
    config_file = open(config_path,'r') 
    lines = config_file.readlines()
    lines = map(lambda l : l.replace("\n","") , lines)
    stack_name = lines[0]
    # get the current stack
    current_stack_path = get_stack_path(stack_name)
    # if stack do not exist, create it
    if not os.path.isfile(current_stack_path):
        fileout = open(current_stack_path,'w')
        fileout.close()
    
    # read the current stack
    filein = open(current_stack_path, 'r')
    lines = filein.readlines()
    # remove \n
    lines = map(lambda l : l.replace("\n","") , lines)
    ### Printing the top of the stack
    if len(sys.argv) == 1:
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        # print the top stack
        if len(lines) == 0:
            print >> sys.stdout , "You Stack is empty... ?"
        else:
            print >> sys.stdout , "Current Item : " + lines[0]
    ### quiet version of printing the stack
    elif sys.argv[1] == "quiet":
        if len(lines) > 0:
            print >> sys.stdout , lines[0]
    ### Adding item to the top of the stack
    elif sys.argv[1] == "add" or sys.argv[1] == "push" or sys.argv[1] == "do":
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        # add item
        if(len(sys.argv) == 2):
            print >> sys.stdout , "Don't be stupid"
        else:
            lines.insert(0,' '.join(sys.argv[2:]))
        save(current_stack_path, lines)
    ### Adding item to the second position from the top of the stack
    elif sys.argv[1] == "doafter" :
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        if(len(sys.argv) == 2):
            print >> sys.stdout , "Don't be stupid"
        else:
            if(len(lines) == 0):
                lines.insert(0,' '.join(sys.argv[2:]))
            else:
                lines.insert(1,' '.join(sys.argv[2:]))
        save(current_stack_path, lines)
    ### add item to the end (so that it will come back later and haunt you)
    elif sys.argv[1] == "pushback" or sys.argv[1] == "dolater" :
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        if(len(sys.argv) == 2):
            print >> sys.stdout , "Don't be stupid"
        else:
            lines.append(' '.join(sys.argv[2:]))
        save(current_stack_path, lines)
    ### remove the item from the top of the stack
    elif sys.argv[1] == "done" or sys.argv[1] == "pop":
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        if len(lines) != 0:
            print >> sys.stdout ,  "\"" + lines[0] + "\"" + " Completed"
            lines.pop(0)
        if len(lines) == 0 :
            print >> sys.stdout , "You Stack is empty... Congratulation ?"
        else:
            print >> sys.stdout , "Next on stack :" + lines[0]
        save(current_stack_path, lines)
    ### move the top item down one step
    elif sys.argv[1] == "wait" or sys.argv[1] == "procrastinate" :
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        x = lines[0]
        lines[0] = lines[1]
        lines[1] = x
        print >> sys.stdout , "Next on stack :" + lines[0]
        save(current_stack_path, lines)
    ### list all the stack
    elif sys.argv[1] == "stack":
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        print >> sys.stdout , "List of stacks you have :"
        i = 0
        for files in get_list_of_stack():
            i = i+1
            print >> sys.stdout , str(i)+". "+files
    elif sys.argv[1] == "switch":
        print >> sys.stdout , "You are currently in \"%s\" stack" % stack_name
        if len(sys.argv) == 2:
            print >> sys.stdout , "Invalid stack"
        else:
            stack_name = sys.argv[2]
            print >> sys.stdout , "Switching to stack %s" % stack_name
    # clear the stack and remove the .stack file
    # only works if you have no item in the list
    elif sys.argv[1] == "clear": 
        if len(lines) == 0 or (len(sys.argv) > 2 and sys.argv[2] == "force") :
            # Delete the file
            os.remove(current_stack_path)
            l = get_list_of_stack()
            # switch the current stack
            if len(l) == 0:
                stack_name = "default"
            else:
                stack_name = l[0]
            current_stack_path = os.path.join(dirpath,stack_name+".stack")
        else:
            print >> sys.stdout , "The Stack is not empty. Are you trying to do stupid things ?"
    else:
        print >> sys.stdout , "add|push|do <item> : do this item"
        print >> sys.stdout , "doafter <item> : do this item after the current item"
        print >> sys.stdout , "dolater|pushback <item> : do this item after the current stack finishes"
        print >> sys.stdout , "done|pop : Good job. You did the item at the top .. or did you ?"
        print >> sys.stdout , "wait|procrastinate : Move current item one spot down. Don't procrastinate too much"
        print >> sys.stdout , "stack : list the stacks that you have"
        print >> sys.stdout , "switch : switch to another stack"

    # save the config
    fileout = open(config_path, 'w')
    fileout.write("%s\n" % stack_name)
