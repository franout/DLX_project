//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_memory_stage.sv
// Create : 2020-07-27 15:16:47
// Revise : 2020-07-28 19:01:14
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../memories/memory_interfaces.svh"
`include "../global_defs.svh"

program test_memory( mem_interface.rw dram_if);

	default clocking test_clk @ (posedge dram_if.clk);
  	endclocking	// clock

	initial begin  
		$display("@%0dns Starting Program",$time);
   		dram_if.rst=1;
		$display("Starting testbench for Memory stge",);
		## 1;
		$display("Memory reset",);
		dram_if.rst=0;
		##1;
		dram_if.rst=1;
		##1;

		/*

			TODO
		*/


		$display("Memory stage has passed the testbench",);
		$finish;
	end

endprogram: test 


module tb_memory_stage ();
	localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock

  	// signal instantiation 

	logic ram_enable_cu;

  	//property definitions
  	property generated_address(int min , int max);
  			  		@ (test_clk)
  			dram_if.ENABLE |-> (dram_if.ADDRESS >= min && dram_if.ADDRESS <=max); // when enable is true it implies that the address will be in those boundaries
  	endproperty;

  	property enable_propagate;
  		@ (test_clk)
  		ram_enable_cu |=> dram_if.ENABLE; // it propagates directly to the ram
  	endproperty


  	// instantiaiton of property
  	address_range_check_property : assert property (generated_address(0,2**(`IRAM_ADDRESS_SIZE )-1));
  	enable_propagate_check: assert property (enable_propagate);

  	// iram memory interface
	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (.clk(clk));

	// instantiate the dut and connect the interface
	rwmem #(
		.FILE_PATH     ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem_out.txt"), // it should update the existing file
		.FILE_PATH_INIT("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE),
		.DATA_DELAY    (2))
	dram_uut ( .memif(dram_if));

	// unit under test
	memory_stage #(
		.IR_SIZE(`IRAM_WORD_SIZE),// Instruction Register Size
		.PC_SIZE(`IRAM_ADDRESS_SIZE)// Program Counter Size
		)
		 uut (
	
	);

// test program 
test_memory test_program(.dram_if(dram_if),

		);

	
endmodule : tb_memory_stage
