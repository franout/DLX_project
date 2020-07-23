#!/usr/bin/bash
echo "Starting synthesis setup"
cd ..

if [ -d "./synthesis" ] ;then 
	cp -r ./synthesis ./synthesis.old
	rm -rf ./synthesis
fi
mkdir synthesis
cd synthesis 
cp ../setup/.synopsys_dc.setup .
setsynopsys
mkdir work 
echo "Startig Design Vision"
design_vision  #from a script file 