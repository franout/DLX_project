onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Instruction /tb_cu/test_control_unit/instruction_to_cu
add wave -noupdate -expand -group Instruction /tb_cu/test_control_unit/current_opcode
add wave -noupdate -expand -group Instruction /tb_cu/test_control_unit/current_opcode_alu_fun
add wave -noupdate -expand -group Instruction /tb_cu/test_control_unit/rs1
add wave -noupdate -expand -group Instruction /tb_cu/test_control_unit/rs2
add wave -noupdate -expand -group Instruction /tb_cu/test_control_unit/rd
add wave -noupdate /tb_cu/clk
add wave -noupdate /tb_cu/rst
add wave -noupdate /tb_cu/iram_enable_cu
add wave -noupdate /tb_cu/iram_ready_cu
add wave -noupdate /tb_cu/curr_instruction_to_cu
add wave -noupdate /tb_cu/enable_rf
add wave -noupdate /tb_cu/read_rf_p1
add wave -noupdate /tb_cu/read_rf_p2
add wave -noupdate /tb_cu/write_rf
add wave -noupdate /tb_cu/rtype_itypen_i
add wave -noupdate /tb_cu/compute_sext
add wave -noupdate /tb_cu/jump_sext
add wave -noupdate /tb_cu/alu_op_type
add wave -noupdate /tb_cu/sel_val_a
add wave -noupdate /tb_cu/sel_val_b
add wave -noupdate /tb_cu/alu_cin
add wave -noupdate /tb_cu/alu_overflow
add wave -noupdate /tb_cu/evaluate_branch
add wave -noupdate /tb_cu/zero_mul_detect
add wave -noupdate /tb_cu/mul_exeception
add wave -noupdate /tb_cu/dram_enable_cu
add wave -noupdate /tb_cu/dram_r_nw_cu
add wave -noupdate /tb_cu/dram_ready_cu
add wave -noupdate /tb_cu/select_wb
add wave -noupdate /tb_cu/signed_notsigned
add wave -noupdate /tb_cu/STATE_CU
add wave -noupdate /tb_cu/csr
add wave -noupdate /tb_cu/ireg_instr
add wave -noupdate /tb_cu/imm_instru
add wave -noupdate /tb_cu/jump_instr
add wave -noupdate /tb_cu/lw_instr
add wave -noupdate /tb_cu/sw_instr
add wave -noupdate /tb_cu/b_instr
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cmd_word
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cmd_word_to_reg
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cw1
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cw2
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cw3
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cw4
add wave -noupdate -expand -group {Internal CU command word} /tb_cu/uut/cw5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
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
WaveRestoreZoom {0 ps} {84 ns}
run 1500ns
