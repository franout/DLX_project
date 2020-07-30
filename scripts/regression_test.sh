#!/usr/bin/bash

path_to_file="./hardware/dlx/"

echo "Starting initialization of simulation environment"
## using questasim 
source /software/scripts/init_questa10.7c 
cd .. # go in parent folder
if [ -d "./work" ] ;then 
	rm -rf work
fi
echo "Starting regression tests"
vlib ./work # it also creates the folder
echo "Simulation ready to go!"
echo "Start hierarchical compilation" 
# vlog for verilog -incr(mental) compilation
vlog -incr ${path_to_file}
# vcom for vhdl-2008 and drc for synthesis (basic)
vcom  -2008 -check_synthesis ${path_to_file}


# Compile of 000-globals.vhd was successful.
# Compile of 001-global_components.vhd was successful.
# Compile of adder.vhd was successful.
# Compile of boothmul.vhd was successful.
# Compile of complement2.vhd was successful.
# Compile of encoder.vhd was successful.
# Compile of fa.vhd was successful.
# Compile of fd.vhd was successful.
# Compile of gsb.vhd was successful.
# Compile of mux.vhd was successful.
# Compile of p4_adder.vhd was successful.
# Compile of pgsb.vhd was successful.
# Compile of rca.vhd was successful.
# Compile of reg_nbit.vhd was successful.
# Compile of registerfile.vhd was successful.
# Compile of stcg.vhd was successful.
# Compile of wrf.vhd was successful.
# Compile of a.b.e-Write_back.stage.vhd was successful.
# Compile of constants.vhd was successful.
# Compile of alu.vhd was successful.
# Compile of csb.vhd was successful.
# Compile of mux21_nbit.vhd was successful.
# Compile of pg.vhd was successful.
# Compile of sum_gen.vhd was successful with warnings.
# Compile of romem.sv was successful.
# Compile of rwmem.sv was successful.
# Compile of tb_memories.sv was successful.
# Compile of tb_writeback_stage.sv was successful.
# Compile of implemented_instructions.svh was successful.
# Compile of tb_dlx.sv was successful.
# Compile of alu_type.vhd was successful.
# Compile of memory_interfaces.svh was successful.
# Compile of mux21.vhd was successful.
# Compile of global_defs.svh was successful.
# Compile of tb_cu.sv was successful.
# Compile of tb_datapath.sv was successful.
# Compile of tb_decode_stage.sv failed with 1 errors.
# Compile of tb_execute_stage.sv was successful.
# Compile of tb_fetch_stage.sv was successful.
# Compile of a.b.a-Fetch.stage.vhd was successful.
# Compile of a.b.b-Decode.stage.vhd failed with 2 errors.
# Compile of a.b.c-Execute.stage.vhd was successful.
# Compile of a.b.d.Memory.stage.vhd was successful.
# Compile of MULTIPLIER_tb.vhd was successful.
# Compile of tb_alu.vhd was successful.
# Compile of tb_csb.vhd was successful.
# Compile of tb_fd.vhd was successful.
# Compile of tb_mux21_generic.vhd was successful.
# Compile of tb_p4adder.vhd was successful.
# Compile of tb_rca.vhd was successful.
# Compile of tb_registerfile.vhd was successful.
# Compile of tb_registerfile_wrf.vhd was successful.
# Compile of tb_regN.vhd was successful.
# Compile of tb_stcg.vhd was successful.
# Compile of tb_sum_gen.vhd was successful.
# Compile of tb_memory_stage.sv was successful.



echo "Starting simulation of memory units"
vism -suppress 12110 -novopt work.tb_memories -do ./scripts/memories_tb.do
echo "Starting simulation of fetch back stage unit" 
#suppress warning using the -novopt
vism -suppress 12110 -novopt work.tb_fetch_stage -do ./scripts/fetch_stage_tb.do
echo "Starting simulation of decode back stage unit"
vism -suppress 12110 -novopt work.tb_decode_stage -do ./scripts/decode_stage_tb.do
echo "Starting simulation of execute back stage unit"
vism -suppress 12110 -novopt work.tb_execute_stage -do ./scripts/execute_stage_tb.do
echo "Starting simulation of memory back stage unit"
vism -suppress 12110 -novopt work.tb_memory_stage -do ./scripts/memory_stage_tb.do
echo "Starting simulation of write back stage unit"
vism -suppress 12110 -novopt work.tb_writeback_stage -do ./scripts/writeback_stage_tb.do
echo "Starting simulation of datapath stage unit"
vism -suppress 12110 -novopt work.tb_datapath -do ./scripts/datapath_tb.do
echo "Starting simulation of cu stage unit"
vism -suppress 12110 -novopt work.tb_cu -do ./scripts/cu_tb.do

echo "Regression test passed"
rm -rf work 
exit
