//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_datapath.sv
// Create : 2020-07-27 15:16:24
// Revise : 2020-07-31 23:25:40
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../global_defs.svh"

program test_datapath();

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


  	// unit under test

endmodule