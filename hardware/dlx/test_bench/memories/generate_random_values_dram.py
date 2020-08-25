#!/usr/bin/python3
import numpy as np

address_size=16 # for 32 it is too long 

f=open("dram.txt","w")
for i in range(2**address_size):
	print(i)
	f.write(hex(np.random.randint(0,2**32-1,dtype=np.uint32))[2:].zfill(8))
	f.write("\n")
f.close()
exit()
