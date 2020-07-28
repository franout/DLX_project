onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fetch_stage/clk
add wave -noupdate /tb_fetch_stage/new_pc_value
add wave -noupdate /tb_fetch_stage/curr_instruction
add wave -noupdate /tb_fetch_stage/iram_enable_cu
add wave -noupdate /tb_fetch_stage/iram_if/clk
add wave -noupdate /tb_fetch_stage/iram_if/rst
add wave -noupdate /tb_fetch_stage/iram_if/ADDRESS
add wave -noupdate /tb_fetch_stage/iram_if/ENABLE
add wave -noupdate /tb_fetch_stage/iram_if/DATA_READY
add wave -noupdate /tb_fetch_stage/iram_if/DATA
add wave -noupdate /tb_fetch_stage/iram_if/READNOTWRITE
add wave -noupdate /tb_fetch_stage/iram_if/INOUT_DATA
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
run 500ns