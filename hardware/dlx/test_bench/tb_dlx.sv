//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx.sv
// Create : 2020-07-21 19:00:18
// Revise : 2020-08-19 22:34:14
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ns/1ps
`include "003-global_defs.svh"
`include "004-implemented_instructions.svh"
`include "./memories/005-memory_interfaces.svh"
`include "006-property_def.svh"

module tb_dlx ();
	localparam clock_period= 10ns;
	// it needs the absolute path
	localparam PATH_TO_DMEM_FINAL="";
	localparam PATH_TO_DMEM="";
	localparam PATH_TO_IMEM="";


	logic rst_n;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_dlx @ (posedge clk);
  	endclocking	// clock

/*
	-># time unit
	-> The ## operator can be used to delay execution by a specified number 
			of clocking events or clock cycles. This is same as what we
			 have seen in assertion section.
	
*/

	
	// reset
	initial begin
		rst_n='1;
		##1 rst_n='0; 
		##5 rst_n='1;
		$display("Attention!!",);
		$display("Starting simulated exection of the DLX",);
		$display("Starting an amazing and very fancy testbench in System Verilog",);
		// the monitor process for the instruction will end the simulation as soon as it finds the halt instruction
	end
	/////////////////////////////////////
	// instantiate the components ///////
	/////////////////////////////////////

	// Instruction memory
	// instantiate the interface
	mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (clk);

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   (PATH_TO_IMEM),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.DATA_DELAY  (2)) 
		iram
	(.mif(iram_if));
	

	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (clk);
	// Data memory
	rwmem #(
		.FILE_PATH     (PATH_TO_DMEM_FINAL),
		.FILE_PATH_INIT(PATH_TO_DMEM),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE),
		.DATA_DELAY    (2))
	dram ( .memif(dram_if));
	

	//DLX top level entity
	DLX #(
    .IR_SIZE(`IRAM_WORD_SIZE),
    .PC_SIZE(`IRAM_ADDRESS_SIZE)
  ) dlx_uut (
  	// verbose assignmento of the interfaces signals 
  	// Inputs
    .CLK 				(clk),
    .RST 				(rst_n),
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
    .STATE_CU			(curr_state_debug)
    //synthesis_translate on
  );

//TODO  a task or a monitor which understand the current operation that is going to be executed and compare with the implemented_instructions.svh
// and choose the property and assertion accordingly


	// check process for the instructions
	// use monitor



endmodule


