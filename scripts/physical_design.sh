#!/usr/bin/bash
echo "Starting physical design"
cd ..

export path_to_file_synthesis=$PWD"/project/synthesis/"

gui_option=$1
if  [[ "$gui_option" != "no_gui" &&  "$gui_option" != "gui"  ]]  ; then 
	echo "---> wrong parameter! Usage is ./physical_design.sh gui/no_gui <---"
	exit
fi
cd project/
echo "Starting physical design setup"

if [ -d "./physical_design" ] ;then 
	cp -r ./physical_design ./physical_design.old
	echo "Previous physical design run can be found in physical_design.old folder"
	rm -rf ./physical_design
fi
mkdir ./physical_design
cd ./physical_design
cp ../../scripts/physical_design.tcl ./
cp ../../scripts/Default_nopt.view ./
cp ../../scripts/Default_10.view ./
cp ../../scripts/Default_1_minarea.view ./
mkdir report 
mkdir output_netlist
mkdir images_nopt
mkdir images_10
mkdir images_1_minarea

source /software/scripts/init_innovus17.11
# launch innovus 
echo "Startig Innovus executing physical_design.tcl script with $gui_option"
if [ "$gui_option" == "gui" ] ; then 
innovus -files physical_design.tcl 
else 
innovus -files physical_design.tcl -no_gui
fi

exit
