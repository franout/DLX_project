//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_execute_stage.sv
// Create : 2020-07-27 15:17:03
// Revise : 2020-08-01 22:42:59
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "../003-global_defs.svh"

program test_execute(logic clk, logic rst);


initial begin 
		$display("@%0dns Starting Program",$time);
		$display("Starting testbench for Execute stge",);




		##1;
		$display("Execute stage has passed the testbench",);
		$finish;
end

endprogram : test_execute

module tb_execute_stage();
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


  	// property definition



  	// properrty instantiation




// unit under test
execute_stage #(
	.N(),
	.PC_SIZE()
	) uut (
		.clk(),
		.rst(),
		// from decode stage
		.val_a(val_a),
		.val_b(val_b),
		.val_immediate(val_immediate),
		.new_prog_counter_val_exe(new_prog_counter_val_exe),
		// to memory stage
		.branch_condition(branch_condition),
		.prog_counter_forwaded(prog_counter_forwaded),
		.alu_output_val(alu_output_val),
		.value_to_mem(value_to_mem),
		// to/from control unit
		.alu_op_type(alu_op_type),   
		.sel_val_a(sel_val_a),       
		.sel_val_b(sel_val_b),       
		.evaluate_branch(evaluate_branch) 
	);

test_execute test(.clk(clk),.rst(rst));
endmodule