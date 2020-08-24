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
		instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]=i_nop;
		instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:0]=0;
		$display("Starting testbench for Control unit",);
		rst=0;
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
		rst=1;
        //initialize seed for random register
        current_opcode=current_opcode.first();
        $display("Looping over all instructions",);
        for (; current_opcode !== current_opcode.last(); ) begin
            
            if(current_opcode===i_regtype)begin 
                $display("Looping over all regtype instructions",);
                current_opcode_alu_fun= current_opcode_alu_fun.first();
                rs1=$urandom_range(0,10);
                rs2=$urandom_range(11,21);
                rd= $urandom_range(22,31);
                // compose instruction 
                // opcode
				instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]='0;
                // registers
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-5]=rs1;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-5-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-10]=rs2;
                instruction_to_cu[`IRAM_WORD_SIZE-`OP_CODE_SIZE-10-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-15]=rd;
                for (;current_opcode_alu_fun!==current_opcode_alu_fun.last() ; ) begin
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
    logic jump_sext;
    wire [3:0]alu_op_type;
    logic [0:0]sel_val_a;
    logic [0:0]sel_val_b;
    logic alu_cin;
    logic alu_overflow;
    logic [1:0]evaluate_branch;
    logic zero_mul_detect;
    logic mul_exeception;
    logic dram_enable_cu;
    logic dram_r_nw_cu;
    logic dram_ready_cu;
    logic [0:0]select_wb;
	logic  signed_notsigned;
	logic [$clog2(`CU_STATES)-1:0] STATE_CU_i;
 	cu_state_t [$clog2(`CU_STATES)-1:0] STATE_CU;
    logic [7:0] csr;

	assign STATE_CU=cu_state_t'(STATE_CU_i);
    assign iram_ready_cu=1;
    assign dram_ready_cu=1;

  	// property definition
    property multiplication_stall;
        @(test_clk)
            disable iff(!rst || !zero_mul_detect || !mul_exeception )
				(alu_op_type===MULT) |-> !iram_enable_cu[*6];// no fetching for 6 cc
    endproperty;

  /* sequence for reg type instructions*/
    sequence ireg_decode;
        ##1  enable_rf && read_rf_p1 && read_rf_p2 && rtype_itypen_i && !compute_sext && !jump_sext;
    endsequence ;

    sequence ireg_execute;
        ##1 !sel_val_a[0] && !sel_val_b[0] && !alu_cin && !evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
    endsequence;

    sequence ireg_memory;
        ##1 !dram_enable_cu ;
    endsequence ;

    sequence ireg_wb;
        ##1 write_rf && select_wb[0];
    endsequence ;
/*sequence for immediate instruction */
    sequence itype_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext && !jump_sext;
    endsequence ;

    sequence itype_execute;
        ##1 !sel_val_a[0] && sel_val_b[0] && !alu_cin && !evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
    endsequence ;

    sequence itype_memory;
        ##1 !dram_enable_cu ;
    endsequence ;

    sequence itype_wb;
        ##1 write_rf && select_wb[0];
    endsequence ;
/*sequnce for lw*/
    sequence lw_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext && !jump_sext;
    endsequence ;

    sequence lw_execute;
        ##1 sel_val_a[0] && sel_val_b[0] && !alu_cin && !evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
    endsequence ;

    sequence lw_memory;
        ##1 dram_enable_cu  && dram_r_nw_cu;
    endsequence ;

    sequence lw_wb;
        ##1 write_rf && !select_wb[0];
    endsequence ;

/*sequnce for sw*/
    sequence sw_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && compute_sext && !jump_sext;
    endsequence;

    sequence sw_execute;
        ##1 sel_val_a[0] && sel_val_b[0] && !alu_cin && !evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
    endsequence ;

    sequence sw_memory;
        ##1 dram_enable_cu  && !dram_r_nw_cu;
    endsequence ;

    sequence sw_wb;
        ##1 !write_rf ;
    endsequence ;

