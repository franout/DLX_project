//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_general_alu.sv
// Create : 2020-08-12 23:08:04
// Revise : 2020-08-12 23:23:41
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../..003-global_defs.svh"


program automatic test_alu(input logic clk);

	`ifndef  VIVADO_SIM
	default clocking test_clk_prog @( posedge clk);
	endclocking 
	`endif

	initial begin 
		$display("@%0dns Starting Program",$time);
		$display("Starting testbench for general ALU",);


		`ifndef  VIVADO_SIM
		##1;
		`else 
		repeat(2)@ (posedge clk);
		`endif
		$display("General alu passed the testbench",);
		$finish;
	end

endprogram : test_alu

module tb_general_alu ();

localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock
  	

  	logic [`NUMBIT-1:0] a,b,output_val;
  	logic cin,overflow;




general_alu #(.N(`NUMBIT)) uut 
(   FUNC : IN TYPE_OP_ALU; 
	.DATA1(a),
	.DATA2(b),
    .cin(cin),
    .overflow(overflow),
    .OUTALU(output_val)
    );

test_alu test (.clk(clk),);

endmodule : tb_general_alu