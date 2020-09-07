//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_monitor.sv
// Create : 2020-09-01 21:56:48
// Revise : 2020-09-05 19:44:48
// Editor : sublime text3, tab size (4)
// Description :
// -----------------------------------------------------------------------------


`ifndef __DLX_MONITOR_SV
`define __DLX_MONITOR_SV
`include "../memories/005-memory_interfaces.svh"
`include "../003-global_defs.svh"
`include "./dlx_sequencer.sv"

import uvm_pkg::*;
`include <uvm_macros.svh>
`include <uvm_pkg.sv>

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  function new(string name="monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  uvm_analysis_port  #(instruction_item) mon_analysis_port;  // Open analysis port to pass data to scoreboard
  virtual mem_interface iram_if;
  virtual mem_interface dram_if;
  virtual DEBUG_interface dbg_if;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual mem_interface)::get(this, "", "iram_if", iram_if))
      `uvm_fatal("MON", "Could not get iram_if")

  	if (!uvm_config_db#(virtual mem_interface)::get(this, "", "iram_if", dram_if))
      `uvm_fatal("MON", "Could not get dram_if")

 	if (!uvm_config_db#(virtual DEBUG_interface)::get(this, "", "dbg_if", dbg_if))
      `uvm_fatal("MON", "Could not get debug_if")
    mon_analysis_port = new ("mon_analysis_port", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
  	int cc=0;
    super.run_phase(phase);
    forever begin
      @ (posedge iram_if.clk);
      if (iram_if.ENABLE) begin
        instruction_item item = new;
        item.current_instruction=iram_if.DATA;
        `uvm_info(get_type_name(), $sformatf("Monitor found instruction %s", item.convert2str()), UVM_LOW)
        // for the next 5 cc get the debug interface signals 
       	//  mayve add a fork 
        cc=1;
        repeat (2) @ (posedge iram_if.clk);
        item.set_signals( cc);
        cc=2;
        repeat (2) @ (posedge iram_if.clk);
        item.set_signals(cc);
        cc=3;
        repeat (2) @ (posedge iram_if.clk);
        item.set_signals( cc);
        cc=4;
        repeat (2) @ (posedge iram_if.clk);
        item.set_signals( cc);
        cc=5;
        repeat (2) @ (posedge iram_if.clk);
        item.set_signals(cc);
        cc=0;
        mon_analysis_port.write(item); // pass the value to scoreboard
      end
    end
  endtask
endclass


`endif
