//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_memories.sv
// Create : 2020-07-22 20:19:53
// Revise : 2020-07-26 18:53:55
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale 1ns/1ps


`define  IRAM_WORD_SIZE 32
`define  IRAM_ADDRESS_SIZE 32
`define  DRAM_WORD_SIZE 32
`define  DRAM_ADDRESS_SIZE 32

`include "memory_interfaces.svh"

/* in memory_interfaces.svh
interface mem_interface
	#(parameter ADDRESS_SIZE=16,
	WORD_SIZE=32)
	 ( input logic clk);

 	 logic rst;  //  reset active low
 	 logic  [ADDRESS_SIZE-1:0] ADDRESS;
	 logic  ENABLE;
	 logic  DATA_READY;
	 logic  [WORD_SIZE-1:0]DATA;
	 logic  READNOTWRITE;
	 wire [WORD_SIZE-1:0] INOUT_DATA;

    clocking ram_interface @(posedge clk);
       input   #1  ADDRESS,ENABLE; // sampled after 1 time resoltuon see `timescale
       output  #1  DATA_READY,DATA;
    endclocking

modport rw (input ADDRESS, ENABLE, READNOTWRITE,rst,clk,inout INOUT_DATA, output DATA_READY); // read write memory interface
modport ro (input ADDRESS, ENABLE, rst,clk , output DATA_READY, DATA); // read only memory interface

endinterface
*/

program test_memory(mem_interface iram_if , mem_interface dram_if);

initial begin
      	$monitor("@%0dns Starting Program",$time);
      	iram_if.rst='1;
		dram_if.rst='1;
		$display("Starting testbench for memories",);
		## 1;
		$display("Memory reset",);
		iram_if.rst='0;
		dram_if.rst='0;
		$display("Reading file for Read-Only memory",);
		iram_if.ENABLE='1;
		for (i=0;i<11;i=i+1)begin
			iram_if.ADDRESS=i;
			##1;
			if(iram_if.DATA==='x) begin
				$display("Read operation n %d on romem is wrong",i);
				$stop();
			end
			// ready signal is checked by the property
		end
		iram_if.ENABLE='0;
		## 2; // same of repeat(2)@(posdege clk);
		$display("Read-Only Memory passed the testbench",);
		$display("Starting test of read and write memory",);
		// read operations
		dram_if.READNOTWRITE='1;
		dram_if.ENABLE='1;
		// opening the same file of the other memory
		for (i=0;i<11;i=i+1)begin
			dram_if.ADDRESS=i;
			##1;
			if(dram_if.INOUT_DATA==='x) begin
				$display("Read operation n %d on romem is wrong",i);
				$stop();
			end
			// ready signal is checked by the property
		end
		// write operations
		dram_if.READNOTWRITE='0;
		dram_if.ENABLE='1;
		for (i=0;i<11;i=i+1)begin
			dram_if.ADDRESS=i;
			dram_if.INOUT_DATA=i;
			##1;
			// ready signal is checked by the property
		end
		// read operations
		dram_if.READNOTWRITE='1;
		dram_if.ENABLE='1;
		// opening the same file of the other memory
		for (i=0;i<11;i=i+1)begin
			dram_if.ADDRESS=i;
			##1;
			if(dram_if.INOUT_DATA!=='i) begin
				$display("Read operation n %d on romem is wrong",i);
				$stop();
			end
			// ready signal is checked by the property
		end
		// read again 
		#100  $display("%0dns Terminating simulation", $time);
		$finish();
    end
endprogram: test_memory


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
  			iram_if.ENABLE |-> (iram_if.ADDRESS >= min && iram_if.ADDRESS <=max);
  	endproperty 

  	// sequence
  	property ready_check;
  		iram_if.ENABLE ##1 iram_if.DATA_READY ;
  	endproperty

  	//=================================================
 	// Assertion Directive Layer
  	//=================================================
  	/* assert : if the property holds correctly
  		assume : it specifies the property as an assumption for verification  useful for verification tools 
  		cover: it monitors the propertty for the sake of coverage 
  	*/
  	ready_check_property : assert property (ready_check);
  	address_range_check_property : assert property (address_range);

	// instantiate the interface
	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (clk);

	romem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (clk);

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.DATA_DELAY  (2)) 
		iram_uut
	(.mif(iram_if.ro));
		
	rwmem #(
		.FILE_PATH     ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"), // it should update the existing file
		.FILE_PATH_INIT("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE),
		.DATA_DELAY    (2))
	dram_uut ( .memif(dram_if.rw));


// instantiate the program for testing the memories
test_memory test_ram(
		.iram_if(iram_if),
		.dram_if(dram_if));



endmodule


