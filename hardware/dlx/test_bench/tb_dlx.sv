//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx.sv
// Create : 2020-07-21 19:00:18
// Revise : 2020-08-21 20:02:24
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ns/1ps
`include "./003-global_defs.svh"
`include "./004-implemented_instructions.svh"
`include "./memories/005-memory_interfaces.svh"


program automatic test_dlx_top(input logic clk, output logic rst, input cu_state_t  curr_state,
 						input logic [`IRAM_WORD_SIZE-1:0] current_instruction);


	default clocking test_clk_prog @( posedge clk);
	endclocking
	
	instructions_opcode current_opcode;
	instructions_regtype_opcode current_opcode_func;

  
		// type_t'(x) cast x to type_t
assign	current_opcode=instructions_opcode'(current_instruction[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
assign 	current_opcode_func= (instructions_regtype_opcode'(current_instruction[`OP_CODE_SIZE-1:0]));
    

sequence end_seq;
	@(test_clk_prog)
		(current_instruction==='Z || current_instruction==='x)[*5];
endsequence;


	task automatic print_current_instruction (instructions_opcode opcode, instructions_regtype_opcode func);
		begin 
			if (opcode===i_regtype ) begin 
				$display("current instrution opcode %h --> %s",current_instruction,  enum_wrap_instruction#(instructions_regtype_opcode)::name(func));
			end else begin 
				$display("current instrution %h --> %s",current_instruction,   enum_wrap_instruction#(instructions_opcode)::name(opcode));
			end
		end
	endtask : print_current_instruction


	initial begin 
		$display("@%0dns Starting Test Program in System Verilog",$time);
		$display("Reset",);
		rst=0;
		##3;
		rst=1;
		fork	
			forever begin 
				wait($changed(current_instruction))
				print_current_instruction(current_opcode,current_opcode_func);
				##2;
			end
		join_none
	// wait unti the end of the program in iram
	forever begin 
		wait (end_seq.triggered)
		if(end_seq.triggered) begin 
			$display("Program in IRAM has ended @ %d",$time());
			 $display("Total coverage %e",$get_coverage());
			$finish();
		end else begin 
		##10; // execute 10 more cc
		end 
	end
	end




endprogram : test_dlx_top

module tb_dlx ();
	localparam clock_period= 10ns;
	// it needs the absolute path

	logic rst;
	logic clk;
	logic [$clog2(`CU_STATES)-1:0] curr_state_debug_i;
 	cu_state_t  curr_state_debug;
 	logic [7:0] csr;
 	logic DEBUG_iram_ready_cu;
	logic DEBUG_iram_enable_cu;
	logic DEBUG_signed_notsigned;
	logic DEBUG_compute_sext;
	logic DEBUG_jump_sext;
	logic DEBUG_write_rf;
	logic [1:0]DEBUG_evaluate_branch;
	logic DEBUG_alu_cin;
	logic DEBUG_alu_overflow;
	logic DEBUG_zero_mul_detect;
	logic DEBUG_mul_exeception;
	logic DEBUG_dram_ready_cu;
	logic DEBUG_dram_r_nw_cu;
	logic DEBUG_enable_rf;
	logic DEBUG_read_rf_p1;
	logic DEBUG_read_rf_p2;
	logic DEBUG_rtype_itypen;
	logic DEBUG_update_pc_branch;
	logic DEBUG_dram_enable_cu;
	logic [0:0]DEBUG_sel_val_a;
	logic [0:0]DEBUG_sel_val_b;
	logic [0:0]DEBUG_select_wb;

	assign curr_state_debug=cu_state_t'(curr_state_debug_i);

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_dlx @ (posedge clk);
  	endclocking	// clock

	
	initial begin
		$display("Attention!!",);
		$display("Starting simulated execution of the DLX",);
		$display("Starting an amazing and very fancy testbench in System Verilog",);
	end


`include "./006-property_def.svh"
	//////////////////////////////////////////////////////////////////////////////
	///// instantiate property and coverage groupd defined in property_def.svh ///
	//////////////////////////////////////////////////////////////////////////////
 	instructions_regtype_opcode ireg_instr;
    instructions_opcode imm_instru,jump_instr,lw_instr,sw_instr,b_instr;
    // cast from bit to typedef of instruction 
    always_comb begin : proc_cast   
		// type_t'(x) cast x to type_t
		ireg_instr=instructions_regtype_opcode'(iram_if.DATA[`OP_CODE_SIZE-1:0]);
		imm_instru=instructions_opcode'(iram_if.DATA[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		jump_instr=instructions_opcode'(iram_if.DATA[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		lw_instr=instructions_opcode'(iram_if.DATA[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		sw_instr=instructions_opcode'(iram_if.DATA[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		b_instr=instructions_opcode'(iram_if.DATA[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		
    end        

	

  	// property instantiation  
    instruction_check_property_ireg : cover property (instruction_check_ireg);

    instruction_check_property_i : cover property(instruction_check_i);

    instruction_check_property_jump : cover property(instruction_check_jump);
    
    instruction_check_property_lw : cover property(instruction_check_lw) ;

    instruction_check_property_sw : cover property(instruction_check_sw) ;
			
    instruction_check_property_b : cover property(instruction_check_b) ;
		
    multiplication_stall_check_property : cover property(multiplication_stall) ;

	/////////////////////////////////////
	// instantiate the components ///////
	/////////////////////////////////////

	// Instruction memory
	// instantiate the interface
	mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if (.clk(clk));

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   (`PATH_TO_IMEM),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE/2),
		.DATA_DELAY  (2)) 
		iram
	(.mif(iram_if.ro));



	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (.clk(clk));
	// Data memory
	rwmem #(
		.FILE_PATH     (`PATH_TO_DMEM_FINAL),
		.FILE_PATH_INIT(`PATH_TO_DMEM),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE/2),
		.DATA_DELAY    (2))
	dram ( .memif(dram_if.rw));
	

	//DLX top level entity
	DLX #(
    .IR_SIZE(`IRAM_WORD_SIZE),
    .PC_SIZE(`IRAM_ADDRESS_SIZE)
  ) dlx_uut (
  	// verbose assignmento of the interfaces signals 
  	// Inputs
    .CLK 				(clk),
    .RST 				(rst),
    // Instruction memory interface
    .IRAM_ADDRESS 		(iram_if.ADDRESS),
    .IRAM_ENABLE		(iram_if.ENABLE),
    .IRAM_READY			(iram_if.DATA_READY),
    .IRAM_DATA			(iram_if.DATA),
    // Data memory Interface
    .DRAM_ADDRESS  		(dram_if.ADDRESS),
    .DRAM_ENABLE        (dram_if.ENABLE),
    .DRAM_READNOTWRITE 	(dram_if.READNOTWRITE),
    .DRAM_READY        	(dram_if.DATA_READY),
    .DRAM_DATA     		(dram_if.INOUT_DATA)
    // simulation debug signals
    //synthesis_translate off
    ,
    .STATE_CU			(curr_state_debug_i),
    .csr                (csr),    
    //all the control unit signals
    //used for system verilog verification 
    .DEBUG_iram_ready_cu(DEBUG_iram_ready_cu),
    .DEBUG_iram_enable_cu(DEBUG_iram_enable_cu),
    .DEBUG_signed_notsigned(DEBUG_signed_notsigned),
    .DEBUG_compute_sext(DEBUG_compute_sext),
    .DEBUG_jump_sext(DEBUG_jump_sext),
    .DEBUG_write_rf(DEBUG_write_rf),
    .DEBUG_evaluate_branch(DEBUG_evaluate_branch),
    .DEBUG_alu_cin(DEBUG_alu_cin),
    .DEBUG_alu_overflow(DEBUG_alu_overflow),
    .DEBUG_zero_mul_detect(DEBUG_zero_mul_detect),
    .DEBUG_mul_exeception(DEBUG_mul_exeception),
    .DEBUG_dram_ready_cu(DEBUG_dram_ready_cu),
    .DEBUG_dram_r_nw_cu(DEBUG_dram_r_nw_cu),
    .DEBUG_enable_rf(DEBUG_enable_rf),
    .DEBUG_read_rf_p1(DEBUG_read_rf_p1),
    .DEBUG_read_rf_p2(DEBUG_read_rf_p2),
    .DEBUG_rtype_itypen(DEBUG_rtype_itypen),
	.DEBUG_sel_val_a(DEBUG_sel_val_a),
    .DEBUG_sel_val_b(DEBUG_sel_val_b),
	.DEBUG_update_pc_branch(DEBUG_update_pc_branch),
    .DEBUG_select_wb(DEBUG_select_wb),
    .DEBUG_dram_enable_cu(DEBUG_dram_enable_cu)
    //synthesis_translate on
  );

//assign same reset signal to both interfaces
assign iram_if.rst=rst;
assign dram_if.rst=rst;

 test_dlx_top test_prog(.clk(clk),
 						.rst(rst),
						.curr_state(curr_state_debug),
 						.current_instruction(iram_if.DATA));
endmodule


