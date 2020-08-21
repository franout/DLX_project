//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_cu.sv
// Create : 2020-07-27 15:16:34
// Revise : 2020-08-11 00:01:51
// Editor : sublime text3, tab size (4)
// Description:  trivial test bench for checking the synchronization of comand signals
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../003-global_defs.svh"
`include "../004-implemented_instructions.svh"


program automatic test_prog (input logic clk, output logic rst,
                             output logic[`IRAM_WORD_SIZE-1:0] instruction_to_cu);

	`ifndef  VIVADO_SIM
	default clocking test_clk_prog @( posedge clk);
	endclocking 
	`endif
instructions_opcode current_opcode;
instructions_regtype_opcode current_opcode_alu_fun;

integer rs1,rs2,rd;

initial begin 
		$display("@%0dns Starting Program",$time);
        rs1=0;
        rs2=0;
        rd=0;
		$display("Starting testbench for Control unit",);
		rst=1;
		`ifndef  VIVADO_SIM
		##1;
		`else 
		repeat(2)@ (posedge clk);
		`endif
		$display("Reset",);
		rst=0;
		`ifndef  VIVADO_SIM
		##1;
		`else 
		repeat(2)@ (posedge clk);
		`endif
        //initialize seed for random register
        $urandom_range(0,31);
        current_opcode=instructions_opcode.first();
        $display("Looping over all instructions",);
        for (; current_opcode !== instructions_opcode.last(); ) begin
            
            if(current_opcode===i_regtype)begin 
                $display("Looping over all regtype instructions",);
                current_opcode_alu_fun=instructions_regtype_opcode.first();
                rs1=$urandom();
                rs2=$urandom();
                rd=$urandom();
                // compose instruction 
                // opcode
                instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]='0;
                // registers
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-5]=rs1;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-5-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-10]=rs2;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-10-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-15]=rd;
                for (;current_opcode_alu_fun!==instructions_regtype_opcode.last() ; ) begin
                        //alu function
                        instruction_to_cu[`FUNC_SIZE-1:0]={5'd0,current_opcode_alu_fun};
                        `ifndef  VIVADO_SIM
                        ##5;
                        `else 
                        repeat(10)@ (posedge clk);
                        `endif
                    current_opcode_alu_fun=current_opcode_alu_fun.next();
                end
                // execute last instruction
                instruction_to_cu[`FUNC_SIZE-1:0]={5'd0,current_opcode_alu_fun};
                `ifndef  VIVADO_SIM
                ##5;
                `else 
                repeat(10)@ (posedge clk);
                `endif
            end else if(current_opcode===i_j || current_opcode===i_jal) begin  // jump type
                instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]=current_opcode;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:0]= $urandom_range(0,2**26-1);
                $urandom_range(0,31); // restore register randomization range
                `ifndef  VIVADO_SIM
                ##5;
                `else 
                repeat(10)@ (posedge clk);
                `endif
            end else begin // itype 
                instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]=current_opcode;
                // registers
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-5]=rs1;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-5-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-10]=rd;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-10:0]=$urandom_range(0,2**16-1);
                $urandom_range(0,31); // restore register randomization range
                `ifndef  VIVADO_SIM
                ##5;
                `else 
                repeat(10)@ (posedge clk);
                `endif
            end ;
            current_opcode=current_opcode.next(); //update instruction
        end
        // execute last instruction 
        if(current_opcode===i_j || current_opcode===i_jal) begin  // jump type
            instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]=current_opcode;
            instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:0]= $urandom_range(0,2**26-1);
            $urandom_range(0,31); // restore register randomization range
            `ifndef  VIVADO_SIM
            ##5;
            `else 
            repeat(10)@ (posedge clk);
            `endif
        end else begin // itype 
            instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]=current_opcode;
            // registers
            instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-5]=rs1;
            instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-5-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-10]=rd;
            instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-10:0]=$urandom_range(0,2**16-1);
            $urandom_range(0,31); // restore register randomization range
            `ifndef  VIVADO_SIM
            ##5;
            `else 
            repeat(10)@ (posedge clk);
            `endif
        end ;


		`ifndef  VIVADO_SIM
		##1;
		`else 
		repeat(2)@ (posedge clk);
		`endif
		$display("Control unit has passed the testbench",);
		$finish;
end

endprogram : test_prog

module tb_cu ();
localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock


    logic  rst;
    logic iram_enable_cu;
    logic iram_ready_cu;
    logic curr_instruction_to_cu;
    logic enable_rf;
    logic read_rf_p1;
    logic read_rf_p2;
    logic write_rf;
    logic rtype_itypen_i;
    logic compute_sext;
    logic alu_op_type;
    logic sel_val_a;
    logic sel_val_b;
    logic alu_cin;
    logic alu_overflow;
    logic evaluate_branch;
    logic zero_mul_detect;
    logic mul_exeception;
    logic dram_enable_cu;
    logic dram_r_nw_cu;
    logic dram_ready_cu;
    logic select_wb;
  	logic [$clog2(`CU_STATES)-1:0]STATE_CU;
    logic [7:0] csr;
  	// property definition
  /*  property check_logic_mul_exception;

    endproperty check_logic_mul_exception;


    property multiplication_stall;

    endproperty multiplication_stall;



    sequence ireg_decode;

    endsequence ireg_decode;

    sequence ireg_execute;

    endsequence ireg_execute;

    sequence ireg_memory;

    endsequence ireg_memory;

    sequence ireg_wb;

    endsequence ireg_wb;

    property ireg_type_instruction;
        @(test_clk)
        disable iff (!rst || curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==0)
           $changed(curr_instruction_to_cu) |-> (ireg_decode && ##1 ireg_execute && ##1 ireg_memory && ## 1 ireg_wb);
    endproperty;

*/
  	// property instantiation

  	// unit under test instantiation
  control_unit  #(
    .PC_SIZE      (`IRAM_ADDRESS_SIZE),
    .RF_REGS      (`RF_REGS), // number of register in register file
    .FUNC_SIZE    (`FUNC_SIZE), // Func Field Size for R-Type Ops
    .OP_CODE_SIZE (`OP_CODE_SIZE), // Op Code Size
    .IR_SIZE      (`IRAM_WORD_SIZE), // Instruction Register Size    
    .CW_SIZE      (`TOT_CU_SIGN)  // Control Word Size
  ) uut 
   (
    .clk(clk),
    .rst(rst),
    // for fetch stage
    .iram_enable_cu(iram_enable_cu), // out 
    .iram_ready_cu(iram_ready_cu), // in 
    .curr_instruction_to_cu(curr_instruction_to_cu), // in 
    // for decode stage
    .enable_rf(enable_rf), //out
    .read_rf_p1(read_rf_p1), //out
    .read_rf_p2(read_rf_p2), //out
    .write_rf(write_rf), //out
    .rtype_itypen_i(rtype_itypen_i), //out
    .compute_sext(compute_sext), //out
    // for execute stage
    .alu_op_type(alu_op_type), //TYPE_OP_ALU ; for compatibility with sv // out
    .sel_val_a(sel_val_a),  // out 
    .sel_val_b(sel_val_b), // out 
    // from execute stage
    .alu_cin(alu_cin), // in 
    .alu_overflow(alu_overflow), // out 
    .evaluate_branch(evaluate_branch), // in 
    // exception control logic for multiplication 
    .zero_mul_detect(zero_mul_detect),//in
    .mul_exeception(mul_exeception),//in
    // for memory stage
    .dram_enable_cu(dram_enable_cu), // out
    .dram_r_nw_cu(dram_r_nw_cu), // out
    .dram_ready_cu(dram_ready_cu), // in 
    // for write back stage   
    .select_wb(select_wb)  // out 
    // simulation debug signals
    //synthesis_translate off
    ,
    .STATE_CU(STATE_CU),
    .csr(csr)
    //synthesis_translate on
  );


  	test_prog test_control_unit(
  					.clk(clk),
  					.rst(rst),
            .instruction_to_cu(curr_instruction_to_cu)
  					);


endmodule