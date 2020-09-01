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



class test extends uvm_test;
  `uvm_component_utils(test)

  function new(string name = "test dlx", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  env e0;
  virtual reg_if vif;
  virtual 
  virtual

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e0 = env::type_id::create("e0", this);
    if (!uvm_config_db#(virtual reg_if)::get(this, "", "reg_vif", vif))
      `uvm_fatal("TEST", "Did not get vif")

      uvm_config_db#(virtual reg_if)::set(this, "e0.a0.*", "reg_vif", vif);
  endfunction

  virtual task run_phase(uvm_phase phase);
    gen_item_seq seq = gen_item_seq::type_id::create("seq");
    phase.raise_objection(this);
    apply_reset();

    seq.randomize() with {num inside {[20:30]}; };
    seq.start(e0.a0.s0);
    #200;
    phase.drop_objection(this);
  endtask

  virtual task apply_reset();
    vif.rstn <= 0;
    repeat(5) @ (posedge vif.clk);
    vif.rstn <= 1;
    repeat(10) @ (posedge vif.clk);
  endtask


// print topology of environment
 virtual function void end_of_elaboration_phase (uvm_phase phase);
    uvm_top.print_topology ();
  endfunction

endclass

`endif