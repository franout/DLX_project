//
//          \\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_test.sv
// Create : 2020-09-01 21:55:38
// Revise : 2020-09-01 21:55:38
// Editor : sublime text3, tab size (2)
// Description :
// -----------------------------------------------------------------------------


`ifndef __DLX_TEST_SV
`define __DLX_TEST_SV
`include "../003-global_defs.svh"
`include "../memories/005-memory_interfaces.svh"
`include "dlx_env.sv"

import uvm_pkg::*;
`include <uvm_macros.svh>
`include <uvm_pkg.sv>

class test extends uvm_test;
  `uvm_component_utils(test)

  function new(string name = "test dlx", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  env e0;
  virtual DEBUG_interface dbg_if;
  virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))  iram_if;
  virtual	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))  dram_if;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e0 = env::type_id::create("e0", this);
    if (!uvm_config_db#(virtual DEBUG_interface)::get(this, "", "dbg_if", dbg_if))
      `uvm_fatal("TEST", "Did not get dbg_if")

      uvm_config_db#(virtual DEBUG_interface)::set(this, "e0.a0.*", "dbg_if", dbg_if);

      if (!uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::get(this, "", "iram_if", iram_if))
      `uvm_fatal("TEST", "Did not get iram")

      uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::set(this, "e0.a0.*", "iram_if", iram_if);

      if (!uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::get(this, "", "dram_if", dram_if))
      `uvm_fatal("TEST", "Did not get dram")

      uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::set(this, "e0.a0.*", "dram_if", dram_if);
  endfunction

  virtual task run_phase(uvm_phase phase);
    instruction_sequence seq = instruction_sequence::type_id::create("s0");
    phase.raise_objection(this);
    apply_reset();

  // forever until all instruction have been checked at least once from the scoreboard
  forever begin 
    wait (e0.check_all_instruction())
    if(e0.check_all_instruction()) begin 
      $display("UVM test is ended @ %d",$time());
      $finish();
    end else begin 
    seq.start(e0.a0.s0);
    seq.randomize();
    #200; // execute 10 more cc
    end 
  end

    phase.drop_objection(this);
  endtask

  virtual task apply_reset();
    dbg_if.rst <= 0;
    iram_if.rst <= 0;
    dram_if.rst <= 0;
    repeat(10) @ (posedge iram_if.clk);
    dbg_if.rst <= 1;
    iram_if.rst <= 1;
    dram_if.rst <= 1;
    repeat(2) @ (posedge iram_if.clk);
  endtask

// print topology of environment at the end of elaboration phase
 virtual function void end_of_elaboration_phase (uvm_phase phase);
		print();
  endfunction


	function void report_phase (uvm_phase phase);
		uvm_report_server svr;
	    super.report_phase(phase);
        svr = uvm_report_server::get_server();
	  	if(svr.get_severity_count(UVM_FATAL)+svr.get_severity_count(UVM_ERROR)>0) begin
     		`uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
		    `uvm_info(get_type_name(), "----            TEST FAIL          ----", UVM_NONE)
    		`uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    	end
		else begin
		    `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
		    `uvm_info(get_type_name(), "----           TEST PASS           ----", UVM_NONE)
		    `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    	end
	endfunction : report_phase

endclass

`endif
