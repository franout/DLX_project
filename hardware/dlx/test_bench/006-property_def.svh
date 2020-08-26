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
        @(test_dlx)
            disable iff(!rst || !DEBUG_zero_mul_detect || !DEBUG_mul_exeception )
				(DEBUG_alu_op_type===MULT) |-> !DEBUG_iram_enable_cu[*6];// no fetching for 6 cc
    endproperty;

  /* sequence for reg type instructions*/
    sequence ireg_decode;
        ##1  DEBUG_enable_rf && DEBUG_read_rf_p1 && DEBUG_read_rf_p2 && DEBUG_rtype_itypen_i && !DEBUG_compute_sext && !DEBUG_jump_sext;
    endsequence ;

    sequence ireg_execute(cin);
        ##1 !DEBUG_sel_val_a[0] && !DEBUG_sel_val_b[0] && (DEBUG_alu_cin===cin) && !DEBUG_evaluate_branch[1] && !DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
    endsequence;

    sequence ireg_memory;
        ##1 !DEBUG_dram_enable_cu ;
    endsequence ;

    sequence ireg_wb;
        ##1 DEBUG_write_rf && DEBUG_select_wb[0];
    endsequence ;
/*sequence for immediate instruction */
    sequence itype_decode;
        ##1  DEBUG_enable_rf && DEBUG_read_rf_p1 && !DEBUG_read_rf_p2 && !DEBUG_rtype_itypen_i && DEBUG_compute_sext && !DEBUG_jump_sext;
    endsequence ;

    sequence itype_execute;
        ##1 !DEBUG_sel_val_a[0] && DEBUG_sel_val_b[0] && !DEBUG_alu_cin && !DEBUG_evaluate_branch[1] && !DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
    endsequence ;

    sequence itype_memory;
        ##1 !DEBUG_dram_enable_cu ;
    endsequence ;

    sequence itype_wb;
        ##1 DEBUG_write_rf && DEBUG_select_wb[0];
    endsequence ;
/*sequnce for lw*/
    sequence lw_decode;
        ##1  DEBUG_enable_rf && DEBUG_read_rf_p1 && !DEBUG_read_rf_p2 && !DEBUG_rtype_itypen_i && DEBUG_compute_sext && !DEBUG_jump_sext;
    endsequence ;

    sequence lw_execute;
        ##1 DEBUG_sel_val_a[0] && DEBUG_sel_val_b[0] && !DEBUG_alu_cin && !DEBUG_evaluate_branch[1] && !DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
    endsequence ;

    sequence lw_memory;
        ##1 DEBUG_dram_enable_cu  && DEBUG_dram_r_nw_cu;
    endsequence ;

    sequence lw_wb;
        ##1 DEBUG_write_rf && !DEBUG_select_wb[0];
    endsequence ;

/*sequnce for sw*/
    sequence sw_decode;
        ##1  DEBUG_enable_rf && DEBUG_read_rf_p1 && !DEBUG_read_rf_p2 && !DEBUG_rtype_itypen_i && DEBUG_compute_sext && !DEBUG_jump_sext;
    endsequence;

    sequence sw_execute;
        ##1 DEBUG_sel_val_a[0] && DEBUG_sel_val_b[0] && !DEBUG_alu_cin && !DEBUG_evaluate_branch[1] && !DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
    endsequence ;

    sequence sw_memory;
        ##1 DEBUG_dram_enable_cu  && !DEBUG_dram_r_nw_cu;
    endsequence ;

    sequence sw_wb;
        ##1 !DEBUG_write_rf ;
    endsequence ;