/*sequnce for b*/
    sequence b_decode;
        ##1  enable_rf && read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && !compute_sext && !jump_sext;
    endsequence ;

    sequence beqz_execute;
   
            ##1 sel_val_a[0] && sel_val_b[0] && !alu_cin && !evaluate_branch[1] && evaluate_branch[0] && signed_notsigned ;
        
    endsequence ;

	sequence benz_execute;
		 // i_benz
            ##1 sel_val_a[0] && sel_val_b[0] && !alu_cin && evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
	endsequence;
    sequence b_memory;
        ##1 !dram_enable_cu  ;
    endsequence ;

    sequence b_wb;
        ##1 !write_rf ;
    endsequence;
 /*sequence for jump instruction*/
    sequence ijump_decode;
        ##1  !enable_rf && !read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && !compute_sext &&  jump_sext;
    endsequence ;

    sequence ijumpal_decode;
        ##1 enable_rf && !read_rf_p1 && !read_rf_p2 && !rtype_itypen_i && !compute_sext && jump_sext;
    endsequence;

    sequence ijump_execute;
        ##1 sel_val_a[0] && sel_val_b[0] && !alu_cin && !evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
    endsequence ;

    sequence ijump_memory;
        ##1 !dram_enable_cu ;
    endsequence ;

    sequence ijump_wb;
        ##1 write_rf && select_wb[0];
    endsequence ;



    property instruction_check_ireg;
        @(test_clk)
        // iram enable cu is for the fetch stage
        disable iff (!rst || curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==0)
            // reg type
           iram_enable_cu |-> (ireg_decode  and ireg_execute and ireg_memory and ireg_wb); 
    endproperty;

	property instruction_check_jump;
		@(test_clk)
			disable iff(!rst || curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==i_j ||
                curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==i_jal  )
            if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_jal )
				iram_enable_cu |-> (ijumpal_decode and ijump_execute and ijump_memory and ijump_wb)
            else
                iram_enable_cu |-> (ijump_decode and ijump_execute and ijump_memory and ijump_wb)
	endproperty;

    property instruction_check_lw;
				@(test_clk)
			disable iff(!rst || curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==i_lw)
				                iram_enable_cu |-> (lw_decode and lw_execute and lw_memory and lw_wb);
	endproperty;


	property instruction_check_sw;
		@(test_clk)
			disable iff(!rst || curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==i_sw)
			                iram_enable_cu |-> (sw_decode and sw_execute and sw_memory and sw_wb);
	endproperty;


	property instruction_check_b;
			@(test_clk)
			disable iff(!rst || curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==i_beqz || 
            curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]!==i_benz)
					if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_beqz )
				         iram_enable_cu |-> (b_decode and beqz_execute and b_memory and b_wb)
					else
				         iram_enable_cu |-> (b_decode and benz_execute and b_memory and b_wb);
	endproperty;

     property instruction_check_i;
		@(test_clk)
			disable iff(!rst)
                iram_enable_cu |-> (itype_decode and itype_execute and itype_memory and itype_wb); // itype
	endproperty;

    instructions_regtype_opcode ireg_instr;
    instructions_opcode imm_instru,jump_instr,lw_instr,sw_instr,b_instr;
    // cast from bit to typedef of instruction 
    always_comb begin : proc_cast   
		// type_t'(x) cast x to type_t
		ireg_instr=instructions_regtype_opcode'(curr_instruction_to_cu[`OP_CODE_SIZE-1:0]);
		imm_instru=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		jump_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		lw_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		sw_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		b_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		
    end        



  	// property instantiation  
    instruction_check_property_ireg : assert property (instruction_check_ireg)
        else $display("Error @%d on instruction %s",$time(),
            enum_wrap_instruction#(instructions_regtype_opcode)::name(ireg_instr));
    instruction_check_property_i : assert property(instruction_check_i)
        else $display("Error @%d on instruction %s",$time(), 
            enum_wrap_instruction#(instructions_opcode)::name(imm_instru));
    instruction_check_property_jump : assert property(instruction_check_jump)
        else $display("Error @%d on instruction %s",$time(), 
            enum_wrap_instruction#(instructions_opcode)::name(jump_instr));
    instruction_check_property_lw : assert property(instruction_check_lw) 
        else $display("Error @%d on instruction %s",$time(),
            enum_wrap_instruction#(instructions_opcode)::name(lw_instr));
    instruction_check_property_sw : assert property(instruction_check_sw) 
        else $display("Error @%d on instruction %s",$time(),
            enum_wrap_instruction#(instructions_opcode)::name(sw_instr));
    instruction_check_property_b : assert property(instruction_check_b) 
        else $display("Error @%d on instruction %s",$time(), 
            enum_wrap_instruction#(instructions_opcode)::name(b_instr)); 
    multiplication_stall_check_property : assert property(multiplication_stall) 
        else $display("Error @%d on mul instruction, stall has failed",$time());

		assign alu_overflow='0;
		assign zero_mul_detect='0;
		assign mul_exeception='0;

  // unit under test instantiation
  control_unit  #(
    .PC_SIZE      (`IRAM_ADDRESS_SIZE),
    .RF_REGS      (`RF_REGS), // number of register in register file
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
    .rtype_itypen(rtype_itypen_i), //out
    .compute_sext(compute_sext), //out
    .jump_sext(jump_sext), //out
    // for execute stage
    .alu_op_type(alu_op_type), //TYPE_OP_ALU ; for compatibility with sv // out
    .sel_val_a(sel_val_a),  // out 
    .sel_val_b(sel_val_b), // out 
    // from execute stage
    .alu_cin(alu_cin), // in 
    .alu_overflow(alu_overflow), // out 
    .evaluate_branch(evaluate_branch), // in 
	.signed_notsigned( signed_notsigned),// out
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
    .STATE_CU(STATE_CU_i),
    .csr(csr)
    //synthesis_translate on
  );


  	test_prog test_control_unit(
  					.clk(clk),
  					.rst(rst),
            .instruction_to_cu(curr_instruction_to_cu)
  					);


endmodule
