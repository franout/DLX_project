//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_wrapper.sv
// Create : 2020-30-08 19:00:18
// Revise : 2020-08-21 20:02:24
// Editor : sublime text3, tab size (4)
// Description:  for reducing the instantiation of signal for dut in UVM tb
// -----------------------------------------------------------------------------


`timescale  1ns/1ps
`include "./003-global_defs.svh"
`include "./004-implemented_instructions.svh"
`include "./memories/005-memory_interfaces.svh"


module dlx_wrapper (
	input clk,    // Clock
	input rst, // active low
	mem_interface.ro mif_ro, // memory interface clocked by clk
	mem_interface.rw mif_rw, // memory interface clocked by clk
	DEBUG_interface dbg_if
);

	

	//DLX top level entity
	DLX #(
    .IR_SIZE(`IRAM_WORD_SIZE),
    .PC_SIZE(`IRAM_ADDRESS_SIZE)
  ) dlx_i (
  	// verbose assignmento of the interfaces signals 
  	// Inputs
    .CLK 				(clk),
    .RST 				(rst),
    // Instruction memory interface
    .IRAM_ADDRESS 		(mif_ro.ADDRESS),
    .IRAM_ENABLE		(mif_ro.ENABLE),
    .IRAM_READY			(mif_ro.DATA_READY),
    .IRAM_DATA			(mif_ro.DATA),
    // Data memory Interface
    .DRAM_ADDRESS  		(mif_rw.ADDRESS),
    .DRAM_ENABLE        (mif_rw.ENABLE),
    .DRAM_READNOTWRITE 	(mif_rw.READNOTWRITE),
    .DRAM_READY        	(mif_rw.DATA_READY),
    .DRAM_DATA     		(mif_rw.INOUT_DATA)
    // simulation debug signals
    //synthesis_translate off
    ,
    .STATE_CU			(dbg_if.curr_state_debug),
    .csr                (dbg_if.csr),    
    //all the control unit signals
    //used for system verilog verification 
    .DEBUG_iram_ready_cu(dbg_if.iram_ready_cu),
    .DEBUG_iram_enable_cu(dbg_if.iram_enable_cu),
    .DEBUG_signed_notsigned(dbg_if.signed_notsigned),
    .DEBUG_compute_sext(dbg_if.compute_sext),
    .DEBUG_jump_sext(dbg_if.jump_sext),
    .DEBUG_write_rf(dbg_if.write_rf),
    .DEBUG_evaluate_branch(dbg_if.evaluate_branch),
    .DEBUG_alu_cin(dbg_if.alu_cin),
    .DEBUG_alu_overflow(dbg_if.alu_overflow),
    .DEBUG_zero_mul_detect(dbg_if.zero_mul_detect),
    .DEBUG_mul_exeception(dbg_if.mul_exeception),
    .DEBUG_dram_ready_cu(dbg_if.dram_ready_cu),
    .DEBUG_dram_r_nw_cu(dbg_if.dram_r_nw_cu),
    .DEBUG_enable_rf(dbg_if.enable_rf),
    .DEBUG_read_rf_p1(dbg_if.read_rf_p1),
    .DEBUG_read_rf_p2(dbg_if.read_rf_p2),
    .DEBUG_rtype_itypen(dbg_if.rtype_itypen),
	.DEBUG_sel_val_a(dbg_if.sel_val_a),
    .DEBUG_sel_val_b(dbg_if.sel_val_b),
	.DEBUG_update_pc_branch(dbg_if.update_pc_branch),
    .DEBUG_select_wb(dbg_if.select_wb),
    .DEBUG_alu_op_type(dbg_if.alu_operation),
    .DEBUG_dram_enable_cu(dbg_if.dram_enable_cu)
    //synthesis_translate on
  );


	//assign same reset signal to both interfaces
	assign mif_rw.rst=rst;
	assign mif_ro.rst=rst;

endmodule
