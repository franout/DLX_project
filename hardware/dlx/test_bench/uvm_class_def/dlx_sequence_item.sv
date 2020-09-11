//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_sequence_item.sv
// Create : 2020-09-01 21:57:14
// Revise : 2020-09-04 16:48:39
// Editor : sublime text3, tab size (4)
// Description : it contains the test program 
// -----------------------------------------------------------------------------


`ifndef __DLX_SEQUENCE_ITEM_SV
`define __DLX_SEQUENCE_ITEM_SV
`include "../003-global_defs.svh"
`include "../004-implemented_instructions.svh"

import uvm_pkg::*;

`include <uvm_macros.svh>
`include <uvm_pkg.sv>

class instruction_item extends uvm_sequence_item;


  bit[32-1:0] signals; 
  bit[`IRAM_WORD_SIZE-1:0] current_instruction;
  rand instructions_opcode current_opcode;
  rand bit[5-1:0] rd;
  rand bit[5-1:0] rs1;
  rand bit[5-1:0] rs2;
  rand bit[15:0] immediate;
  rand bit[25:0] jump_address;
  rand instructions_regtype_opcode current_opcode_func;
`uvm_object_utils_begin(instruction_item)
	`uvm_field_enum(instructions_opcode,current_opcode,UVM_ALL_ON)
	`uvm_field_enum(instructions_regtype_opcode,current_opcode_func,UVM_ALL_ON)
`uvm_object_utils_end

    constraint c1 { rd>0 ; rd <31;}
    constraint c2 {rs2>=0 ; rs2 <30;}
    constraint c3 { rs1>=0 ; rs1 <30;}

  function void compose_instruction(); // it is actually the set curret instruction 
	`uvm_info(get_type_name(),$sformatf("Composing instruction: opcode:0x%h rs1: %d rs2:%d rd:%d opcode_func:0x%h",this.current_opcode,this.rs1,this.rs2,this.rd,this.current_opcode_func),UVM_LOW)
  	if(current_opcode==i_regtype) begin 
  		this.current_instruction= {current_opcode,rs1 ,rs2 ,rd, current_opcode_func};
  	end else if (this.current_opcode===i_j || this.current_opcode===i_jal) begin 
		this.current_instruction= {current_opcode,jump_address};
  	end else begin  // immediate or benq or sw lw
		this.current_instruction= {current_opcode,rs1 ,rd, immediate};
  	end 
  	endfunction
  
  function   bit[`IRAM_WORD_SIZE-1:0] get_current_instruction();
  	return this.current_instruction;
  endfunction : get_current_instruction

  function instructions_opcode get_opcode ();
  	return this.current_opcode;
  endfunction : get_opcode

  function instructions_regtype_opcode get_opcode_func ();
  	return this.current_opcode_func;
  endfunction : get_opcode_func 

  function void force_nop ();
  	this.current_opcode=i_nop;
  endfunction : force_nop


  function new(string name = "instruction_item" );
    super.new(name);
	// deault instrunction is a nop
/*	this.current_opcode=i_nop;
	this.rs1=5'h0;
	this.rs2=5'h0;
	this.rd=5'h0;
	this.immediate=0;
	this.current_opcode_func=i_add;*/
  endfunction


   function string convert2str (); 
   	 if(this.current_opcode===i_regtype) begin 
   	 	return $sformatf("%s %d,%d,%d",  enum_wrap_instruction#(instructions_regtype_opcode)::name(current_opcode_func) ,rs1,rs2,rd);
  	end else if (this.current_opcode===i_j || this.current_opcode===i_jal) begin 
  		return $sformatf("%s %h",  enum_wrap_instruction#(instructions_opcode)::name(current_opcode) ,jump_address);
  	end else begin  // immediate or benq or sw lw
		return $sformatf("%s %d %d %d",enum_wrap_instruction#(instructions_opcode)::name(current_opcode),rs1,rd,immediate);
  	end 
   endfunction : convert2str

   function string get_current_instruction_name();
   	 if(this.current_opcode===i_regtype) begin 
   		return enum_wrap_instruction#(instructions_regtype_opcode)::name(current_opcode_func);
   	 end else begin 
   	 	return enum_wrap_instruction#(instructions_opcode)::name(current_opcode);
   	 end 
   endfunction : get_current_instruction_name


   function integer get_signals ();
	return {this.signals[31:15], 15'd0};
endfunction : get_signals

function integer get_carry_in ();
	return this.signals[4];
endfunction : get_carry_in


function bit[3:0] get_alu_op ();
	//return this.signals[3:0];
	bit[3:0] tmp;
		if(current_opcode==i_regtype) begin 
			case(current_opcode_func)
			   i_and: tmp=BITAND;
			   i_or: tmp=BITOR;
			   i_sll: tmp=FUNCLSL;
			   i_srl: tmp=FUNCLSR;
   			   i_sub: tmp=SUB;
			   i_xor: tmp=BITXOR;
			   i_sne: tmp=NE;
			   i_sle: tmp=LE;
			   i_sge: tmp=GE;
			   i_mul: tmp= MULT;
			default  tmp=ADD;
			endcase
		end else begin 
			case (current_opcode) 
		 	  i_andi: tmp=BITAND;	
			  i_sgei: tmp=GE;
			  i_slei: tmp=LE;
			  i_slli: tmp=FUNCLSL;
			  i_snei: tmp=NE;
			  i_srli: tmp=FUNCLSR;
			  i_subi: tmp=SUB;
		      i_ori:  tmp= BITOR;
        	  i_xori:  tmp=BITXOR;
			default  tmp=ADD; /*i_addi , i_nop, i_lw, i_jal, i_j, i_benz, i_beqz*/
			endcase	
		end
	return tmp;
endfunction : get_alu_op

function void set_signals (int sample_val,int cc);
	if(cc==0) begin 
	this.signals=sample_val;
	end else begin 
	this.signals= this.signals | sample_val;
	end 
endfunction : set_signals

function void collect_instruction( bit [`IRAM_WORD_SIZE-1:0] val);
	
this.current_opcode=instructions_opcode'(val[`IRAM_WORD_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE]);
	if(current_opcode==i_regtype) begin 
		this.rs1=int'(val[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-5]);
		this.rs2=int'(val[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1-5:`IRAM_WORD_SIZE-`OP_CODE_SIZE-10]);
		this.rd=int'(val[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1-10:`IRAM_WORD_SIZE-`OP_CODE_SIZE-15]);
		this.current_opcode_func=instructions_regtype_opcode'(val[`OP_CODE_SIZE:0]);
  	end else if (this.current_opcode===i_j || this.current_opcode===i_jal) begin 
		this.jump_address=val[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:0];
  	end else begin  // immediate or benq or sw lw
		this.rs1=int'(val[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1:`IRAM_WORD_SIZE-`OP_CODE_SIZE-5]);
		this.rd=int'(val[`IRAM_WORD_SIZE-`OP_CODE_SIZE-1-5:`IRAM_WORD_SIZE-`OP_CODE_SIZE-10]);
		this.immediate=val[15:0];
  	end 

endfunction : collect_instruction

endclass

`endif

