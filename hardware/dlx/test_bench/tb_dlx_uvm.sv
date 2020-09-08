//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx_uvm.sv
// Create : 2020-30-08 19:00:18
// Revise : 2020-08-21 20:02:24
// Editor : sublime text3, tab size (4)
// Description:  top level test bench for DLX fuctional verification testing 
//						UVM architecture 
// -----------------------------------------------------------------------------

`timescale  1ns/1ps
`include "./003-global_defs.svh"
`include "./004-implemented_instructions.svh"
`include "./memories/005-memory_interfaces.svh"

import uvm_pkg::*;

`include <uvm_macros.svh>
`include <uvm_pkg.sv>

// including uvm classes in a bottom up order
`include "./uvm_class_def/dlx_sequencer.sv"
`include "./uvm_class_def/dlx_driver.sv"
`include "./uvm_class_def/dlx_monitor.sv"
`include "./uvm_class_def/dlx_scoreboard.sv"
`include "./uvm_class_def/dlx_env.sv"
`include "./uvm_class_def/dlx_test.sv"

module tb_dlx_uvm ();
	localparam clock_period= 10ns;
	// it needs the absolute path

	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_dlx @ (posedge clk);
  	endclocking	// clock

	
	initial begin
		$display("Attention!!",);
		$display("Starting simulated execution of the DLX usign UVM architecture",);
	end

	/////////////////////////////////////
	// instantiate the components ///////
	/////////////////////////////////////

	// instantiate the interface
	mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (.clk(clk));

	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (.clk(clk));

	DEBUG_interface dbg_if ();

	dlx_wrapper uut_uuv (.clk(clk),
					.rst   (dbg_if.rst), // active low
					.mif_ro(iram_if),// memory interface clocked by clk
					.mif_rw(dram_if),// memory interface clocked by clk
					.dbg_if(dbg_if));

assign iram_if.DATA= iram_if.ENABLE ? iram_if.DATA_UVM : '0;
assign dram_if.INOUT_DATA= dram_if.ENABLE ? dram_if.INOUT_DATA_UVM : 'z;
	initial begin 
	// set interfaces     
	uvm_config_db#( virtual DEBUG_interface)::set(null,"*","dbg_if",dbg_if);
    uvm_config_db#( virtual mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) )::set(null,"*","iram_if",iram_if);
    uvm_config_db#( virtual mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) )::set(null,"*","dram_if",dram_if);
  	$dumpfile("dump.vcd"); $dumpvars;   //enabling the wave dump
	end 
  initial begin
	$display("Test is starting....",);
    run_test("test"); // start the test
    $display("And finished! :D ",);
   
  end

endmodule

