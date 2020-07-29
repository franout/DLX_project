//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_fetch_stage.sv
// Create : 2020-07-27 15:18:55
// Revise : 2020-07-29 15:50:50
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../memories/memory_interfaces.svh"
`include "../global_defs.svh"

program test_fetch( mem_interface.ro iram_if,
input logic [`IRAM_ADDRESS_SIZE-1:0]new_pc_value ,
input logic [`IRAM_WORD_SIZE-1:0]curr_instruction,
output logic iram_enable_cu);

	default clocking test_clk @ (posedge iram_if.clk);
  	endclocking	// clock

	initial begin  
		$display("@%0dns Starting Program",$time);
      	iram_if.rst=1;
		$display("Starting testbench for fetch stge",);
		## 1;
		$display("Memory reset",);
		iram_if.rst=0;
		##1;
		iram_if.rst=1;
		iram_enable_cu=1;
		##1;
		if(iram_if.ADDRESS!==0)begin
			$display("@%0dns ---> wrong generated address",$time);
			$stop();
		end
		##1;
		if(new_pc_value!=4)begin
			$display("@%0dns ---> wrong generated new program counter value",$time);
			$stop();
		end
		##1;
		if(curr_instruction!=0)begin
			$display("@%0dns ---> wrong generated address",$time);
			$stop();
		end
		##1;
		if(new_pc_value!=8)begin
			$display("@%0dns ---> wrong generated new program counter value",$time);
			$stop();
		end
		##1;
		if(curr_instruction!=61440)begin
			$display("@%0dns ---> wrong generated address",$time);
			$stop();
		end
		##1;
		if(new_pc_value!=12)begin
			$display("@%0dns ---> wrong generated new program counter value",$time);
			$stop();
		end
		##1;
		$display("Fetch stage has passed the testbench",);
		$finish;
	end

endprogram: test_fetch 


module tb_fetch_stage ();
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
//  	logic [`IRAM_ADDRESS_SIZE-1:0]new_pc_value_mem_stage;
  	logic [`IRAM_ADDRESS_SIZE-1:0]new_pc_value; // forward this 
  	logic [`IRAM_WORD_SIZE-1:0]curr_instruction;
	logic iram_enable_cu;

  	//property definitions
  	property generated_address(int min , int max);
  			  		@ (test_clk)
  			iram_if.ENABLE |-> (iram_if.ADDRESS >= min && iram_if.ADDRESS <=max); // when enable is true it implies that the address will be in those boundaries
  	endproperty;

  	property enable_propagate;
  		@ (test_clk)
  		iram_enable_cu |=> iram_if.ENABLE; // it propagates directly to the ram
  	endproperty


  	// instantiaiton of property
  	address_range_check_property : assert property (generated_address(0,2**(`IRAM_ADDRESS_SIZE )-1));
  	enable_propagate_check: assert property (enable_propagate);

  	// iram memory interface
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

	// unit under test
	fetch_stage #(
		.IR_SIZE(`IRAM_WORD_SIZE),// Instruction Register Size
		.PC_SIZE(`IRAM_ADDRESS_SIZE)// Program Counter Size
		)
		 uut (
		.clk(iram_if.clk),
		.rst(iram_if.rst),
		//from  memory stage
		.new_pc_value_mem_stage(new_pc_value),
		// to decode stage
		.new_pc_value(new_pc_value),
		// IRAM interface
		.IRAM_ADDRESS (iram_if.ADDRESS),
		.IRAM_ENABLE  (iram_if.ENABLE),
		.IRAM_READY   (iram_if.DATA_READY),
		.IRAM_DATA    (iram_if.DATA),
		// to/from control unit
		.curr_instruction(curr_instruction),
		.iram_enable_cu (iram_enable_cu)
	);

// test program 
test_fetch test_program(.iram_if(iram_if),
		.new_pc_value(new_pc_value),
		.curr_instruction(curr_instruction),
		.iram_enable_cu(iram_enable_cu)
		);

	
endmodule
