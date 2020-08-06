//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_execute_stage.sv
// Create : 2020-07-27 15:17:03
// Revise : 2020-08-06 20:41:08
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "../003-global_defs.svh"


// input val are implicit
program automatic test_execute(logic clk, 
							output logic rst,
							output logic [`NUMBIT-1:0]opa,
							output logic [`NUMBIT-1:0]opb,
							output logic [`NUMBIT-1:0]immediate,
							output logic [`IRAM_WORD_SIZE-1:0]prog_counter,
							output TYPE_OP_sv alu_operation,
							input logic [`NUMBIT-1:0]alu_out,
							output logic [0:0] sel_val_a,
							output logic [0:0] sel_val_b,
							output logic  evaluate_branch
							);

default clocking test_clk_prog @(posedge clk);
endclocking // test_clk_prog


initial begin 
		rst=0;
		$display("@%0dns Starting Program",$time);
		$display("Starting testbench for Execute stage",);
		##1;
		$display("Reset",);
		rst=0;
		##2;
		$display("Checking PC increment",);
		prog_counter=1;
		opa=0;
		opb=3;
		sel_val_a=1;
		sel_val_b=0;
		##1;
		if(alu_out!==4) begin 
			$display("error in pc increment");
			$stop();
		end
		$display("Checking addition with immediate value",);
		prog_counter=2;
		opb=3;
		immediate=5;
		sel_val_a=0;
		sel_val_b=1;
		##1;
		if(alu_out!==5) begin 
			$display("error in addition with immediate");
			$stop();
		end
		$display("Checking zero condition for branch jump evalutation",);

		$display("Checking ALU operations: ADD",);
		$display("Checking ALU operations: SUB",);
		$display("Checking ALU operations: MUL",);
		$display("Checking ALU operations: BITAND",);
		$display("Checking ALU operations: BITOR",);
		$display("Checking ALU operations: BITXOR",);
		$display("Checking ALU operations: FYNCLSL",);
		$display("Checking ALU operations: FUNCLSR",);

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
	wire [`NUMBIT-1:0]opa;
	wire [`NUMBIT-1:0]opb;
	wire [`NUMBIT-1:0]immediate;
	wire [`IRAM_WORD_SIZE-1:0]prog_counter;
	TYPE_OP_sv alu_operation;
	wire [`NUMBIT-1:0]alu_output_va;
	wire [0:0] sel_val_a;
	wire [0:0] sel_val_b;       
	wire evaluate_branch;
		

  	// property definition
  	property pc_forwarded;
  		@(test_clk)
  			disable iff (!rst)
  			$changed(new_prog_counter_val_exe) |-> $changed(prog_counter_forwaded);
  	endproperty;

  	property write_value_propagation;
  		@(test_clk)
  			disable iff(!rst  || !sel_val_b) // activate the property only when we need to write to the memory
  			$changed(val_b) |->  $changed(value_to_mem);
  	endproperty;

  	property branch_propagation;
  		@(test_clk)
  			disable iff(!rst || !evaluate_branch)
  			$changed(val_a) |-> $changed(branch_condition);
  	endproperty;	
  	// properrty instantiation
	pc_forwarded_check: assert property (pc_forwarded) else $display("Error in propagation of PC value @%0dns",$time());
	write_value_propagation_check: assert property (write_value_propagation) else $display("Error in propagation of value to write to memory @%0dns",$time());
	branch_propagation_check: assert property (branch_propagation) else $display("Error in propagating the branch decision @%0dns",$time());

	// unit under test
	execute_stage #(
		.N(`NUMBIT),
		.PC_SIZE(`IRAM_WORD_SIZE)
		) uut (
			.clk(clk),
			.rst(rst),
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
	
	test_execute test(
					.clk(clk),
					.rst(rst),
					.opa(val_a),
					.opb(val_b),
					.immediate(val_immediate),
					.prog_counter(new_prog_counter_val_exe),
					.alu_out(alu_output_val),
					.alu_operation(alu_op_type),
					.sel_val_a(sel_val_a),       
					.sel_val_b(sel_val_b),       
					.evaluate_branch(evaluate_branch)
					);
endmodule
