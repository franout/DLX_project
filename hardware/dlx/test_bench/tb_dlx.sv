//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx.sv
// Create : 2020-07-21 19:00:18
// Revise : 2020-07-26 18:51:14
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ns/1ps
`include "implemented_instructions.svh"
`include "memory_interfaces.svh"

`define  IRAM_WORD_SIZE 32
`define  IRAM_ADDRESS_SIZE 32
`define  DRAM_WORD_SIZE 32
`define  DRAM_ADDRESS_SIZE 32

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
		$display("Starting a very fancy testbench in System Verilog",);
		// the monitor process for the instruction will end the simulation as soon as it finds the halt instruction
	end
	/////////////////////////////////////
	// instantiate the components ///////
	/////////////////////////////////////

	// Instruction memory
	// instantiate the interface
	romem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (clk);

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   (PATH_TO_IMEM),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.DATA_DELAY  (2)) 
		iram
	(.mif(iram_if));
	

	rwmem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
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
    .PC_SIZE(`DRAM_WORD_SIZE)
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
    .STATE_CU			()
    //synthesis_translate on
  );

//TODO  a task or a monitor which understand the current operation that is going to be executed and compare with the implemented_instructions.svh
// and choose the property and assertion accordingly


	// check process for the instructions
	// use monitor

	// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_dlx.fsdb");
			$fsdbDumpvars(0, "tb_dlx", "+mda", "+functions");
		end
	end


endmodule



//////////////////////
/////// sv hint //////
//////////////////////


/*synthesizable*/
/*
interface example ();
logic banan;

modport random (output banan);
endinterface

// normally instantiated inside interfaces
clocking ran clk_event:
item list;
  endclocking ran

clocking bus @(posedge clk);
  parameter INPUT_SKEW=1;
  default inoo #10;
  input #3 banan;
  endclocking

  // program block simimlat to a module for solving race condition
  program
    helloWorld();
    initial
    begin: hello
      $display("helloWorld",);
    end

    initial
    begin: there
      $display("hello there",);
    end 
  endprogram: helloWorld

sequence d (data,en);
  (!en) #1 data=0;
endsequence

// if start match execture the next
// with |=> evaluation start in next cc otherwise it is overlapped
property p1;
  @(posedge clk) disable iff(!active)
  start |-> request ##2 (grant==1);
endproperty

  assert property (p1); // property can be concatenated with logical operators 
// inside property first_match , within and throughout
//also if then else in property


// there can be local variable and fucntion calls in property
//$rose  1 -> , $fell 0->  // used when the changes happen between 2 clock events
// $stable , $past for sample in the past


// ## number of sample edges or delay ##[1:5] it can be checkef for the next 4cc
// $ -> infinite number of cycles
// [*3] sequence of 3 events must be true for 3 consecutive cc
// [=3] sequence of 3 event which can be non consecutive [=3:5] min 3 max 4
*/
