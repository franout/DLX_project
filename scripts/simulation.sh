#!/usr/bin/bash

## using questasim 
source /software/scripts/init_questa10.7c 

path_to_hex_test_program = $1
if [ -z "$path_to_hex_test_program" ] ; then
	echo "Input software file for IRAM not defined"
	exit(-1)
fi
echo "Starting initialization of simulation environment"
setmentor
cd ..
if [ -d "./work" ] ;then 
	rm -rf work
fi
echo "Moving the hex files into the memories folders"
cp "$path_to_hex_test_program" ./test_bench/memories/

vlib ./work # it also creates the folder
echo "Simulation ready to go!"
echo "Start hierarchical compilation"
vcom name


echo "Starting simulation"
## need a do file and a waveform file
vsim  -f simulation.tcl  -t 10 ps # from a script file 
## add a list of all possible testpanch and print usage in case of help
vsim -t 10ns work.dlx_testbench -do 
