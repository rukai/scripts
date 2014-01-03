#!/usr/bin/env python3
#Generates a password of specified length up to 171 characters

import os
import base64
import sys

if len(sys.argv) > 1:
    charLimit = int(sys.argv[1])
else:
    charLimit = 10

if charLimit > 0:
    #get 128 bytes worth of random password data
    password = base64.b64encode(os.urandom(128)).decode(encoding='UTF-8')
    #print password up to charLimit characters
    print(password[0:charLimit])
else:
    print('Really now?')
