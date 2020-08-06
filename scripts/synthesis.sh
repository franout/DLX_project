#!/usr/bin/bash
echo "Starting synthesis setup"
cd ../project/

if [ -d "./synthesis" ] ;then 
	cp -r ./synthesis ./synthesis.old
	echo "Previous synthesis run can be found in synthesis.old folder"
	rm -rf ./synthesis
fi
mkdir synthesis
cd synthesis 
cp ../../scripts/.synopsys_dc.setup .
setsynopsys
mkdir work 
echo "Startig Design Vision executing synthesis.tcl script"
design_vision -f synthesis.tcl