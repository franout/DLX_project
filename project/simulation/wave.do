onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_memories/clk
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/clk
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/rst
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/ADDRESS
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/ENABLE
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/DATA_READY
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/DATA
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/READNOTWRITE
add wave -noupdate -expand -group {iram intrface} /tb_memories/iram_if/INOUT_DATA
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/clk
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/rst
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/ADDRESS
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/ENABLE
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/DATA_READY
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/DATA
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/READNOTWRITE
add wave -noupdate -expand -group {dram interface} /tb_memories/dram_if/INOUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
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
WaveRestoreZoom {0 ps} {92308 ps}
