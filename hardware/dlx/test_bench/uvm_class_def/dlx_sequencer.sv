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
  `uvm_object_utils(instruction_item)

  bit[32-1:0] signals; 
  bit[`IRAM_WORD_SIZE-1:0] current_instruction;
  randc instructions_opcode current_opcode;
  rand bit[5-1:0] rd;
  rand bit[5-1:0] rs1;
  rand bit[5-1:0] rs2;
  rand bit[15:0] immediate;
  rand bit[25:0] jump_address;
  randc instructions_regtype_opcode current_opcode_func;

	virtual  DEBUG_interface dbg_if;

    constraint c1 { soft rd inside {[1:31]}; }
    constraint c2 { soft rs1 inside {[0:30]}; }
    constraint c3 { soft rs2 inside {[0:30]}; }

  function void compose_instruction(); // it is actually the set curret instruction 
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
/*	if (!uvm_config_db#(virtual DEBUG_interface)::get(this, "", "dbg_if", dbg_if)) begin	
      //`uvm_error("instruction_item", "Did not get dbg_if")
	end*/
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

function void set_signals (int cc_stage);
	// depending on the current cc_state we sample different part of DEBUG interface
	case (cc_stage)
		1:begin // fetch 
			this.signals[31]=dbg_if.iram_ready_cu;
		end 
		2:begin // decode
			this.signals[30]=dbg_if.enable_rf;
			this.signals[29]=dbg_if.read_rf_p1;
			this.signals[28]=dbg_if.read_rf_p2;
			this.signals[27]=dbg_if.rtype_itypen;
			this.signals[26]=dbg_if.compute_sext;
			this.signals[25]=dbg_if.jump_sext;
		end
		3:begin // execute
			this.signals[24:24]=dbg_if.sel_val_a[0];
			this.signals[23:23]=dbg_if.sel_val_b[0];
			this.signals[22]=dbg_if.evaluate_branch[1];
			this.signals[21]=dbg_if.evaluate_branch[0];
			this.signals[20]=dbg_if.signed_notsigned;
			this.signals[4]=dbg_if.alu_cin;
			this.signals[3:0]=dbg_if.alu_operation;
		end
		4:begin // memory 
			this.signals[19]=dbg_if.dram_enable_cu;
			this.signals[18]=dbg_if.dram_r_nw_cu;
			this.signals[17]=dbg_if.update_pc_branch;
		end
		5:begin // write back
			this.signals[16]=dbg_if.select_wb[0];
			this.signals[15]=dbg_if.write_rf;
		end
		default : this.signals='0;
	endcase
	this.signals[14:7]= dbg_if.csr;
	this.signals[6]= dbg_if.rst;
endfunction : set_signals


endclass


class instruction_sequence extends uvm_sequence#(instruction_item);

  `uvm_object_utils(instruction_sequence)

  const int length_instr=30; //  number of instruciton to be executed

  function new(string name="sequence of instructions");
    super.new(name);
    		// we may add the open of the file for the iram 
  endfunction


	// Raise an objection if started as the root sequence
	virtual task pre_body ();
		if (starting_phase != null)
			starting_phase.raise_objection (this);
	endtask


  virtual task body();
    for (int i = 0; i < length_instr; i ++) begin
    	instruction_item m_item = instruction_item::type_id::create("instruction");
    	start_item(m_item);
   		if(!m_item.randomize()) begin 
			`uvm_error(get_type_name(), "FAILTED TO RANDOMIZE")
		end 
    	m_item.compose_instruction();
    	`uvm_info("SEQ", $sformatf("Generate new item: "), UVM_LOW)
    	m_item.print();
      	// execute a nop and then restart
      	m_item.force_nop();
      	finish_item(m_item);
    end
    `uvm_info("SEQ", $sformatf("Done generation of %0d items", length_instr), UVM_LOW)
  endtask


	// Drop objection if started as the root sequence
	virtual task post_body ();
		if (starting_phase != null)
			starting_phase.drop_objection (this);
	endtask

endclass


class instruction_sequencer extends uvm_sequencer#(instruction_item);
  `uvm_object_utils(instruction_sequencer)


  function new(string name="sequencer of instructions");
    super.new(name);
  endfunction


endclass

`endif
