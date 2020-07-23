#!/usr/bin/bash
echo "Starting initialization of simulation environment"
setmentor
cd ..
if [ -d "./work" ] ;then 
	rm -rf work
fi
echo "Moving the hex files into the memories folders"
cp ./software/*.txt ./test_bench/memories/

vlib ./work # it also creates the folder
echo "Simulation ready to go!"
echo "Start hierarchical compilation"
vcom name


echo "Starting simulation"
## need a do file and a waveform file
vsim  -f simulation.tcl  -t 10 ps # from a script file 

vsim -t 10ns work.dlx_testbench 