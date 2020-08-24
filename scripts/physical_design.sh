#!/usr/bin/bash
echo "Starting physical design"
cd ..

export path_to_file_synthesis="./ha/"

cd project/
echo "Starting physical design setup"

if [ -d "./physical_design" ] ;then 
	cp -r ./physical_design ./physical_design.old
	echo "Previous physical design run can be found in physical_design.old folder"
	rm -rf ./physical_design
fi
mkdir ./physical_design
cd ./physical_design
mkdir report 
mkdir output_netlist

source /software/scripts/init_innovus17.11
# launch innovus 
echo "Startig Innovus executing physical_design.tcl script"
innovus -files physical_design.tcl -no_gui
