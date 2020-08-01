//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_datapath.sv
// Create : 2020-07-27 15:16:24
// Revise : 2020-08-01 19:11:08
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../003-global_defs.svh"

program test_datapath(mem_interface.ro iram_if , mem_interface.rw dram_if);


  	default clocking test_clk @ (posedge iram_if.clk); // it is the same clock for dram
  	endclocking	// clock

	initial begin 
		$display("@%0dns Starting Program",$time);
		##1;
		$display("Starting integration testbench for datapath",);




		##3;
		$finish;

	end 

endprogram : test_datapath

module tb_datapath ();
localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock
  	// property definitions


  	// property instantiation 

  	// memory interfaces
	
	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (.clk(clk));

	mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if ( .clk(clk));

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.DATA_DELAY  (2)) 
		iram
	(.mif(iram_if));
		
	rwmem #(
		.FILE_PATH     ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem_out.txt"), // it should update the existing file
		.FILE_PATH_INIT("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE),
		.DATA_DELAY    (2))
	dram ( .memif(dram_if));



  	// unit under test



  	// test program 
  	test_datapath test(.dram_if(dram_if),
  						.iram_if(iram_if));
endmodule
