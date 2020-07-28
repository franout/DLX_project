//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_cu.sv
// Create : 2020-07-27 15:16:34
// Revise : 2020-07-28 15:37:26
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../global_defs.svh"


module tb_cu ();
localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock

endmodule