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



  virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))  iram_if;
  virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)) dram_if;
//  instruction_sequencer s0;

  function new(string name = "driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction

 virtual  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::get(this, "", "iram_if", iram_if))
      `uvm_fatal("DRV", "Could not get iram_if")
	if (!uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::get(this, "", "dram_if", dram_if))
      `uvm_fatal("DRV", "Could not get dram_if")
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
	   instruction_item m_item;
      `uvm_info("DRV", $sformatf("Wait for item from sequencer"), UVM_LOW)
      seq_item_port.get_next_item(m_item);
      drive_item(m_item);
      if(m_item.get_current_instruction()===i_lw || m_item.get_current_instruction()===i_sw) begin 
      	drive_item_dram();
      end
      seq_item_port.item_done();
    end
  endtask : run_phase

  virtual task drive_item(instruction_item m_item);
      @ (posedge iram_if.clk);
      while (!iram_if.ENABLE)  begin
        `uvm_info("DRV", "Wait until enable is high", UVM_LOW)
        @(posedge iram_if.clk);
      end
		m_item.compose_instruction();
      iram_if.DATA_UVM=m_item.get_current_instruction();
	   repeat(2) @(posedge iram_if.clk);
  endtask : drive_item

  virtual task drive_item_dram();
  	  @ (posedge dram_if.clk);
      while (!dram_if.ENABLE)  begin
        `uvm_info("DRV", "Wait until enable is high for dram", UVM_LOW)
        @(posedge dram_if.clk);
      end
      if(dram_if.READNOTWRITE) begin 
      	dram_if.INOUT_DATA_UVM=$urandom_range(0,2**10);
	  end else begin 
		dram_if.INOUT_DATA_UVM='z;
      end 
      // skip the write operation 
	   repeat(2) @(posedge dram_if.clk);
  endtask : drive_item_dram

endclass


`endif
