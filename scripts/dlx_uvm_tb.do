onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Iram interface} /tb_dlx_uvm/iram_if/clk
add wave -noupdate -expand -group {Iram interface} /tb_dlx_uvm/iram_if/rst
add wave -noupdate -expand -group {Iram interface} /tb_dlx_uvm/iram_if/ADDRESS
add wave -noupdate -expand -group {Iram interface} /tb_dlx_uvm/iram_if/ENABLE
add wave -noupdate -expand -group {Iram interface} /tb_dlx_uvm/iram_if/DATA_READY
add wave -noupdate -expand -group {Iram interface} /tb_dlx_uvm/iram_if/DATA
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/clk
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/rst
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/ADDRESS
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/ENABLE
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/DATA_READY
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/READNOTWRITE
add wave -noupdate -expand -group {Dram interface} /tb_dlx_uvm/dram_if/INOUT_DATA
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/iram_ready_cu
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/iram_enable_cu
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/signed_notsigned
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/compute_sext
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/jump_sext
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/write_rf
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/evaluate_branch
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/alu_cin
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/alu_overflow
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/zero_mul_detect
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/mul_exeception
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/dram_ready_cu
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/dram_r_nw_cu
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/enable_rf
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/read_rf_p1
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/read_rf_p2
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/rtype_itypen
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/sel_val_a
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/sel_val_b
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/update_pc_branch
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/select_wb
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/dram_enable_cu
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/csr
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/rst
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/curr_state_debug
add wave -noupdate -expand -group {Debug interface} /tb_dlx_uvm/dbg_if/alu_operation
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {129 ps} 0}
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
WaveRestoreZoom {0 ps} {712 ps}
run -all
