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

  uvm_analysis_port  #(instruction_item) mon_analysis_port;  // Open analysis port to pass data to scoreboard
  virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)) iram_if;
  virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)) dram_if;
  virtual DEBUG_interface dbg_if;

	instruction_item collected_instr;

  function new(string name="monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction


 virtual  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_analysis_port = new ("mon_analysis_port", this);
	collected_instr= new();
    if (!uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::get(this, "", "iram_if", iram_if))
      `uvm_fatal("MON", "Could not get iram_if")

  	if (!uvm_config_db#(virtual 	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE)))::get(this, "", "dram_if", dram_if))
      `uvm_fatal("MON", "Could not get dram_if")

 	if (!uvm_config_db#(virtual DEBUG_interface)::get(this, "", "dbg_if", dbg_if))
      `uvm_fatal("MON", "Could not get debug_if")


  endfunction

  virtual task run_phase(uvm_phase phase);
  	int cc=0;
    super.run_phase(phase);
  forever begin
      @ (posedge iram_if.clk);
      if (iram_if.ENABLE) begin
        collected_instr.collect_instruction(iram_if.DATA_UVM);
        `uvm_info(get_type_name(), $sformatf("Monitor found instruction %s", collected_instr.convert2str()), UVM_LOW)
        // for the next 5 cc get the debug interface signals 
		fork 
        cc=1;
        repeat (2) @ (posedge iram_if.clk);
        collected_instr.set_signals( sample_dbg(cc));
        cc=2;
        repeat (2) @ (posedge iram_if.clk);
        collected_instr.set_signals(sample_dbg(cc));
        cc=3;
        repeat (2) @ (posedge iram_if.clk);
        collected_instr.set_signals(sample_dbg(cc));
        cc=4;
        repeat (2) @ (posedge iram_if.clk);
        collected_instr.set_signals(sample_dbg(cc));
        cc=5;
        repeat (2) @ (posedge iram_if.clk);
        collected_instr.set_signals(sample_dbg(cc));
        cc=0;
        `uvm_info(get_type_name(),"Sampled debug signals", UVM_LOW)
		join
      end
       mon_analysis_port.write(collected_instr); // pass the value to scoreboard
    end
  endtask

	function integer sample_dbg(integer cc_stage);
	  bit[32-1:0] signals; 
			// depending on the current cc_state we sample different part of DEBUG interface
	case (cc_stage)
		1:begin // fetch 
			signals[31]=dbg_if.iram_ready_cu;
		end 
		2:begin // decode
			signals[30]=dbg_if.enable_rf;
			signals[29]=dbg_if.read_rf_p1;
			signals[28]=dbg_if.read_rf_p2;
			signals[27]=dbg_if.rtype_itypen;
			signals[26]=dbg_if.compute_sext;
			signals[25]=dbg_if.jump_sext;
		end
		3:begin // execute
			signals[24:24]=dbg_if.sel_val_a[0];
			signals[23:23]=dbg_if.sel_val_b[0];
			signals[22]=dbg_if.evaluate_branch[1];
			signals[21]=dbg_if.evaluate_branch[0];
			signals[20]=dbg_if.signed_notsigned;
			signals[4]=dbg_if.alu_cin;
			signals[3:0]=dbg_if.alu_operation;
		end
		4:begin // memory 
			signals[19]=dbg_if.dram_enable_cu;
			signals[18]=dbg_if.dram_r_nw_cu;
			signals[17]=dbg_if.update_pc_branch;
		end
		5:begin // write back
			signals[16]=dbg_if.select_wb[0];
			signals[15]=dbg_if.write_rf;
		end
		default : signals='0;
	endcase
	signals[14:7]= dbg_if.csr;
	signals[6]= dbg_if.rst;
	return integer'(signals);
	endfunction : sample_dbg

endclass


`endif
