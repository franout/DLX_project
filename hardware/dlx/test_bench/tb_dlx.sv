//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx.sv
// Create : 2020-07-21 19:00:18
// Revise : 2020-08-21 20:02:24
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ns/1ns
`include "./003-global_defs.svh"
`include "./004-implemented_instructions.svh"
`include "./memories/005-memory_interfaces.svh"
`include "./006-property_def.svh"

program automatic test_dlx_top(input logic clk, output logic rst,
 						input logic [`IRAM_WORD_SIZE-1:0] current_instruction);


	default clocking test_clk_prog @( posedge clk);
	endclocking

	initial begin 
		$display("@%0dns Starting Test Program in System Verilog",$time);
		$display("Reset",);
		rst=0;
		##3;
		rst=1;
		$monitor("current instrution %h",current_instruction);
		##100;
		// wait for 10 cc -> reached the end of the program in IRAM
		expect (@(test_clk_prog) 	(current_instruction[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_j)[*10] ) begin 
			$display("Program in IRAM has ended",);
			$finish();
		end
		else
			$display("Something is wrong",);
			##100;

	end

endprogram : test_dlx_top

module tb_dlx ();
	localparam clock_period= 10ns;
	// it needs the absolute path

	logic rst;
	logic clk;
	logic [$clog2(`CU_STATES)-1:0] curr_state_debug_i;
 	cu_state_t  curr_state_debug;
 	logic [7:0] csr;
 	logic DEBUG_iram_ready_cu;
	logic DEBUG_iram_enable_cu;
	logic DEBUG_signed_notsigned;
	logic DEBUG_compute_sext;
	logic DEBUG_jump_sext;
	logic DEBUG_write_rf;
	logic [1:0]DEBUG_evaluate_branch;
	logic DEBUG_alu_cin;
	logic DEBUG_alu_overflow;
	logic DEBUG_zero_mul_detect;
	logic DEBUG_mul_exeception;
	logic DEBUG_dram_ready_cu;
	logic DEBUG_dram_r_nw_cu;
	logic DEBUG_enable_rf;
	logic DEBUG_read_rf_p1;
	logic DEBUG_read_rf_p2;
	logic DEBUG_rtype_itypen;
	logic DEBUG_dram_enable_cu;

	assign curr_state_debug=cu_state_t'(curr_state_debug_i);

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_dlx @ (posedge clk);
  	endclocking	// clock

	
	initial begin
		$display("Attention!!",);
		$display("Starting simulated execution of the DLX",);
		$display("Starting an amazing and very fancy testbench in System Verilog",);
	end
	/////////////////////////////////////
	// instantiate the components ///////
	/////////////////////////////////////

	// Instruction memory
	// instantiate the interface
	mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (.clk(clk));

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   (`PATH_TO_IMEM),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE/2),
		.DATA_DELAY  (2)) 
		iram
	(.mif(iram_if.ro));



	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (.clk(clk));
	// Data memory
	rwmem #(
		.FILE_PATH     (`PATH_TO_DMEM_FINAL),
		.FILE_PATH_INIT(`PATH_TO_DMEM),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE/2),
		.DATA_DELAY    (2))
	dram ( .memif(dram_if.rw));
	

	//DLX top level entity
	DLX #(
    .IR_SIZE(`IRAM_WORD_SIZE),
    .PC_SIZE(`IRAM_ADDRESS_SIZE)
  ) dlx_uut (
  	// verbose assignmento of the interfaces signals 
  	// Inputs
    .CLK 				(clk),
    .RST 				(rst),
    // Instruction memory interface
    .IRAM_ADDRESS 		(iram_if.ADDRESS),
    .IRAM_ENABLE		(iram_if.ENABLE),
    .IRAM_READY			(iram_if.DATA_READY),
    .IRAM_DATA			(iram_if.DATA),
    // Data memory Interface
    .DRAM_ADDRESS  		(dram_if.ADDRESS),
    .DRAM_ENABLE        (dram_if.ENABLE),
    .DRAM_READNOTWRITE 	(dram_if.READNOTWRITE),
    .DRAM_READY        	(dram_if.DATA_READY),
    .DRAM_DATA     		(dram_if.INOUT_DATA)
    // simulation debug signals
    //synthesis_translate off
    ,
    .STATE_CU			(curr_state_debug_i),
    .csr                (csr),    
    //all the control unit signals
    //used for system verilog verification 
    .DEBUG_iram_ready_cu(DEBUG_iram_ready_cu),
    .DEBUG_iram_enable_cu(DEBUG_iram_enable_cu),
    .DEBUG_signed_notsigned(DEBUG_signed_notsigned),
    .DEBUG_compute_sext(DEBUG_compute_sext),
    .DEBUG_jump_sext(DEBUG_jump_sext),
    .DEBUG_write_rf(DEBUG_write_rf),
    .DEBUG_evaluate_branch(DEBUG_evaluate_branch),
    .DEBUG_alu_cin(DEBUG_alu_cin),
    .DEBUG_alu_overflow(DEBUG_alu_overflow),
    .DEBUG_zero_mul_detect(DEBUG_zero_mul_detect),
    .DEBUG_mul_exeception(DEBUG_mul_exeception),
    .DEBUG_dram_ready_cu(DEBUG_dram_ready_cu),
    .DEBUG_dram_r_nw_cu(DEBUG_dram_r_nw_cu),
    .DEBUG_enable_rf(DEBUG_enable_rf),
    .DEBUG_read_rf_p1(DEBUG_read_rf_p1),
    .DEBUG_read_rf_p2(DEBUG_read_rf_p2),
    .DEBUG_rtype_itypen(DEBUG_rtype_itypen),
    .DEBUG_dram_enable_cu(DEBUG_dram_enable_cu)
    //synthesis_translate on
  );

//assign same reset signal to both interfaces
assign iram_if.rst=rst;
assign dram_if.rst=rst;

 test_dlx_top test_prog(.clk(clk),
 						.rst(rst),
 						.current_instruction(iram_if.DATA));
endmodule


