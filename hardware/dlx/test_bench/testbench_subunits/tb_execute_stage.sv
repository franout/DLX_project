//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_execute_stage.sv
// Create : 2020-07-27 15:17:03
// Revise : 2020-08-18 17:28:00
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
							input logic jump_prediction,
							output logic carry_in,
							input logic overflow,
							input logic zero_mul_detect,
							input logic mul_exeception,
							output logic signed_notsigned
							);
`ifndef  VIVADO_SIM
default clocking test_clk_prog @(posedge clk);
endclocking // test_clk_prog
`endif

task automatic check_overflow(input logic overflow, 
					input logic signed_notsigned,
					input logic[`NUMBIT-1:0] opa, 
					input logic [`NUMBIT-1:0] opb,
					input logic [`NUMBIT-1:0] s);

	automatic logic [`NUMBIT:0]tmp= opa+opb; // automatic i.e. every time the task is called the tmp value is refreshed

	if (signed_notsigned) begin
		if(opa[`NUMBIT-1]!==opb[`NUMBIT-1])begin 
			if(s[`NUMBIT-1]!==opa[`NUMBIT-1])begin 
				if(overflow!==1)begin 
					$display("Overflow signal not correctly generated in signed computation",);
					$stop();
				end
			end
		end 
	end else begin
		if(tmp[`NUMBIT]!==overflow)begin
			$display("Overflow signal not correctly generated in unsigned computation",);
			$stop();
		end
	end 
	
endtask : check_overflow


TYPE_OP_ALU_sv current_operation;
initial begin 
		rst=0;
		opa=0;
		opb=0;
		immediate=0;
		prog_counter=0;
		sel_val_a=0;
		sel_val_b=0;
		evaluate_branch=0;
		carry_in=0;
		signed_notsigned=0;
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
		signed_notsigned=1;
		carry_in=0;
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
			check_overflow(overflow,signed_notsigned,opa,opb,alu_out);
			$stop();
		end
		$display("Checking addition with immediate value",);
		prog_counter=2;
		opb=3;
		signed_notsigned=1;
		carry_in=0;
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
		carry_in=0;
		signed_notsigned=0;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa+opb))begin 
			$display("Alu addition is wrong -> Expected: %d Actual: %d",opa+opb ,alu_out );
			check_overflow(overflow,signed_notsigned,opa,opb,alu_out);
			$stop();
		end
		$display("Checking ALU operations: SUB",);
		opb=3;
		opa=3;
		signed_notsigned=1;
		carry_in=1;
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
			check_overflow(overflow,signed_notsigned,opa,opb,alu_out);
			$stop();
		end
		$display("Checking ALU operations: MUL using pipelined version of boothmultiplier",);
		opb=3;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		alu_operation=current_operation.next();
		current_operation=current_operation.next();
		`ifndef VIVADO_SIM
		##8;
		`else 
			repeat(16)@(posedge clk);
		`endif
		if(alu_out!==(opa*opb))begin 
			$display("Alu MUltiplication is wrong after 8cc -> Expected: %d Actual: %d",opa*opb ,alu_out );
			$stop();
		end
		$display("Checking zero detection of multiplication",);
		opb=0;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##1;
		`else 
			repeat(2)@(posedge clk);
		`endif
		if(zero_mul_detect!==1)begin 
			$display("Alu MUltiplication is wrong ! no zero detected on second operand" );
			$stop();
		end
		$display("Checking zero detection of multiplication",);
		opb=4;
		opa=0;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##1;
		`else 
			repeat(2)@(posedge clk);
		`endif
		if(zero_mul_detect!==1)begin 
			$display("Alu MUltiplication is wrong ! no zero detected on first operand" );
			$stop();
		end
		
		$display("Checking exception detection of multiplication-> operand bigger than 16 bit( upper 16 bits must be zeros)",);
		opb='1;
		opa=3;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##1;
		`else 
			repeat(2)@(posedge clk);
		`endif
		if(zero_mul_detect!==0)begin 
			$display("Alu MUltiplication is wrong ! no exception detected on second operand" );
			$stop();
		end
		opb=4;
		opa='h2;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##1;
		`else 
			repeat(2)@(posedge clk);
		`endif
		if(zero_mul_detect!==0)begin 
			$display("Alu MUltiplication is wrong ! no exception detected on first operand" );
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
		$display("Checking overflow assertion on addition unsigned",);
		opb='1;
		opa=1;
		alu_operation=ADD;
		current_operation=ADD;
		carry_in=0;
		signed_notsigned=0;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa+opb))begin 
			$display("Alu addition is wrong -> Expected: %d Actual: %d",opa+opb ,alu_out );
			check_overflow(overflow,signed_notsigned,opa,opb,alu_out);
			$stop();
		end
		$display("Checking overflow assertion on addition signed",);
		opb='1;
		opa=2147483646;
		carry_in=0;
		signed_notsigned=1;
		sel_val_a=0;
		sel_val_b=0;
		`ifndef VIVADO_SIM
		##2;
		`else 
			repeat(4)@(posedge clk);
		`endif
		if(alu_out!==(opa+opb))begin 
			$display("Alu addition is wrong -> Expected: %d Actual: %d",opa+opb ,alu_out );
			check_overflow(overflow,signed_notsigned,opa,opb,alu_out);
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
	`ifdef VIVADO_SIM
		TYPE_OP_ALU_sv alu_op_type;
	`else 
		wire [3:0] alu_op_type;
	`endif
	wire [`NUMBIT-1:0]alu_output_val;
	wire [0:0] sel_val_a;
	wire [0:0] sel_val_b;       
	wire evaluate_branch;
	logic branch_condition;
	logic [`NUMBIT-1:0] value_to_mem;
	logic [`NUMBIT-1:0]prog_counter_forwaded;
	logic cin, overflow,zero_mul_detect, mul_exeception,signed_notsigned;

  	// property definition
  	property pc_forwarded;
  		@(test_clk)
  			disable iff (!rst ) 
  			$changed(new_prog_counter_val_exe) |-> prog_counter_forwaded;
  	endproperty;

  	property write_value_propagation;
  		@(test_clk)
  			disable iff(!rst  || !sel_val_b) // activate the property only when we need to write to the memory
  			$changed(val_b) |->  $changed(value_to_mem);
  	endproperty;

  	property branch_propagation;
  		@(test_clk)
  			disable iff(!rst || !evaluate_branch)
  			$changed(val_a) |-> branch_condition;
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
			.signed_notsigned(signed_notsigned),
			.cin(cin) ,
			.overflow(overflow),
			.zero_mul_detect(zero_mul_detect) ,
    		.mul_exeception(mul_exeception)  ,
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
					.jump_prediction(branch_condition),
					.signed_notsigned(signed_notsigned),
					.carry_in(cin) ,
					.overflow(overflow),
					.zero_mul_detect(zero_mul_detect) ,
		    		.mul_exeception(mul_exeception)  
					);

// TODO upgrate to test signed unsigned operation and all the other arithmetic operation 
// including the pipelined boothmultiplier (8cc of latency)

endmodule
