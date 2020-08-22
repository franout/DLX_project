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
    logic [`IRAM_WORD_SIZE-1:0]curr_instruction_to_cu;
    logic enable_rf;
    logic read_rf_p1;
    logic read_rf_p2;
    logic write_rf;
    logic rtype_itypen_i;
    logic compute_sext;
    wire [3:0]alu_op_type;
    logic sel_val_a;
    logic sel_val_b;
    logic alu_cin;
    logic alu_overflow;
    logic [1:0]evaluate_branch;
    logic zero_mul_detect;
    logic mul_exeception;
    logic dram_enable_cu;
    logic dram_r_nw_cu;
    logic dram_ready_cu;
    logic [0:0]select_wb;

  	logic [$clog2(`CU_STATES)-1:0]STATE_CU;
    logic [7:0] csr;

    assign iram_ready_cu=1;
    assign dram_ready_cu=1;

  	// property definition
    property multiplication_stall;
        @(test_clk)
            disable iff(!rst || !zero_mul_detect || !mul_exeception )
               alu_op_type==MULT |-> !iram_enable_cu[*6];// no fetching for 6 cc
    endproperty multiplication_stall;

  /* sequence for reg type instructions*/
    sequence ireg_decode;
        ##1  enable_rf && read_rf_p1 && read_rf_p2 && rtype_itypen_i && !compute_sext;
    endsequence ireg_decode;

    sequence ireg_execute;
        ##1 !sel_val_a(0) && !sel_val_b(0) && !alu_cin && !evaluate_branch(1) && !evaluate_branch(0) && signed_notsigned ;
    endsequence ireg_execute;

    sequence ireg_memory;
        ##1 !dram_enable_cu ;
    endsequence ireg_memory;

    sequence ireg_wb;
        ##1 write_rf && select_wb(0);
    endsequence ireg_wb;
/*sequence for immediate instruction */
    sequence itype_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext;
    endsequence ireg_decode;

    sequence itype_execute;
        ##1 !sel_val_a(0) && sel_val_b(0) && !alu_cin && !evaluate_branch(1) && !evaluate_branch(0) && signed_notsigned ;
    endsequence ireg_execute;

    sequence itype_memory;
        ##1 !dram_enable_cu ;
    endsequence ireg_memory;

    sequence itype_wb;
        ##1 write_rf && select_wb(0);
    endsequence ireg_wb;
/*sequnce for lw*/
    sequence lw_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext;
    endsequence ireg_decode;

    sequence lw_execute;
        ##1 sel_val_a(0) && sel_val_b(0) && !alu_cin && !evaluate_branch(1) && !evaluate_branch(0) && signed_notsigned ;
    endsequence ireg_execute;

    sequence lw_memory;
        ##1 dram_enable_cu  && dram_r_nw_cu;
    endsequence ireg_memory;

    sequence lw_wb;
        ##1 write_rf && !select_wb(0);
    endsequence ireg_wb;

/*sequnce for sw*/
    sequence sw_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext;
    endsequence ireg_decode;

    sequence sw_execute;
        ##1 sel_val_a(0) && sel_val_b(0) && !alu_cin && !evaluate_branch(1) && !evaluate_branch(0) && signed_notsigned ;
    endsequence ireg_execute;

    sequence sw_memory;
        ##1 dram_enable_cu  && !dram_r_nw_cu;
    endsequence ireg_memory;

    sequence sw_wb;
        ##1 !write_rf ;
    endsequence ireg_wb;

/*sequnce for b*/
    sequence b_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && !compute_sext;
    endsequence ireg_decode;

    sequence b_execute(type_b);
        if(type_b===i_beqz)
            ##1 sel_val_a(0) && sel_val_b(0) && !alu_cin && !evaluate_branch(1) && evaluate_branch(0) && signed_notsigned ;
        else // i_benz
            ##1 sel_val_a(0) && sel_val_b(0) && !alu_cin && evaluate_branch(1) && !evaluate_branch(0) && signed_notsigned ;
    endsequence ireg_execute;

    sequence b_memory;
        ##1 !dram_enable_cu  ;
    endsequence ireg_memory;

    sequence b_wb;
        ##1 !write_rf ;
    endsequence ireg_wb;
 /*sequence for jump instruction*/
    sequence ijump_decode;
        ##1  enable_rf && !read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext;
    endsequence ireg_decode;

    sequence ijump_execute;
        ##1 sel_val_a(0) && sel_val_b(0) && !alu_cin && !evaluate_branch(1) && !evaluate_branch(0) && signed_notsigned ;
    endsequence ireg_execute;

    sequence ijump_memory;
        ##1 !dram_enable_cu ;
    endsequence ireg_memory;

    sequence ijump_wb;
        ##1 write_rf && select_wb(0);
    endsequence ireg_wb;



    property instruction_check;
        @(test_clk)
        // iram enable cu is for the fetch stage
        disable iff (!rst )
           if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===0)
            // reg type
           iram_enable_cu |-> (ireg_decode  && ireg_execute && ireg_memory && ireg_wb); 
            else if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_j ||
                curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_jal ) // jump 
                iram_enable_cu |-> (ijump_decode  && ijump_execute && ijump_memory && ijump_wb);
            else if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_lw) // lw
                iram_enable_cu |-> (lw_decode  && lw_execute && lw_memory && lw_wb);
            else if(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_sw) // sw
                iram_enable_cu |-> (sw_decode  && sw_execute && sw_memory && sw_wb);
            else if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_beqz || 
            curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_benz) // beqz or benz
                iram_enable_cu |-> (b_decode  && b_execute(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]) 
                        && b_memory && b_wb);
            else // itype
                iram_enable_cu |-> (itype_decode  && itype_execute && itype_memory && itype_wb);
            
    endproperty;


  	// property instantiation
    instruction_check_property : assert property (instruction_check)
     else $display("Error @%d on instruction %s",$time(),
        enum_wrap_instruction#(instructions_opcode)::name(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]));;

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
