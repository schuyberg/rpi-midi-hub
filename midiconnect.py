#!/usr/bin/python

import re, os
from subprocess import Popen, PIPE

def os_system(command):
    process = Popen(command, stdout=PIPE, shell=True, encoding='utf8')
    while True:
        line = process.stdout.readline()
        if not line:
            break
        yield line

aconnect="aconnect -i -l"

ports = []

for line in os_system(aconnect):
    client=re.search("client (\d*)\:", line)
    through=re.search("Through", line)
    if client and not re.search("Through", line):
        if client.group(1) != '0':
                ports.append(client.group(1))

for p1 in ports:
    for p2 in ports:
        if p1 != p2:
            os.system("aconnect " + p1 + ":0 " + p2 + ":0")
