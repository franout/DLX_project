#!/usr/bin/bash

path_to_file="./hardware/dlx/"
## using questasim 
source /software/scripts/init_questa10.7c 

if [ -z $1 ]; then
	echo "usage ./simulation.sh sbst.asm"
	exit
fi

path_to_hex_test_program="$1"

if [ ! -f $path_to_hex_test_program ] ; then
	echo "Input software file for IRAM not defined"
	exit
fi

echo "Moving the hex files into the memories folders"
cp "$path_to_hex_test_program" ../"$path_to_file"test_bench/memories/

echo "Starting initialization of simulation environment"
cd ..
if [ -d "./work" ] ;then 
	rm -rf work
fi

vlib ./work # it also creates the folder
echo "Simulation ready to go!"
echo "Start hierarchical compilation"
echo "Compiling labs units"
vcom -2008 -check_synthesis -autoorder ${path_to_file}global_components.package/*.vhd
vcom -2008 -check_synthesis ${path_to_file}000-globals.vhd
vcom -2008 -check_synthesis ${path_to_file}001-global_components.vhd 
# vlog for verilog -incr(mental) compilation
# vcom for vhdl-2008 and drc for synthesis (basic)


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

echo "Compiling top level testbench for DLX"
vlog -incr ${path_to_file}test_bench/tb_dlx.sv

echo "Starting simulation of dlx top level entity"
## suppress novopt error and metavalue warnings
vsim  -suppress 12110 -suppress 8664 -novopt work.tb_dlx -do ./scripts/dlx_tb.do  


echo "Do you want to see the DLX'tb with the Universal Verification Methodology architecture? y/n"
read answer
if [ answer=="y" ] ; then
export UVM_VERSION="1.1d"
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/uvm_class_def/dlx_sequencer.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/uvm_class_def/dlx_driver.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/uvm_class_def/dlx_monitor.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/uvm_class_def/dlx_scoreboard.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/uvm_class_def/dlx_env.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/uvm_class_def/dlx_test.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/dlx_wrapper.sv
vlog +incdir+/software/mentor/questa10.7c/questasim/uvm-"$UVM_VERSION"/../verilog_src/uvm-"$UVM_VERSION"/src -incr ${path_to_file}test_bench/tb_dlx_uvm.sv
vsim -c -sv_lib /software/mentor/questa10.7c/questasim/uvm-1.1d/linux_x86_64/uvm_dpi +UVM_STACKTRACE -suppress 12110 -suppress 8664 -novopt work.tb_dlx_uvm -do ./scripts/dlx_uvm_tb.do  
else
echo "Ok! you are missing a lot of fancy, amazing and astonishing things"
fi
rm -rf ./work
