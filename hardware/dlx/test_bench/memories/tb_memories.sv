//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_memories.sv
// Create : 2020-07-22 20:19:53
// Revise : 2020-07-25 18:41:11
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale 1ns/1ps


`define  IRAM_WORD_SIZE 32
`define  IRAM_ADDRESS_SIZE 32
`define  DRAM_WORD_SIZE 32
`define  DRAM_ADDRESS_SIZE 32

module tb_memories ();
	localparam clock_period= 10ns;
	logic clk;


	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking ram_clk @ (posedge clk);
  	
  	endclocking	// clock

  	//bound of address 
  	property address_range(int min, int max);
  		@ (ram_clk)

  	endproperty 

  	// sequence
  	property ready_check;
  		iram_if.ENABLE ##1 iram_if.DATA_READY ;
  	endproperty

  	//=================================================
 	// Assertion Directive Layer
  	//=================================================
  	ready_check_property : assert property (ready_check);

	// instantiate the interface
	rwmem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (clk);

	romem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (clk);

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   ("./test_mem.txt"),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.DATA_DELAY  (2)) 
		iram_uut
	(.mif(iram_if));
		
	rwmem #(
		.FILE_PATH     ("./test_mem.txt"),
		.FILE_PATH_INIT("./test_mem_out.txt"),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE),
		.DATA_DELAY    (2))
	dram_uut ( .memif(dram_if));


	initial begin 
		iram_if.rst='1;
		dram_if.rst='1;
		$display("Starting testbench for memories",);
		## 1;
		iram_if.rst='0;
		dram_if.rst='0;
		$display("Reading file for Read-Only memory",);
		iram_if.ENABLE='1;
		## 1;


		$display("Read-Only Memory passed the testbench",);

		$display("Starting test of read and write memory",);

		$finish();
	end

// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_memories.fsdb");
			$fsdbDumpvars(0, "tb_memories", "+mda", "+functions");
		end
	end


endmodule