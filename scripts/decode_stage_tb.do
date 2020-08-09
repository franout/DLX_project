onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_decode_stage/clk
add wave -noupdate /tb_decode_stage/rst
add wave -noupdate /tb_decode_stage/new_prog_counter_val
add wave -noupdate /tb_decode_stage/instruction_reg
add wave -noupdate /tb_decode_stage/val_a
add wave -noupdate /tb_decode_stage/new_prog_counter_val_exe
add wave -noupdate /tb_decode_stage/val_b
add wave -noupdate /tb_decode_stage/val_immediate
add wave -noupdate /tb_decode_stage/update_reg_value
add wave -noupdate /tb_decode_stage/enable_rf
add wave -noupdate /tb_decode_stage/read_rf_p1
add wave -noupdate /tb_decode_stage/read_rf_p2
add wave -noupdate /tb_decode_stage/write_rf
add wave -noupdate /tb_decode_stage/rtype_itypen
add wave -noupdate /tb_decode_stage/compute_sext
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10915 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 183
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
WaveRestoreZoom {0 ps} {53562 ps}
