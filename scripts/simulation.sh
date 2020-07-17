#!/bin/bash
echo "Starting initialization of simulation environment"
setmentor
cd ..
if [ -d "./work" ] ;then 
	rm -rf work
fi
vlib ./work # it also creates the folder
echo "Simulation ready to go!"
echo "Start hierarchical compilation"
vcom name


echo "Starting simulation"
## need a do file and a waveform file
vsim  -f simulation.tcl  -t 10 ps # from a script file 