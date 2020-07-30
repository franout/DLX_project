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

# vcom for vhdl-2008 and drc for synthesis (basic)
vcom -2008 -check_synthesis ${path_to_file}000-globals.vhd
vcom -2008 -check_synthesis ${path_to_file}001-global_components.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/adder.vhd
vcom -2008 -check_synthesis ${path_to_file}global_components.package/boothmul.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/complement2.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/encoder.vhd
vcom -2008 -check_synthesis ${path_to_file}global_components.package/fa.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/fd.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/gsb.vhd
vcom -2008 -check_synthesis ${path_to_file}global_components.package/mux.vhd
vcom -2008 -check_synthesis ${path_to_file}global_components.package/p4_adder.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/pgsb.vhd
vcom -2008 -check_synthesis ${path_to_file}global_components.package/rca.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/reg_nbit.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/registerfile.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/stcg.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/wrf.vhd
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.e-Write_back.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/constants.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/alu.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/csb.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/mux21_nbit.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/pg.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/sum_gen.vhd

# vlog for verilog -incr(mental) compilation
vlog -incr ${path_to_file}test_bench/memories/romem.sv
vlog -incr ${path_to_file}test_bench/memories/rwmem.sv 
vlog -incr ${path_to_file}test_bench/memories/tb_memories.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_writeback_stage.sv
vlog -incr ${path_to_file}test_bench/implemented_instructions.svh
vlog -incr ${path_to_file}/test_bench/tb_dlx.sv

vcom -2008 -check_synthesis ${path_to_file}global_components.package/alu_type.vhd 

vlog -incr ${path_to_file}test_bench/memories/memory_interfaces.svh 
vcom -2008 -check_synthesis ${path_to_file}mux21.vhd 
vlog -incr ${path_to_file}test_bench/global_defs.svh 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_cu.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_datapath.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_decode_stage.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_execute_stage.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_fetch_stage.sv 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.a-Fetch.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.b-Decode.stage.vhd  
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}a.b-DataPath.core/a.b.d.Memory.stage.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/MULTIPLIER_tb.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_alu.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_csb.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_fd.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_mux21_generic.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_p4adder.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_rca.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_registerfile.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_registerfile_wrf.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_regN.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_stcg.vhd 
vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_sum_gen.vhd 
vlog -incr ${path_to_file}/test_bench/test_bench_subunits/tb_memory_stage.sv 


echo "##########################################################"
echo "####---> Starting regression test for every units <---####"
echo "##########################################################"

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

echo "[PASS] -> Regression test passed"
rm -rf work 
exit
