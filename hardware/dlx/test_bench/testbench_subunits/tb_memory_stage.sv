//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_memory_stage.sv
// Create : 2020-07-27 15:16:47
// Revise : 2020-08-01 19:06:05
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../memories/005-memory_interfaces.svh"
`include "../003-global_defs.svh"
`define NBIT 32

//automatic for having a clear environment eveyr call of the program 
program automatic test_memory( mem_interface.rw dram_if, 
				output logic select_pc,
				output logic [`NBIT-1:0] alu_output_val,
				output logic dram_enable_cu,
				output logic dram_r_nw_cu,
				input logic[`DRAM_WORD_SIZE-1:0] data_from_memory,
				input logic [`NBIT-1:0]data_from_alu,
				input logic [`IRAM_WORD_SIZE-1:0]new_pc_value_branch
				 );

	default clocking test_clk @ (posedge dram_if.clk);
  	endclocking	// clock

	initial begin  
		dram_enable_cu=0;
		dram_r_nw_cu=1;
		alu_output_val=$urandom();
		$display("@%0dns Starting Program",$time);
   		dram_if.rst=1;
		$display("Starting testbench for Memory stge",);
		## 1;
		$display("Memory reset",);
		dram_if.rst=0;
		##1;
		dram_if.rst=1;
		##2;
		if(data_from_alu!==alu_output_val)begin 
			$display("Data from alu not correctly propagated",);
			$stop();
		end
		select_pc=1;
		##1;
		if(new_pc_value_branch!==data_from_alu)
		begin
			$display("Error in selecting new value of program counter for jump ",);
			$stop();
		end
		select_pc=0;
		##1;
		if(new_pc_value_branch!==4)begin
			$display("Error in selecting the new value of program counter",);
			$stop();
		end
		##1;
		$display("Starting memory accesses",);
		// read
		alu_output_val=1; // it contains the address
		dram_r_nw_cu=1;
		dram_enable_cu=1;
		##2;
		##1;  //this is for loadin in lmd reg
		if(data_from_memory!==251658240)begin
			$display("Error in reading memory",);
			$stop();
		end
		//write 
		dram_r_nw_cu=0;
		alu_output_val=4; // it contains the address
		dram_enable_cu=1;
		##1;
		//read 
		dram_r_nw_cu=1;
		alu_output_val=4; // it contains the address
		dram_enable_cu=1;
		##1;
		##1;  //this is for loadin in lmd reg
		if(data_from_memory!==156)begin
			$display("Error in reading memory",);
			$stop();
		end
		##3;
		dram_enable_cu=0;
		$display("Memory stage has passed the testbench",);
		$finish;
	end

endprogram: test_memory 


module tb_memory_stage ();
	localparam clock_period= 10ns;
	localparam N=`NBIT;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock

  	// signal instantiation 
  
  	logic select_pc;
	logic [`NBIT-1:0] alu_output_val;
	logic dram_r_nw_cu;
	logic dram_ready_cu;
	logic [`DRAM_WORD_SIZE-1:0]data_from_memory;
	logic [`NBIT-1 :0]data_from_alu;
	logic [`IRAM_WORD_SIZE-1:0]new_pc_value_branch;

	logic dram_enable_cu;
	logic [`IRAM_WORD_SIZE-1:0]new_pc_value;
	logic [N-1:0]value_to_mem;

  	//property definitions
  	property generated_address(int min , int max);
  			  		@ (test_clk)
  			dram_if.ENABLE |-> (dram_if.ADDRESS >= min && dram_if.ADDRESS <=max); // when enable is true it implies that the address will be in those boundaries
  	endproperty;

  	property enable_propagate;
  		@ (test_clk)
  		dram_enable_cu |=> dram_if.ENABLE; // it propagates directly to the ram
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
	dram ( .memif(dram_if));


	
	assign value_to_mem=156;
	assign new_pc_value= 4;

	// unit under test
	memory_stage #(.N(N),
				.PC_SIZE(`IRAM_WORD_SIZE))
	uut (
		.clk(dram_if.clk),
		.rst(dram_if.rst),
		//from fetch stage
		.new_pc_value(new_pc_value),
		//to fetch stage
		.new_pc_value_branch(new_pc_value_branch),
		//from execute stage
		.select_pc     (select_pc), 
		.alu_output_val (alu_output_val),
		.value_to_mem   (value_to_mem),
		// to write back stage
		.data_from_memory (data_from_memory),
		.data_from_alu    (data_from_alu),
		// control signals from CU
		.dram_enable_cu (dram_enable_cu),
		.dram_r_nw_cu(dram_r_nw_cu),
		.dram_ready_cu(dram_ready_cu),
		//DRAM INTERFACES 
		.DRAM_ADDRESS      (dram_if.ADDRESS),
		.DRAM_ENABLE       (dram_if.ENABLE),
		.DRAM_READNOTWRITE (dram_if.READNOTWRITE),
		.DRAM_READY        (dram_if.DATA_READY),
		.DRAM_DATA         (dram_if.INOUT_DATA)
	) ;

// test program 
test_memory test_program(.dram_if(dram_if),
			.select_pc(select_pc),
			.alu_output_val(alu_output_val),
			.dram_enable_cu(dram_enable_cu),
			.dram_r_nw_cu(dram_r_nw_cu),
			.data_from_memory(data_from_memory),
			.data_from_alu(data_from_alu),
			.new_pc_value_branch(new_pc_value_branch)
		);

	
endmodule : tb_memory_stage
