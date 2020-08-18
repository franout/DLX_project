onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_execute_stage/clk
add wave -noupdate /tb_execute_stage/rst
add wave -noupdate /tb_execute_stage/val_a
add wave -noupdate /tb_execute_stage/val_b
add wave -noupdate /tb_execute_stage/val_immediate
add wave -noupdate -expand -group {ALU operation type} /tb_execute_stage/test/alu_operation
add wave -noupdate -expand -group {ALU operation type} /tb_execute_stage/alu_op_type
add wave -noupdate /tb_execute_stage/new_prog_counter_val_exe
add wave -noupdate /tb_execute_stage/alu_output_val
add wave -noupdate /tb_execute_stage/sel_val_a
add wave -noupdate /tb_execute_stage/sel_val_b
add wave -noupdate /tb_execute_stage/evaluate_branch
add wave -noupdate /tb_execute_stage/branch_condition
add wave -noupdate /tb_execute_stage/value_to_mem
add wave -noupdate /tb_execute_stage/prog_counter_forwaded
add wave -noupdate -expand -group {internal alu signals} /tb_execute_stage/cin
add wave -noupdate -expand -group {internal alu signals} /tb_execute_stage/overflow
add wave -noupdate -expand -group {internal alu signals} /tb_execute_stage/zero_mul_detect
add wave -noupdate -expand -group {internal alu signals} /tb_execute_stage/mul_exeception
add wave -noupdate -expand -group {internal alu signals} /tb_execute_stage/signed_notsigned
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15692 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 202
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
WaveRestoreZoom {0 ps} {93 ns}
