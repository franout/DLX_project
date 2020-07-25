//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_writeback_stage.sv
// Create : 2020-07-25 15:02:48
// Revise : 2020-07-25 15:42:50
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ns/1ps


module tb_writeback_stage ();
	localparam clock_period= 10ns;
	localparam N= 32;
	logic clk;
	logic [N-1:0]data_from_memory;
	logic [N-1:0]data_from_alu;
	logic [N-1:0]data_to_rf;
	logic [1:0]select_wb;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking ram_clk @ (posedge clk);	
  	endclocking	// clock



write_back_stage #(.N(N)) uut (
	.data_from_memory(data_from_memory),
	.data_from_alu(data_from_alu),
	.data_to_rf(data_to_rf),
	.select_wb(select_wb));



	initial begin 
	$display("Startign testbench for write back stage",);


	$finish();
	end 


endmodule : tb_writeback_stage