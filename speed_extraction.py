# -*- coding: utf-8 -*-
"""
Created on Fri Aug 19 20:18:06 2022

@author: ruben
"""

speed=[]
time=[]
with open('TIDA_RIDE.txt') as f:
    for line in f:
        Line = line.strip()
        #print(Line)
        if Line[13]=='V':
            #print(Line)
            time.append(Line[0:8])
            speed.append(Line[28:35])
            print(line)
   
     