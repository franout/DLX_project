//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_sequence.sv
// Create : 2020-09-01 21:57:14
// Revise : 2020-09-04 16:48:39
// Editor : sublime text3, tab size (4)
// Description : it contains the test program 
// -----------------------------------------------------------------------------


`ifndef __DLX_SEQUENCE_SV
`define __DLX_SEQUENCE_SV
`include "../003-global_defs.svh"
`include "../004-implemented_instructions.svh"
`include "dlx_sequencer.sv"
`include "./dlx_sequence_item.sv"

import uvm_pkg::*;

`include <uvm_macros.svh>
`include <uvm_pkg.sv>


class instruction_sequence extends uvm_sequence#(instruction_item);
	`uvm_object_utils(instruction_sequence)
	`uvm_declare_p_sequencer(instruction_sequencer)
//	`uvm_sequence_utils(instruction_sequence,instruction_sequencer)
  const int length_instr=30; //  number of instruciton to be executed
  	instruction_item m_itemins;


  function new(string name="instruction sequence");
    super.new(name);
    		// we may add the open of the file for the iram 

  endfunction


  virtual task body();  
	  m_itemins=instruction_item::type_id::create("m_itemins");
	//for (int i = 0; i < length_instr; i ++) begin
	repeat(length_instr) begin 
    	`uvm_info("SEQ", $sformatf("Generate new item: "), UVM_LOW)
		start_item(m_itemins);
		if(!m_itemins.randomize()) begin 
			`uvm_error(get_type_name(), "FAILTED TO RANDOMIZE")
		end else begin 
		`uvm_info(get_type_name(), "Randomized correctly",UVM_LOW)
		end
      	finish_item(m_itemins);
    end
    `uvm_info("SEQ", $sformatf("Done generation of %0d items", length_instr), UVM_LOW)
  endtask



endclass

`endif
