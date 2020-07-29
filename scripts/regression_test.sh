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