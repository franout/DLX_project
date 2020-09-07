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
  virtual mem_interface iram_if;
  virtual mem_interface  dram_if;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e0 = env::type_id::create("e0", this);
    if (!uvm_config_db#(virtual DEBUG_interface)::get(this, "", "dbg_if", dbg_if))
      `uvm_fatal("TEST", "Did not get dbg_if")

      uvm_config_db#(virtual DEBUG_interface)::set(this, "e0.a0.*", "dbg_if", dbg_if);

      if (!uvm_config_db#(virtual mem_interface)::get(this, "", "iram_if", iram_if))
      `uvm_fatal("TEST", "Did not get vif")

      uvm_config_db#(virtual mem_interface)::set(this, "e0.a0.*", "iram_if", iram_if);

      if (!uvm_config_db#(virtual mem_interface)::get(this, "", "dram_if", dram_if))
      `uvm_fatal("TEST", "Did not get vif")

      uvm_config_db#(virtual mem_interface)::set(this, "e0.a0.*", "dram_if", dram_if);
  endfunction

  virtual task run_phase(uvm_phase phase);
    instruction_sequence seq = instruction_sequence::type_id::create("seq");
    phase.raise_objection(this);
    apply_reset();

  // forever until all instruction have been checked at least once from the scoreboard
  forever begin 
    wait (e0.check_all_instruction())
    if(e0.check_all_instruction()) begin 
      $display("UVM test is ended @ %d",$time());
      $finish();
    end else begin 
    seq.randomize();
    seq.start(e0.a0.s0);
    #100; // execute 10 more cc
    end 
  end

    phase.drop_objection(this);
    this.print_topology(this);
  endtask

  virtual task apply_reset();
    dbg_if.rst <= 0;
    iram_if.rst <= 0;
    dram_if.rst <= 0;
    repeat(10) @ (posedge vif.clk);
    dbg_if.rst <= 1;
    iram_if.rst <= 1;
    dram_if.rst <= 1;
    repeat(2) @ (posedge vif.clk);
  endtask

// print topology of environment
 virtual function void end_of_elaboration_phase (uvm_phase phase);
    uvm_top.print_topology (this);
  endfunction

endclass

`endif
