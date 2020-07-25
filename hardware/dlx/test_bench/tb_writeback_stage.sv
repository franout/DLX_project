//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_writeback_stage.sv
// Create : 2020-07-25 15:02:48
// Revise : 2020-07-25 18:15:44
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
	logic [0:0]select_wb;

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
	repeat(2)@posedge clk;
	data_from_memory={N{'b0}};
	data_from_alu={N{'b1}};
	select_wb='b0;
	repeat(2)@posedge clk;
	if(data_to_rf!=data_from_memory) begin
		$display("Error in mux ",);
		$stop();
	end
	
	repeat(2)@ posedge clk;
	$display("Checking if it is still the same",);
	if(data_to_rf!=data_from_memory) begin
		$display("Error in mux ",);
		$stop();
	end
	select_wb='b1;
	repeat(2)@posedge clk;
	if(data_to_rf!=data_from_alu) begin
		$display("Error in mux not equal to the data from alu ",);
		$stop();
	end
	$display("Check if it is still the same",);
	repeat(2)@posedge clk;
	if(data_to_rf!=data_from_alu) begin
		$display("Error in mux not equal to the data from alu ",);
		$stop();
	end
	$finish();
	end 


endmodule : tb_writeback_stage
