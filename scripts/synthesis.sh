#!/usr/bin/bash
echo "Starting synthesis setup"
cd ..
export path_to_file=$PWD"/hardware/dlx/"
cd project/


if [ -d "./synthesis" ] ;then 
	cp -r ./synthesis ./synthesis.old
	echo "Previous synthesis run can be found in synthesis.old folder"
	rm -rf ./synthesis
fi
mkdir synthesis
cd synthesis 
mkdir report
mkdir output_netlist
cp ../../scripts/.synopsys_dc.setup ./
cp ../../scripts/synthesis.tcl ./
source /software/scripts/init_synopsys_64.18
mkdir work 
echo "Startig Design Vision executing synthesis.tcl script"
design_vision -f synthesis.tcl -no_gui

