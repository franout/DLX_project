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
`include "./dlx_sequence_item.sv"

import uvm_pkg::*;

`include <uvm_macros.svh>
`include <uvm_pkg.sv>


class instruction_sequencer extends uvm_sequencer#(instruction_item);
  `uvm_component_utils(instruction_sequencer)


  function new(string name="sequencer for instructions" ,uvm_component parent=null);
    super.new(name,parent);
//		`uvm_update_sequence_lib_and_item(instruction_item)
  endfunction
//	`uvm_sequencer_utils(instruction_sequencer)
endclass





`endif