/*sequnce for b*/
    sequence b_decode;
        ##1  DEBUG_enable_rf && DEBUG_read_rf_p1 && !DEBUG_read_rf_p2 && !DEBUG_rtype_itypen_i && !DEBUG_compute_sext && !DEBUG_jump_sext;
    endsequence ;

    sequence beqz_execute;
   
            ##1 DEBUG_sel_val_a[0] && DEBUG_sel_val_b[0] && !DEBUG_alu_cin && !DEBUG_evaluate_branch[1] && DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
        
    endsequence ;

	sequence benz_execute;
		 // i_benz
            ##1 DEBUG_sel_val_a[0] && DEBUG_sel_val_b[0] && !DEBUG_alu_cin && DEBUG_evaluate_branch[1] && !DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
	endsequence;
    sequence b_memory;
        ##1 !DEBUG_dram_enable_cu  ;
    endsequence ;

    sequence b_wb;
        ##1 !DEBUG_write_rf ;
    endsequence;
 /*sequence for jump instruction*/
    sequence ijump_decode;
        ##1  !DEBUG_enable_rf && !DEBUG_read_rf_p1 && !DEBUG_read_rf_p2 && !DEBUG_rtype_itypen_i && !DEBUG_compute_sext &&  DEBUG_jump_sext;
    endsequence ;

    sequence ijumpal_decode;
        ##1 DEBUG_enable_rf && !DEBUG_read_rf_p1 && !DEBUG_read_rf_p2 && !DEBUG_rtype_itypen_i && !DEBUG_compute_sext && DEBUG_jump_sext;
    endsequence;

    sequence ijump_execute;
        ##1 DEBUG_sel_val_a[0] && DEBUG_sel_val_b[0] && !DEBUG_alu_cin && !DEBUG_evaluate_branch[1] && !DEBUG_evaluate_branch[0] && DEBUG_signed_notsigned ;
    endsequence ;

    sequence ijump_memory;
        ##1 !DEBUG_dram_enable_cu ;
    endsequence ;

    sequence ijump_wb;
        ##1 DEBUG_write_rf && DEBUG_select_wb[0];
    endsequence ;

    property instruction_check_ireg;
        @(test_dlx)
        // iram enable cu is for the fetch stage
        disable iff (!rst || ireg_instr!==0)
            // reg type
			if(ireg_instr===i_sub)
				DEBUG_iram_enable_cu |-> ireg_decode |-> ireg_execute(1) |-> ireg_memory |-> ireg_wb
			else
				DEBUG_iram_enable_cu |-> ireg_decode |-> ireg_execute(0) |-> ireg_memory |-> ireg_wb
    endproperty;

	property instruction_check_jump;
		@(test_dlx)
			disable iff(!rst || jump_instr!==i_j || jump_instr!==i_jal  )
            if (jump_instr===i_jal )
				DEBUG_iram_enable_cu |-> ijumpal_decode |->  ijump_execute |-> ijump_memory |->  ijump_wb
            else
                DEBUG_iram_enable_cu |-> ijump_decode |->  ijump_execute |->  ijump_memory |->  ijump_wb;
	endproperty;

    property instruction_check_lw;
				@(test_dlx)
			disable iff(!rst || lw_instr!==i_lw)
				                DEBUG_iram_enable_cu |-> lw_decode |->  lw_execute |-> lw_memory |->  lw_wb;
	endproperty;


	property instruction_check_sw;
		@(test_dlx)
			disable iff(!rst || sw_instr!==i_sw)
			    DEBUG_iram_enable_cu |-> sw_decode |->  sw_execute |->  sw_memory |->  sw_wb;
	endproperty;


	property instruction_check_b;
			@(test_dlx)
			disable iff(!rst || b_instr!==i_beqz || b_instr!==i_benz)
					if (curr_instruction_to_cu[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]===i_beqz )
				         DEBUG_iram_enable_cu |-> b_decode |->  beqz_execute |->  b_memory |->  b_wb
					else
				         DEBUG_iram_enable_cu |-> b_decode |->  benz_execute |->  b_memory |->  b_wb;
	endproperty;

     property instruction_check_i;
		@(test_dlx)
			disable iff(!rst || imm_instru===i_regtype)
                DEBUG_iram_enable_cu |-> itype_decode |->  itype_execute |->  itype_memory |->  itype_wb; // itype
	endproperty;


`endif //__PROPERTY_DEF_SVH
