//
//					\\\ Sapere Aude ///
//
// ////////////////////////////////////////////////////////////////////////////-
// Copyright (c) 2014-2020 All rights reserved
// ////////////////////////////////////////////////////////////////////////////-
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_decode_stage.sv
// Create : 2020-07-27 15:17:46
// Revise : 2020-07-29 17:53:34
// Editor : sublime text3, tab size (4)
// Description: 
// ////////////////////////////////////////////////////////////////////////////-
`timescale 1ns/1ps
`include "../global_defs.svh"
`define NBIT 32

program automatic test_decode(
						output logic rst,
						output logic [`IRAM_WORD_SIZE-1:0]instruction_reg,
						output logic [`IRAM_WORD_SIZE-1:0]new_prog_counter_val,
						output logic [`NBIT-1:0]update_reg_value,
						output logic enable_rf,
						output logic read_rf_p1,
						output logic read_rf_p2,
						output logic write_rf,
						output logic [5-1:0]address_rf_write,
						output logic [5-1:0]address_rf_read1,
						output logic [5-1:0]address_rf_read2,
						output logic [1:0]compute_sext
						);


	default clocking test_clk @ (posedge dram_if.clk);
  	endclocking	// clock


initial begin



end 


endprogram : test_decode


module tb_decode_stage ();
localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock


  	// signal declaration 
	logic rst;
	logic [`IRAM_WORD_SIZE-1:0]new_prog_counter_val;
	logic [`IRAM_WORD_SIZE-1:0]instruction_reg;
	logic [`NBIT-1:0]val_a;
	logic [`IRAM_WORD_SIZE-1:0]new_prog_counter_val_exe;
	logic [`NBIT-1:0]val_b;
	logic [`NBIT-1:0]val_immediate;
	logic [`NBIT-1:0]update_reg_value;
	logic enable_rf;
	logic read_rf_p1;
	logic read_rf_p2;
	logic write_rf;
	logic [5-1:0]address_rf_write; // # regs is fixed at 32
	logic [5-1:0]address_rf_read1;
	logic [5-1:0]address_rf_read2;
	logic [1:0]compute_sext; // msb is for signed or not 

  	// property definitions


  	// ADDRESS CHECK RANGE for rf

  	// address check range it is the same for the rf and ir


  	// read and output on the same port 

  	// instantiate the uut
  	decode_stage #(
  		.N       (`NBIT) ,
		.RF_REGS (32) , //number of registers in register file component
		.IR_SIZE (`IRAM_WORD_SIZE),  //Instruction register size
		.PC_SIZE (`DRAM_WORD_SIZE)  //Program Counter Size
  		)
  	uut (
  		.clk(clk),
		.rst(rst), // active low
		// from fetch stage
		.new_prog_counter_val(new_prog_counter_val),
		.instruction_reg(instruction_reg),
		// to execute stage
		.val_a(val_a),
		.new_prog_counter_val_exe(new_prog_counter_val_exe),
		.val_b(val_b),
		.val_immediate(val_immediate),
		// from write back stage
		.update_reg_value(update_reg_value),
		// from / to control unit
		.enable_rf(enable_rf),
		.read_rf_p1(read_rf_p1),
		.read_rf_p2(read_rf_p2),
		.write_rf(write_rf),
		.address_rf_write(address_rf_write),
		.address_rf_read1(address_rf_read1),
		.address_rf_read2(address_rf_read2),
		.compute_sext(compute_sext) // signal for computing sign exention of 16bit immediate value
  		);

  	// instanatiate the test_program
  	test_decode test(
  				.rst(rst),
  				.new_prog_counter_val(new_prog_counter_val),
  				.instruction_reg(instruction_reg),
  				.update_reg_value(update_reg_value),
  				.enable_rf(enable_rf),
				.read_rf_p1(read_rf_p1),
				.read_rf_p2(read_rf_p2),
				.write_rf(write_rf),
				.address_rf_write(address_rf_write),
				.address_rf_read1(address_rf_read1),
				.address_rf_read2(address_rf_read2),
				.compute_sext(compute_sext)
  					);



endmodule