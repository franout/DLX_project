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

typedef struct {
	/*instructions_opcode current_opcode;
	instructions_regtype_opcode current_opcode_func;*/
	string pass="no"; //default value for every instruction is no 
	int executed_num=0; // how many times the instruction is executed
}instruction_info;

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

   const int control_regtype;
   const int control_immediate;
   const int control_beqz;
   const int control_benz;
   const int control_j;
   const int control_jal;
   const int control_sw;
   const int control_lw;


  function new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);
    // init constant values 
    control_regtype=4161896448;
	control_immediate=3541139456;
	control_beqz=3819962368;
	control_benz=3822059520;
	control_j=2274492416;
	control_jal=2274590720;
	control_sw=4103602176;
	control_lw=3835527168;
  endfunction


  instruction_info info_array_instr[string]; // associative array
  uvm_analysis_imp #(instruction_item, scoreboard) m_analysis_imp;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_analysis_imp = new("m_analysis_imp", this);
  endfunction

  virtual function write(instruction_item item);
  //called when something is transferred from monitor to scoreboard
    `uvm_info(get_type_name(), $sformatf("Current instruction: %s", item.convert2str()), UVM_LOW)
    // update the number of executed instruction to the related string if exists otherwise allocate memory for it
    if(info_array_instr[item.get_current_instruction_name()]===null) begin 
    	info_array_instr[item.get_current_instruction_name()]= new;
    end else begin 
  	info_array_instr[item.get_current_instruction_name()].executed_num++; 
  	end 
  	// check debug signals 
  	if(item.get_opcode()===i_regtype) begin 
  		// check the general signals 
  		if(item.get_signals()[31:15]!= ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  		instructions_regtype_opcode tmp= item.get_opcode_func();
  		TYPE_OP_ALU_sv check_tmp= TYPE_OP_ALU_sv'(item.get_alu_op());
  		// check the specific alu operation
  		case (tmp)
  			i_add: begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode add ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_add), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode !",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
  			end
   			i_and  : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode and ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_and), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode and!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_or: begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode or ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_or), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode or!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_sll : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode sll ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_sll), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode sll!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_srl : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode srl ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_srl), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode srl!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_sub : begin 
  				if(tmp!==check_tmp && item.get_carry_in()!==1 )begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode sub ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_sub), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode sub!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_xor : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode xor ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_xor), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode xor!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_sne : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode sne ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_sne), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode sne!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_sle : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode sle ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_sle), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode sle !",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_sge : begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode sge ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_sge), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode sge!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
   			i_mul: begin 
  				if(tmp!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode mul ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_mul), UVM_LOW)
        			 info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode mul!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end
  			default : /* default */;
  		endcase
  	end else if (item.get_opcode()===i_beqz ) begin 

  		// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else if( item.get_opcode()===i_benz) begin 
  			// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else if (item.get_opcode()===i_j) begin 
  			// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else if(item.get_opcode()===i_jal) begin 
	// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

    end else if (item.get_opcode()===i_sw )
	// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

	end else if (item.get_opcode()===i_lw) begin 
	// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  	end else begin  // immediate
	// check the general signals TODO
  		if(item.get_signals()[31:13]!='h ) begin  //compare with a signature 
  			`uvm_error(get_type_name(), $sformatf("FAILED instruction: %s!",item.convert2str()), UVM_LOW)
  			info_array_instr[item.get_current_instruction_name()].pass="no"; 
  		end else begin 	
			`uvm_info(get_type_name(), $sformatf("PASSED instruction: %s!",item.convert2str()), UVM_LOW)
			info_array_instr[item.get_current_instruction_name()].pass="yes"; 
  		end 

  		instructions_opcode tmp= item.get_opcode();
  		TYPE_OP_ALU_sv check_tmp= TYPE_OP_ALU_sv'(item.get_signals()[3:0]);
  		// check the specific alu operation
  		case (tmp)
  			i_addi : begin 
		if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode addi ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , ADD), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode addi!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
  			end 
   			i_andi : begin 
		if(BITAND!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode subi ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , BITAND), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode subi!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_nop : begin 
		if(ADD!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode nop ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , i_add), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode nop!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_sgei : begin 
		if(GE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SGEI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , GE), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SGEI!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_slei : begin 
		if(LE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SLEI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , LE), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SLEI!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_slli : begin 
		if(FUNCLSL!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SLLI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , FUNCLSL), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SLLI!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_snei : begin 
		if(NE!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode  SNEI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , NE), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SNEI !",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_srli : begin 
		if(FUNCLSR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SRLI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , FUNCLSR), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SRLI!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_subi : begin 
		if(SUB!==check_tmp && item.get_carry_in()!==1)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode SUBI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , SUB), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode SUBI!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_ori : begin 
		if(BITOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode  ORI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , BITOR), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode ORI !",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
   			i_xori : begin 
		if(BITXOR!==check_tmp)begin 
        			`uvm_error (get_type_name(),$sformatf("FAILED instruction: %s , wrong alu opcode XORI ! Actual : %d , Excpeted : %d",item.convert2str(),tmp , BITXOR), UVM_LOW)
        			info_array_instr[tmp.get_current_instruction_name()].pass="no";
  				end else begin 
  					`uvm_info(get_type_name(),  $sformatf("PASSED instruction: %s , correct alu opcode XORI!",item.convert2str()), UVM_LOW)
  					info_array_instr[tmp.get_current_instruction_name()].pass="yes";
  				end 
   			end 
  			default : /* default */;
  		endcase
  	end 

  endfunction : write

function all_instruction_checked ();
	int check=1;
	for (instruction_info i = info_array_instr.first(); !info_array_instr.exists(i); i=info_array_instr.next()) begin
		if(i.executed_num<=0) begin 
			check=0;
		end 
	end
	return check;
endfunction : all_instruction_checked

endclass


`endif