# -*- coding: utf-8 -*-
"""
Created on Mon Mar 22 10:07:42 2021

@author: cpegueroles
"""
#usage: python /home/cpegueroles/CEABnas/python/3.5/eggNOG_gene2go.py emapper.annotations gene2go.txt


import sys,re

def gene2go(myfile): #Return: A list with the longest protein for each gene ID
    myDict={}
    for line in open(myfile, "r"):
        if not line.startswith('#'):   
            m = re.search('GO', line)
            if m:
                line=line.rstrip().split('\t')         
                geneID= line[0]  
                val=[]
                if not geneID in myDict:
                    myDict[geneID]=val
                if not line[9].startswith('-'):
                    myDict[geneID].append(line[9].split(","))
    return myDict


in1 = sys.argv[1]
out = open(sys.argv[2], "w")


for k, v in gene2go(in1).items():
    #print(k)
    if v: 
        for go in v[0]:
            if go:
                out.write("%s\t%s\n" % (k,go))
#        if not go:
#            print(k,'NA')
#        else:
#            print(k,go)
