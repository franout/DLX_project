onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_memory_stage/clk
add wave -noupdate /tb_memory_stage/select_pc
add wave -noupdate /tb_memory_stage/alu_output_val
add wave -noupdate /tb_memory_stage/dram_r_nw_cu
add wave -noupdate /tb_memory_stage/dram_ready_cu
add wave -noupdate /tb_memory_stage/data_from_memory
add wave -noupdate -radix unsigned /tb_memory_stage/data_from_alu
add wave -noupdate /tb_memory_stage/new_pc_value_branch
add wave -noupdate /tb_memory_stage/dram_enable_cu
add wave -noupdate /tb_memory_stage/new_pc_value
add wave -noupdate /tb_memory_stage/value_to_mem
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/clk
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/rst
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/ADDRESS
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/ENABLE
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/DATA_READY
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/DATA
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/READNOTWRITE
add wave -noupdate -expand -group dram_interface /tb_memory_stage/dram_if/INOUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24251 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {10088 ps} {46838 ps}
run 200ns
