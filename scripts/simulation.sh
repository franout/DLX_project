#!/bin/bash
echo "Starting initialization of simulation environment"
setmentor
cd ..
if [ -d "./work" ] ;then 
	rm -rf work
fi
vlib work # it also creates the folder
echo "Simulation ready to go!"