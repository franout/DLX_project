//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_execute_stage.sv
// Create : 2020-07-27 15:17:03
// Revise : 2020-08-09 17:06:13
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "../003-global_defs.svh"


// input val are implicit
program automatic test_execute(input logic clk, 
							output logic rst,
							output logic [`NUMBIT-1:0]opa,
							output logic [`NUMBIT-1:0]opb,
							output logic [`NUMBIT-1:0]immediate,
							output logic [`IRAM_WORD_SIZE-1:0]prog_counter,
							output TYPE_OP_ALU_sv alu_operation, // automatic type
							input logic [`NUMBIT-1:0]alu_out,
							output logic [0:0] sel_val_a,
							output logic [0:0] sel_val_b,
							output logic  evaluate_branch,
							input logic jump_prediction
							);
`ifndef  VIVADO_SIM
default clocking test_clk_prog @(posedge clk);
endclocking // test_clk_prog
`endif

TYPE_OP_ALU_sv current_operation;

initial begin 
		rst=0;
		current_operation.first();
		$display("@%0dns Starting Program",$time);
		$display("Starting testbench for Execute stage",);
		`ifndef VIVADO_SIM
			##1;
		`else 
			repeat(2)@(posedge clk);
		`endif
		$display("Reset",);
		rst=0;
		`ifndef VIVADO_SIM
			##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		$display("Checking PC increment",);
		rst=1;
		prog_counter=1;
		opa=0;
		opb=3;
		sel_val_a=1;
		sel_val_b=0;
		`ifndef VIVADO_SIM
			##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
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
		`ifndef VIVADO_SIM
			##1;
		`else 
			repeat(2)@(posedge clk);
		`endif	
		if(alu_out!==5) begin 
			$display("error in addition with immediate");
			$stop();
		end
		$display("Checking zero condition for branch jump evalutation",);
		opa=0;
		evaluate_branch=1;
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(jump_prediction!==1)begin 
			$display("Error in check zero logic-> TRuE",);
			$stop();
		end
		opa=321;
		evaluate_branch=1;
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(jump_prediction!==0)begin 
			$display("Error in check zero logic-> False",);
			$stop();
		end
		evaluate_branch=0;
		$display("Checking ALU operations: ADD",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa+opb))begin 
			$display("Alu addition is wrong -> Expected: %d Actual: %d",opa+opb ,alu_out );
			$stop();
		end
		$display("Checking ALU operations: SUB",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa-opb))begin 
			$display("Alu subtraction is wrong -> Expected: %d Actual: %d",opa-opb ,alu_out );

			$stop();
		end
		$display("Checking ALU operations: MUL",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa*opb))begin 
			$display("Alu MUltiplication is wrong -> Expected: %d Actual: %d",opa*opb ,alu_out );
			$stop();
		end
		$display("Checking ALU operations: BITAND",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa&opb))begin 
			$display("Alu And is wrong -> Expected: %d Actual: %d",opa&opb ,alu_out );

			$stop();
		end
		$display("Checking ALU operations: BITOR",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa|opb))begin 
			$display("Alu Or is wrong -> Expected: %d Actual: %d",opa|opb ,alu_out );

			$stop();
		end
		$display("Checking ALU operations: BITXOR",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa^opb))begin 
			$display("Alu Exor is wrong -> Expected: %d Actual: %d",opa^opb ,alu_out );

			$stop();
		end
		$display("Checking ALU operations: FUNCLSL",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa<<opb))begin 
			$display("Alu shift left is wrong -> Expected: %d Actual: %d",opa<<opb ,alu_out );
			$stop();
		end
		$display("Checking ALU operations: FUNCLSR",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa>>opb))begin 
			$display("Alu Shift right is wrong -> Expected: %d Actual: %d",opa>>opb ,alu_out );

			$stop();
		end
			$display("Checking ALU operations: FUNCRL",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa<<opb))begin 
			$display("Alu rotate left is wrong -> Expected: %d Actual: %d",opa<<opb ,alu_out );

			$stop();
		end
		$display("Checking ALU operations: FUNCRR",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==('h60000000))begin 
			$display("Alu rotate right is wrong -> Expected: %d Actual: %d",opa>>opb ,alu_out );

			$stop();
		end
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
	wire [`NUMBIT-1:0]val_a ,val_b;
	wire [`NUMBIT-1:0]val_immediate;
	wire [`IRAM_WORD_SIZE-1:0]new_prog_counter_val_exe;
	TYPE_OP_ALU_sv alu_op_type;
	wire [`NUMBIT-1:0]alu_output_val;
	wire [0:0] sel_val_a;
	wire [0:0] sel_val_b;       
	wire evaluate_branch;
	logic branch_condition;
	logic [`NUMBIT-1:0] value_to_mem;
	logic [`NUMBIT-1:0]prog_counter_forwaded;


  	// property definition
  	property pc_forwarded;
  		@(test_clk)
  			disable iff (!rst && !sel_val_a) // not a jump addition 
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
			/*add check for cin and overflow TODO*/      
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
					.evaluate_branch(evaluate_branch),
					.jump_prediction(branch_condition)
					);



endmodule
