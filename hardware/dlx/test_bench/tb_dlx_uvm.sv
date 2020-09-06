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
	mif_ro (.clk(clk));

	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	mif_rw (.clk(clk));

	DEBUG_interface dbg_if ();

	dlx_wrapper uut (.clk(clk),
					.rst   (dbg_if.rst), // active low
					.mif_ro(mif_ro),// memory interface clocked by clk
					.mif_rw(mif_rw),// memory interface clocked by clk
					.dbg_if(dbg_if));


  initial begin
  	// get interfaces
    uvm_config_db#(virtual mem_interface)::set(uvm_root::get(),"*","dbg_if",dbg_if);
    uvm_config_db#(virtual mem_interface)::set(uvm_root::get(),"*","iram_if",mif_ro);
    uvm_config_db#(virtual DEBUG_interface)::set(uvm_root::get(),"*","dram_if",mif_rw);
    $dumpfile("dump.vcd"); $dumpvars;   //enabling the wave dump
  end
   
  initial begin
  	$display("Test is starting....",);
    run_test(); // start the test
    $display("And finished! :D ",);
  end

endmodule

