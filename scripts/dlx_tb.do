onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_dlx/clk
add wave -noupdate /tb_dlx/rst
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/clk
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/rst
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/ADDRESS
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/ENABLE
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/DATA_READY
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/DATA
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/READNOTWRITE
add wave -noupdate -expand -group {Iram interface} /tb_dlx/iram_if/INOUT_DATA
add wave -noupdate -expand -group Instruction /tb_dlx/test_prog/current_instruction
add wave -noupdate -expand -group Instruction /tb_dlx/test_prog/current_opcode
add wave -noupdate /tb_dlx/test_prog/current_opcode_func
add wave -noupdate -expand -group {Debug signal from CU} /tb_dlx/curr_state_debug
add wave -noupdate -expand -group {Debug signal from CU} /tb_dlx/csr
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Fetch stage} /tb_dlx/DEBUG_iram_ready_cu
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Fetch stage} /tb_dlx/DEBUG_iram_enable_cu
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Decode stage} /tb_dlx/DEBUG_compute_sext
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Decode stage} /tb_dlx/DEBUG_jump_sext
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Decode stage} /tb_dlx/DEBUG_enable_rf
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Decode stage} /tb_dlx/DEBUG_read_rf_p1
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Decode stage} /tb_dlx/DEBUG_read_rf_p2
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Decode stage} /tb_dlx/DEBUG_rtype_itypen
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Execute stage} /tb_dlx/DEBUG_evaluate_branch
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Execute stage} /tb_dlx/DEBUG_signed_notsigned
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Execute stage} /tb_dlx/DEBUG_alu_cin
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Execute stage} /tb_dlx/DEBUG_alu_overflow
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Execute stage} /tb_dlx/DEBUG_zero_mul_detect
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Execute stage} /tb_dlx/DEBUG_mul_exeception
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Memory stage} /tb_dlx/DEBUG_dram_ready_cu
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Memory stage} /tb_dlx/DEBUG_dram_r_nw_cu
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Memory stage} /tb_dlx/DEBUG_dram_enable_cu
add wave -noupdate -expand -group {Debug signal from CU} -expand -group {Write back stage} /tb_dlx/DEBUG_write_rf
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/clk
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/rst
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/ADDRESS
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/ENABLE
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/DATA_READY
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/DATA
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/READNOTWRITE
add wave -noupdate -group {Dram interface} /tb_dlx/dram_if/INOUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1797947 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 229
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
WaveRestoreZoom {1742968 ps} {1907032 ps}
run 15000ns
