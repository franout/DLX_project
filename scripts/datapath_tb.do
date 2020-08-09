onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_datapath/clk
add wave -noupdate /tb_datapath/rst
add wave -noupdate /tb_datapath/iram_enable_cu
add wave -noupdate /tb_datapath/iram_ready_cu
add wave -noupdate /tb_datapath/curr_instruction_to_cu
add wave -noupdate /tb_datapath/enable_rf
add wave -noupdate /tb_datapath/read_rf_p1
add wave -noupdate /tb_datapath/read_rf_p2
add wave -noupdate /tb_datapath/write_rf
add wave -noupdate /tb_datapath/rtype_itypen
add wave -noupdate /tb_datapath/compute_sext
add wave -noupdate /tb_datapath/alu_op_type
add wave -noupdate /tb_datapath/sel_val_a
add wave -noupdate /tb_datapath/sel_val_b
add wave -noupdate /tb_datapath/evaluate_branch
add wave -noupdate /tb_datapath/alu_cin
add wave -noupdate /tb_datapath/alu_overflow
add wave -noupdate /tb_datapath/dram_enable_cu
add wave -noupdate /tb_datapath/dram_r_nw_cu
add wave -noupdate /tb_datapath/dram_ready_cu
add wave -noupdate /tb_datapath/select_wb
add wave -noupdate /tb_datapath/iram_if/IRAM_ADDRESS
add wave -noupdate /tb_datapath/iram_if/IRAM_ENABLE
add wave -noupdate /tb_datapath/iram_if/IRAM_READY
add wave -noupdate /tb_datapath/iram_if/IRAM_DATA
add wave -noupdate /tb_datapath/dram_if/DRAM_ADDRESS
add wave -noupdate /tb_datapath/dram_if/DRAM_ENABLE
add wave -noupdate /tb_datapath/dram_if/DRAM_READNOTWRITE
add wave -noupdate /tb_datapath/dram_if/DRAM_READY
add wave -noupdate /tb_datapath/dram_if/DRAM_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1662 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {47250 ps}
run 1000ns