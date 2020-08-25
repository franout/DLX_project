//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : property_def.svh
// Create : 2020-08-01 16:14:31
// Revise : 2020-08-01 16:14:31
// Editor : sublime text3, tab size (4)
// Description: Defintion of all property and sequences for the DLX top level entity
// -----------------------------------------------------------------------------
`ifndef __PROPERTY_DEF_SVH
`define __PROPERTY_DEF_SVH

`include "./003-global_defs.svh"
`include "./004-implemented_instructions.svh"

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

    sequence ireg_execute(cin);
        ##1 !sel_val_a[0] && !sel_val_b[0] && (alu_cin===cin) && !evaluate_branch[1] && !evaluate_branch[0] && signed_notsigned ;
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
        disable iff (!rst || ireg_instr!==0)
            // reg type
			if(ireg_instr===i_sub)
				iram_enable_cu |-> ireg_decode |-> ireg_execute(1) |-> ireg_memory |-> ireg_wb
			else
				iram_enable_cu |-> ireg_decode |-> ireg_execute(0) |-> ireg_memory |-> ireg_wb
    endproperty;

	property instruction_check_jump;
		@(test_clk)
			disable iff(!rst || jump_instr!==i_j || jump_instr!==i_jal  )
            if (jump_instr===i_jal )
				iram_enable_cu |-> ijumpal_decode |->  ijump_execute |-> ijump_memory |->  ijump_wb
            else
                iram_enable_cu |-> ijump_decode |->  ijump_execute |->  ijump_memory |->  ijump_wb;
	endproperty;

    property instruction_check_lw;
				@(test_clk)
			disable iff(!rst || lw_instr!==i_lw)
				                iram_enable_cu |-> lw_decode |->  lw_execute |-> lw_memory |->  lw_wb;
	endproperty;


	property instruction_check_sw;
		@(test_clk)
			disable iff(!rst || sw_instr!==i_sw)
			    iram_enable_cu |-> sw_decode |->  sw_execute |->  sw_memory |->  sw_wb;
	endproperty;


	property instruction_check_b;
			@(test_clk)
			disable iff(!rst || b_instr!==i_beqz || b_instr!==i_benz)
					if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_beqz )
				         iram_enable_cu |-> b_decode |->  beqz_execute |->  b_memory |->  b_wb
					else
				         iram_enable_cu |-> b_decode |->  benz_execute |->  b_memory |->  b_wb;
	endproperty;

     property instruction_check_i;
		@(test_clk)
			disable iff(!rst || imm_instru===i_regtype)
                iram_enable_cu |-> itype_decode |->  itype_execute |->  itype_memory |->  itype_wb; // itype
	endproperty;

    instructions_regtype_opcode ireg_instr;
    instructions_opcode imm_instru,jump_instr,lw_instr,sw_instr,b_instr;
    // cast from bit to typedef of instruction 
/*    always_comb begin : proc_cast   
		// type_t'(x) cast x to type_t
		ireg_instr=instructions_regtype_opcode'(curr_instruction_to_cu[`OP_CODE_SIZE-1:0]);
		imm_instru=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		jump_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		lw_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		sw_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		b_instr=instructions_opcode'(curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
		
    end        */

	property status;
		@(test_clk) 
			disable iff(!rst)
			STATE_CU!==hang_error ;
	endproperty;



`endif //__PROPERTY_DEF_SVH
