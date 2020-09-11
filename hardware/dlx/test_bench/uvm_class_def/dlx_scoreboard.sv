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

   const int unsigned control_regtype;
   const int unsigned control_immediate;
   const int unsigned control_beqz;
   const int unsigned control_benz;
   const int unsigned control_j;
   const int unsigned control_jal;
   const int unsigned control_sw;
   const int unsigned control_lw;


  function new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);
    // init signatures
    control_regtype=32'h7dfb_8000;
	control_immediate=32'h6491_8000;
	control_beqz=32'h65b3_8000;
	control_benz=32'h65f3_8000;
	control_j=32'h7ffb_8000;
	control_jal=32'h7ffb_8000;
	control_sw=32'h75fb_8000;
	control_lw=32'h7dff_8000;
  endfunction


  instruction_info info_array_instr[string]; // associative array
  instruction_item instr_queue[$];
// declaring port 
  uvm_analysis_imp #(instruction_item, scoreboard) m_analysis_imp;

   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_analysis_imp = new("m_analysis_imp", this);
  endfunction


  virtual function void write(instruction_item item);
    `uvm_info(get_type_name(), "Stored instruction item in scorebard", UVM_LOW)
	instr_queue.push_back(item);

  endfunction : write


virtual task run_phase(uvm_phase phase);

	instruction_item item;
	TYPE_OP_ALU_sv check_tmp;
	instructions_opcode tmp;
	instructions_regtype_opcode tmp_opcode;
	forever begin 
	wait ( instr_queue.size() >0) 

	item = instr_queue.pop_front();
  //called when something is transferred from monitor to scoreboard
    `uvm_info(get_type_name(), $sformatf("Current instruction: %s", item.convert2str()), UVM_LOW)
    // update the number of executed instruction to the related string 
//if exists otherwise allocate memory for it
	if(item.get_current_instruction_name()!=="")begin 
    if(!info_array_instr.exists(item.get_current_instruction_name())) begin 
		instruction_info iitmp;
		iitmp.pass="no";
		iitmp.executed_num=0;
    	info_array_instr[item.get_current_instruction_name()]= iitmp;
    end 
  	info_array_instr[item.get_current_instruction_name()].executed_num++; 
 	

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
	   check_tmp=TYPE_OP_ALU_sv'(item.get_alu_op());
  		// check the specific alu operation since internal alu op type is different than instruction code optype
		case (tmp_opcode)
		   i_add:
			begin 
				if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , ADD))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_and:begin 
				if(BITAND!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , BITAND))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_or:begin 
				if(BITOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , BITOR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_sll:begin 
				if(FUNCLSL!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , FUNCLSL))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_srl:begin 
				if(FUNCLSR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , FUNCLSR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_sub:begin 
				if(SUB!==check_tmp && item.get_carry_in()!==1)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , SUB))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_xor:begin 
				if(BITXOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , BITXOR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_sne:begin 
				if(NE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , NE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_sle:begin 
				if(LE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , LE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_sge: begin 
				if(GE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , GE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end
		   i_mul: begin 
				if(MULT!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , MULT))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
			end 
		endcase



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
		$display("%h %h----", item.get_signals(), control_j);
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
		tmp= item.get_opcode();
  		if(item.get_signals()!==control_immediate && tmp!==i_nop) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()))
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  		
  		check_tmp= TYPE_OP_ALU_sv'(item.get_alu_op());
  		// check the specific alu operation
  		case (tmp)
  			i_addi : begin 

		if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode addi ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , ADD))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode addi!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
  			end 
   			i_andi : begin 
		if(BITAND!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode subi ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , BITAND))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode subi!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_nop : begin 
		if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode nop ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , ADD))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode nop!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_sgei : begin 
		if(GE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SGEI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , GE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SGEI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_slei : begin 
		if(LE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SLEI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , LE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SLEI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_slli : begin 
		if(FUNCLSL!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SLLI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , FUNCLSL))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SLLI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_snei : begin 
		if(NE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode  SNEI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , NE))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SNEI !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_srli : begin 
		if(FUNCLSR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SRLI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , FUNCLSR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SRLI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_subi : begin 
		if(SUB!==check_tmp && item.get_carry_in()!==1)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SUBI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , SUB))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SUBI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_ori : begin 
		if(BITOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode  ORI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , BITOR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode ORI !",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_xori : begin 
		if(BITXOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode XORI ! Actual : %d , Excpeted : %d",item.convert2str(),check_tmp , BITXOR))
        			info_array_instr[item.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode XORI!",item.convert2str()), UVM_LOW)
  					info_array_instr[item.get_current_instruction_name()].pass="yes";
  				end 
   			end 
  		endcase
  	end 
	end 
	end
	endtask : run_phase

	virtual function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	`uvm_info(get_type_name(), "Verbose prinf of instructions scoreboard",UVM_LOW)
	foreach(info_array_instr[key_in])begin 
	`uvm_info(get_type_name(), $sformatf("instruction %s, pass:%s , executed: %d times",key_in,info_array_instr[key_in].pass,info_array_instr[key_in].executed_num),UVM_LOW)
	end 
	
	endfunction : report_phase


function integer all_instruction_checked ();
	int check=1;
	string i;
		
	if(info_array_instr.num()<=0) begin 
	return 0;
	end 

	if(! info_array_instr.first(i)) begin 
		`uvm_error (get_type_name(),"ERROR instruction info array is empty")
	end 
	for (; !info_array_instr.exists(i);) begin
		if(info_array_instr[i].executed_num<=0) begin 
			check=0;
		end 
		 if(!info_array_instr.next(i)) begin 
			`uvm_error( get_type_name(), $sformatf("error instruction info array not found for %s",i))
		 end 
	end
	return check;
endfunction : all_instruction_checked

endclass


`endif 
