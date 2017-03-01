#!/usr/bin/python

import csv
import string

with open('APs.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    print "Hostname,ip,power5g,freq5g,power2g,freq2g,mac,building"
    for row in reader:
        oldmac = row['mac']
        int(row['mac'].translate(None, ":.- "), 16)
        octarray = oldmac.split(":")
        newfirst = int(octarray[0].translate(None), 16) + 2
        print row['Hostname'] + "," + row['ip'] + "," + row['power5g'] + "," + row['freq5g'] + "," + row['power2g'] + "," + row['freq2g'] + ",",
        print "{0:x}".format(int(newfirst)) + ":" + octarray[1] + ":" + octarray[2] + ":" + octarray[3] + ":" + octarray[4] + ":" + octarray[5] + ",",
        print row['building']
