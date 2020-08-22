#!/usr/bin/bash

path_to_file="./hardware/dlx/"

echo "Starting initialization of simulation environment"
## using questasim 
source /software/scripts/init_questa10.7c 
cd .. # go in parent folder
if [ -d "./work" ] ;then 
	rm -rf work
fi
echo "Starting regression functional tests "
vlib ./work # it also creates the folder
echo "Simulation ready to go!"
echo "Start hierarchical compilation" 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/constants.vhd
vcom -2008 -check_synthesis ${path_to_file}global_components.package/alu_type.vhd 
vcom -2008 -check_synthesis ${path_to_file}000-globals.vhd
vcom -2008 -check_synthesis ${path_to_file}001-global_components.vhd 
# vlog for verilog -incr(mental) compilation
# vcom for vhdl-2008 and drc for synthesis (basic)

echo "Compiling labs units"
vcom -2008 -check_synthesis ${path_to_file}global_components.package/wrf.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/adder.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/alu.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/boothmul.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/complement2.vhd  
vcom -2008 -check_synthesis ${path_to_file}global_components.package/csb.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/encoder.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/fa.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/fd.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/gsb.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/mult_gm.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/mux.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/mux21.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/mux21_nbit.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/p4_adder.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/pgsb.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/rca.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/reg_nbit.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/registerfile.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/stcg.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/sum_gen.vhd 
vcom -2008 -check_synthesis ${path_to_file}global_components.package/pg.vhd


vcom -2008 -check_synthesis ${path_to_file}test_bench/test_bench_subunits_labs/tb_sum_gen.vhd
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
vcom -2008 -check_synthesis ${path_to_file}a.DLX.vhd 

echo "Compiling testbenches subunits"
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_writeback_stage.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_cu.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_datapath.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_decode_stage.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_execute_stage.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_fetch_stage.sv 
vlog -incr ${path_to_file}test_bench/test_bench_subunits/tb_memory_stage.sv 


echo "##########################################################"
echo "####---> Starting regression test for every units <---####"
echo "##########################################################"

echo "Starting simulation of memory units"
vsim -suppress 12110 -novopt work.tb_memories -do ./scripts/memories_tb.do
echo "Starting simulation of fetch back stage unit" 
#suppress warning using the -novopt
vsim -suppress 12110 -novopt work.tb_fetch_stage -do ./scripts/fetch_stage_tb.do
echo "Starting simulation of decode back stage unit"
vsim -suppress 12110 -novopt work.tb_decode_stage -do ./scripts/decode_stage_tb.do
echo "Starting simulation of execute back stage unit"
vsim -suppress 12110 -novopt work.tb_execute_stage -do ./scripts/execute_stage_tb.do
echo "Starting simulation of memory back stage unit"
vsim -suppress 12110 -novopt work.tb_memory_stage -do ./scripts/memory_stage_tb.do
echo "Starting simulation of write back stage unit"
vsim -suppress 12110 -novopt work.tb_writeback_stage -do ./scripts/writeback_stage_tb.do
echo "Starting simulation of cu stage unit"
vsim -suppress 12110 -novopt work.tb_cu -do ./scripts/cu_tb.do

echo "[PASS] -> Regression test passed , you can safely execute the simulation.sh script for testing the DLX top level entity"
rm -rf work 
exit
