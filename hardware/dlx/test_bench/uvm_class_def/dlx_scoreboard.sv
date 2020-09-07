//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_scoreboard.sv
// Create : 2020-09-01 21:56:39
// Revise : 2020-09-06 16:02:49
// Editor : sublime text3, tab size (4)
// Description :
// -----------------------------------------------------------------------------


`ifndef __DLX_SCOREBOARD_SV
`define __DLX_SCOREBOARD_SV
`include "../004-implemented_instructions.svh"
`include "./dlx_sequencer.sv"
`include "./dlx_monitor.sv"

import uvm_pkg::*;
`include <uvm_macros.svh>
`include <uvm_pkg.sv>

typedef struct {
	/*instructions_opcode current_opcode;
	instructions_regtype_opcode current_opcode_func;*/
	string pass="no"; //default value for every instruction is no 
	int executed_num=0; // how many times the instruction is executed
}instruction_info;

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

   const integer unsigned control_regtype;
   const integer unsigned control_immediate;
   const integer unsigned control_beqz;
   const integer unsigned control_benz;
   const integer unsigned control_j;
   const integer unsigned control_jal;
   const integer unsigned control_sw;
   const integer unsigned control_lw;


  function new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);
    // init signatures
    control_regtype=32'd4161896448;
	control_immediate=32'd3541139456;
	control_beqz=32'd3819962368;
	control_benz=32'd3822059520;
	control_j=32'd2274492416;
	control_jal=32'd2274590720;
	control_sw=32'd4103602176;
	control_lw=32'd3835527168;
  endfunction


  instruction_info info_array_instr[string]; // associative array
  uvm_analysis_imp #(instruction_item, scoreboard) m_analysis_imp;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_analysis_imp = new("m_analysis_imp", this);
  endfunction

  virtual function write(instruction_item item);
	TYPE_OP_ALU_sv check_tmp;
	instructions_opcode tmp;
	instructions_regtype_opcode tmp_opcode;
  //called when something is transferred from monitor to scoreboard
    `uvm_info(get_type_name(), $sformatf("Current instruction: %s", item.convert2str()), UVM_LOW)
    // update the number of executed instruction to the related string 
/*if exists otherwise allocate memory for it
    if(info_array_instr[item.get_current_instruction_name()]===null) begin 
    	info_array_instr[item.get_current_instruction_name()]= new;
    end else begin */
  	info_array_instr[item.get_current_instruction_name()].executed_num++; 
//  	end 
  	// check debug signals 
  	if(item.get_opcode()===i_regtype) begin 
  		// check the general signals 
  		if(item.get_signals()!==control_regtype ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  		 tmp_opcode= item.get_opcode_func();
	   check_tmp= TYPE_OP_ALU_sv'(item.get_alu_op());
  		// check the specific alu operation
		if(tmp_opcode!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),tmp_opcode , i_add))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 

  	end else if (item.get_opcode()===i_beqz ) begin 

  		// check the general signals 
  		if(item.get_signals()!==control_beqz ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else if( item.get_opcode()===i_benz) begin 
  			// check the general signals 
  		if(item.get_signals()!==control_benz ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else if (item.get_opcode()===i_j) begin 
  			// check the general signals 
  		if(item.get_signals()!=control_j ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else if(item.get_opcode()===i_jal) begin 
	// check the general signals
  		if(item.get_signals()!==control_jal) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

    end else if (item.get_opcode()===i_sw ) begin
	// check the general signals 
  		if(item.get_signals()!==control_sw ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

	end else if (item.get_opcode()===i_lw) begin 
	// check the general signals 
  		if(item.get_signals()!== control_lw ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else begin  // immediate
	// check the general signals 
  		if(item.get_signals()!==control_immediate ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  		tmp= item.get_opcode();
  		check_tmp= TYPE_OP_ALU_sv'(item.get_signals()[3:0]);
  		// check the specific alu operation
  		case (tmp)
  			i_addi : begin 
		if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode addi ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , ADD))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode addi!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
  			end 
   			i_andi : begin 
		if(BITAND!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode subi ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , BITAND))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode subi!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_nop : begin 
		if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode nop ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_add))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode nop!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_sgei : begin 
		if(GE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SGEI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , GE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SGEI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_slei : begin 
		if(LE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SLEI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , LE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SLEI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_slli : begin 
		if(FUNCLSL!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SLLI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , FUNCLSL))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SLLI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_snei : begin 
		if(NE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode  SNEI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , NE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SNEI !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_srli : begin 
		if(FUNCLSR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SRLI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , FUNCLSR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SRLI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_subi : begin 
		if(SUB!==check_tmp && item.get_carry_in()!==1)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SUBI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , SUB))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SUBI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_ori : begin 
		if(BITOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode  ORI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , BITOR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode ORI !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_xori : begin 
		if(BITXOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode XORI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , BITXOR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode XORI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
  			default : /* default */;
  		endcase
  	end 

  endfunction : write

function integer all_instruction_checked ();
	int check=1;
	instruction_info i;
	i = info_array_instr.first;
	for (; !info_array_instr.exists(i); i=info_array_instr.next) begin
		if(i.executed_num<=0) begin 
			check=0;
		end 
	end
	return check;
endfunction : all_instruction_checked

endclass


`endif 
