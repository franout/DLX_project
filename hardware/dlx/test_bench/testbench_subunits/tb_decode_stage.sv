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


program automatic test_decode();


	default clocking test_clk @ (posedge dram_if.clk);
  	endclocking	// clock


initial begin : body



end : body 


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

  	// property definitions




  	// instantiate the uut
  	decode_stage #(
  		.N       () 
		.RF_REGS ()  //number of registers in register file component
		.IR_SIZE ()  //Instruction register size
		.PC_SIZE ()  //Program Counter Size
  		)
  	uut (
  		.clk(),
		.rst(), // active low
		// from fetch stage
		.new_prog_counter_val(),
		.instrucntion_reg(),
		// to execute stage
		.val_a(),
		.new_prog_counter_val_exe(),
		.val_b(),
		.val_immediate(),
		// from write back stage
		.update_reg_value()
		// from / to control unit
		.enable_rf(),
		.read_rf_p1(),
		.read_rf_p1(),
		.write_rf(),
		.address_rf_write(),
		.address_rf_read1(),
		.address_rf_read2(),
		.compute_sext() // signal for computing sign exention of 16bit immediate value
  		);

  	// instanatiate the test_program
  	test_decode test();



endmodule