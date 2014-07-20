#!/usr/bin/env python3
import subprocess
import sys

"""A command line tool to hide HSC multiple choice answers until needed
To jump to a specific question enter that number into the prompt.
Otherwise hit enter to progress to the next question.
"""

def multipleChoicer():
    #store pdf data
    if len(sys.argv) < 2:
        print("Requires one argument in the form of an absolute path to the exam answers.")
        return
    elif len(sys.argv) == 2:
        interactive = True
    elif sys.argv[2] == "all":
        interactive = False
    else:
        interactive = True
    marksFile = sys.argv[1]
    pdf = subprocess.check_output(["/usr/bin/env", "pdftotext", marksFile, "-"]).decode().splitlines()

    #determine list of answers
    if "Answer" not in pdf:
        print("The passed file is not a valid/official set of answers to an HSC exam.")
        return
    offset = pdf.index("Answer")+1
    questionCount=int(pdf[offset-3])
    answers = pdf[offset:offset+questionCount]
    
    i = 0 #question number
    #Display prompt once, then display question info and another prompt until past Q20
    while i <= 20:
        if i != 0:
            print("{}) {}".format(i, answers[i-1]))
        if interactive:
            inputStr = input("> ") #jump to the entered question
        else:
            inputStr = ""
        i += 1
        if inputStr.isdigit():
            i = int(inputStr)
            if i > questionCount:
                break

multipleChoicer()
