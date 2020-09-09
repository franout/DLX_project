//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_sequencer.sv
// Create : 2020-09-01 21:57:14
// Revise : 2020-09-04 16:48:39
// Editor : sublime text3, tab size (4)
// Description : it contains the test program 
// -----------------------------------------------------------------------------


`ifndef __DLX_SEQUENCER_SV
`define __DLX_SEQUENCER_SV
`include "../003-global_defs.svh"
`include "../004-implemented_instructions.svh"

import uvm_pkg::*;

`include <uvm_macros.svh>
`include <uvm_pkg.sv>


class instruction_item extends uvm_sequence_item;

  bit[32-1:0] signals; 
  bit[`IRAM_WORD_SIZE-1:0] current_instruction;
  randc instructions_opcode current_opcode;
  rand bit[5-1:0] rd;
  rand bit[5-1:0] rs1;
  rand bit[5-1:0] rs2;
  rand bit[15:0] immediate;
  rand bit[25:0] jump_address;
  randc instructions_regtype_opcode current_opcode_func;
/*`uvm_object_utils_begin(instruction_item)
	`uvm_field_enum(instructions_opcode,current_opcode,UVM_ALL_ON)
	`uvm_field_enum(instructions_regtype_opcode,current_opcode_func,UVM_ALL_ON)
`uvm_object_utils_end*/

    constraint c1 { soft rd inside {[1:31]}; }
    constraint c2 { soft rs1 inside {[0:30]}; }
    constraint c3 { soft rs2 inside {[0:30]}; }

  function void compose_instruction(); // it is actually the set curret instruction 
	`uvm_info(get_type_name(),$sformatf("Composing instruction: %h %d %d %d %h",this.current_opcode,this.rs1,this.rs2,this.rd,this.current_opcode_func),UVM_LOW)
  	if(this.current_opcode===i_regtype) begin 
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
	current_opcode=i_nop;
	rs1=0;
	rd=0;
	immediate=0;
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
	return {this.signals[31:15], '0};
endfunction : get_signals

function integer get_carry_in ();
	return this.signals[4];
endfunction : get_carry_in


function bit[3:0] get_alu_op ();
	return this.signals[3:0];
endfunction : get_alu_op

function void set_signals (int sample_val);
	this.signals=sample_val;
endfunction : set_signals


endclass




class instruction_sequencer extends uvm_sequencer#(instruction_item);
  `uvm_component_utils(instruction_sequencer)


  function new(string name="sequencer for instructions" ,uvm_component parent=null);
    super.new(name,parent);
  endfunction

endclass



class instruction_sequence extends uvm_sequence#(instruction_item);

  `uvm_object_utils(instruction_sequence)

  const int length_instr=30; //  number of instruciton to be executed
instruction_item m_itemins;
`uvm_declare_p_sequencer(instruction_sequencer)

  function new(string name="instruction sequence");
    super.new(name);
    		// we may add the open of the file for the iram 
  endfunction




  virtual task body();
    /*for (int i = 0; i < length_instr; i ++) begin
		m_itemins=instruction_item::type_id::create("m_itemins");
		//`uvm_create(m_item)
		wait_for_grant();
		if(!m_itemins.randomize()) begin 
			`uvm_error(get_type_name(), "FAILTED TO RANDOMIZE")
		end
		`uvm_info(get_type_name(), "Randomized correctly",UVM_LOW)
    	m_itemins.compose_instruction();
    	`uvm_info("SEQ", $sformatf("Generate new item: "), UVM_LOW)
		send_request(m_itemins);
		wait_for_item_done();
      	// execute a nop and then restart
      	m_itemins.force_nop();
		send_request(m_itemins);
		wait_for_item_done();
      	finish_item(m_itemins);
    end*/

	`uvm_do(m_itemins)
    `uvm_info("SEQ", $sformatf("Done generation of %0d items", length_instr), UVM_LOW)
  endtask



endclass

`endif
