//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_driver.sv
// Create : 2020-09-01 21:57:00
// Revise : 2020-09-05 18:01:43
// Editor : sublime text3, tab size (4)
// Description :
// -----------------------------------------------------------------------------



`ifndef __DLX_DRIVER_SV
`define __DLX_DRIVER_SV
`include "../memories/005-memory_interfaces.svh"
`include "./dlx_sequencer.sv"
import uvm_pkg::*;
`include <uvm_macros.svh>
`include <uvm_pkg.sv>


class driver extends uvm_driver #(instruction_item);
  `uvm_component_utils(driver)
  function new(string name = "driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual mem_interface  iram_if;
  virtual mem_interface  dram_if;
  instruction_sequence s0;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual mem_interface)::get(this, "", "iram_if", iram_if))
      `uvm_fatal("DRV", "Could not get iram_if")
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      instruction_item m_item;
      `uvm_info("DRV", $sformatf("Wait for item from sequencer"), UVM_LOW)
      s0.get_next_item(m_item);
      drive_item(m_item);
      if(m_item.get_current_instruction()===i_lw || m_item.get_current_instruction()===i_sw) begin 
      	drive_item_dram();
      end
      s0.item_done();
    end
  endtask

  virtual task drive_item(instruction_item m_item);
      @ (posedge iram_if.clk);
      while (!iram_if.ENABLE)  begin
        `uvm_info("DRV", "Wait until enable is high", UVM_LOW)
        @(posedge vif.clk);
      end
      iram_if.DATA=m_item.get_current_instruction();
  endtask

  virtual task drive_item_dram();
  	  @ (posedge dram_if.clk);
      while (!dram_if.ENABLE)  begin
        `uvm_info("DRV", "Wait until enable is high for dram", UVM_LOW)
        @(posedge dram_if.clk);
      end
      if(dram_if.READNOTWRITE) begin 
      	dram_if.INOUT_DATA=$urandom_range(0,2**10);
      end 
      // skip the write operation 
  endtask

endclass


`endif
