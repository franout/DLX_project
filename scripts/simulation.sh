#!/usr/bin/bash

path_to_file="./hardware/dlx/"
## using questasim 
source /software/scripts/init_questa10.7c 

if [ -z $1 ]; then
	echo "usage ./simulation.sh sbst.asm"
	exit(-1)
fi


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
vcom -2008 -check_synthesis ${path_to_file}000-globals.vhd
vcom -2008 -check_synthesis ${path_to_file}001-global_components.vhd 
# vlog for verilog -incr(mental) compilation
# vcom for vhdl-2008 and drc for synthesis (basic)

echo "Compiling labs units"
vcom -2008 -check_synthesis -autoorder ${path_to_file}global_components.package/*.vhd
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/adder.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/alu.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/alu_type.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/boothmul.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/complement2.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/constants.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/csb.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/encoder.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/fa.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/fd.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/gsb.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/mux.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/p4_adder.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/pgsb.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/rca.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/reg_nbit.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/registerfile.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/stcg.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/sum_gen.vhd 
#vcom -2008 -check_synthesis ${path_to_file}global_components.package/pg.vhd


echo "Compilig memories"
vlog -incr ${path_to_file}test_bench/003-global_defs.svh 
vlog -incr ${path_to_file}test_bench/004-implemented_instructions.svh 
vlog -incr ${path_to_file}test_bench/006-property_def.svh 
vlog -incr ${path_to_file}test_bench/memories/tb_memories.sv 
vlog -incr ${path_to_file}test_bench/memories/005-memory_interfaces.svh 
vlog -incr ${path_to_file}test_bench/memories/romem.sv 
vlog -incr ${path_to_file}test_bench/memories/rwmem.sv 

echo "Compiling stages,control unit and datapath"
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.e-Write_back.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.a-Fetch.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.b-Decode.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.d.Memory.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.b-Decode.stage/a.b.b.a-sign_extension.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.a-check_branch_logic.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.b-general_alu.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.a-mux.vhd
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.b-adder.vhd
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.c-complement2.vhd
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.d-encoder.vhd
vcom -2008 -check_synthesis ${path_to_file}a.a-control_unit.vhd 
vcom -2008 -check_synthesis ${path_to_file}a-DLX.vhd 


echo "Starting simulation of dlx top level entity"
## need a do file and a waveform file
vsim  -suppress 12110 -novopt work.tb_dlx -do ./../scripts/dlx_tb.do  
