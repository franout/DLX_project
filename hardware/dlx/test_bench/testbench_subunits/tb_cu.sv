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


program automatic test_prog (input logic clk, input logic rst,
                             input logic[] instruction_to_cu);

	`ifndef  VIVADO_SIM
	default clocking test_clk_prog @( posedge clk);
	endclocking 
	`endif
instructions_opcode current_opcode;

initial begin 
		$display("@%0dns Starting Program",$time);
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


    /*

          when i_add =>
                        cmd_word<=x"7c13"; --111 1100 0001 0011
                        --  control for not writing to r0 
                        if(curr_instruction_to_cu(15 downto 11)=(OTHERS=>'0')  )then -- check destination error
                         --rtype_itypen ='1' 
                          next_state<=hang_error;
                        end if;
                    when i_addi=> 
                         cmd_word<=x"";
                         if(curr_instruction_to_cu(20 downto 16)=(OTHERS=>'0') )then -- check destination error
                         --rtype_itypen ='0' 
                          next_state<=hang_error;
                        end if;
                    when i_and =>
                    when i_andi=>
                    when i_beqz=>
                    when i_benz=>
                    when i_j=>
                    when i_jal=>
                    when i_lw=>
                    when i_nop=>
                    when i_or=>
                    when i_ori=>
                    when i_sgl=>
                    when i_sgei=>
                    when i_sle=>
                    when i_slei=>
                    when i_sll=>
                    when i_slli=>
                    when i_sne=>
                    when i_snei=>
                    when i_srl=>
                    when i_srli=>
                    when i_sub=>
                    when i_subi=>
                    when i_sw=>
                    when i_xor=>
                    when i_xori=>
                    when i_mul=>
				
      */
		`ifndef  VIVADO_SIM
		##1;
		`else 
		repeat(2)@ (posedge clk);
		`endif
		$display("Control unit has passed the testbench",);
		$finish;
end

endprogram : test_prog;

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
  	logic [$clog2(`CU_STATES)-1:0]STATE_CU;

  	// property definition

  	// property instantiation

  	// unit under test instantiation
  control_unit  #(
    .PC_SIZE      (`IRAM_ADDRESS_SIZE),
    .RF_REGS      (`RF_REGS), // number of register in register file
    .FUNC_SIZE    (`FUNC_SIZE), // Func Field Size for R-Type Ops
    .OP_CODE_SIZE (`OP_CODE_SIZE), // Op Code Size
    .IR_SIZE      (`IRAM_WORD_SIZE), // Instruction Register Size    
    .CW_SIZE      (`)  // Control Word Size
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
    .STATE_CU(STATE_CU)
    //synthesis_translate on
  );


  	test_prog test_control_unit(
  					.clk(clk),
  					.rst(rst),
            .instruction_to_cu(curr_instruction_to_cu)
  					);


endmodule