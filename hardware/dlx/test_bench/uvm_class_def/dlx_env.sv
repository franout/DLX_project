//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_env.sv
// Create : 2020-09-01 21:55:56
// Revise : 2020-09-05 21:54:01
// Editor : sublime text3, tab size (4)
// Description :
// -----------------------------------------------------------------------------


`ifndef __DLX_ENV_SV
`define __DLX_ENV_SV
`include "./dlx_sequencer.sv"
`include "./dlx_driver.sv"
`include "./dlx_monitor.sv"
`include "./dlx_scoreboard.sv"

import uvm_pkg::*;
`include <uvm_macros.svh>
`include <uvm_pkg.sv>

// it is better to put sequencer driver and monitor into a component called agent ( agegnt is protocol dependent and can be put into different verification environment )
// active agent contains : sequencer, driver and monitor
// passive agent contains : monitor

class agent extends uvm_agent;
  `uvm_component_utils(agent)

  uvm_active_passive_enum  active = UVM_ACTIVE; // by default agent is active

  function new(string name="agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  driver 		d0; 		// Driver handle
  monitor 		m0; 		// Monitor handle
  /*the sequence does not need ot be dirivef from seqeunce class  it can be instantiated directly in the env usign the object uvm_sequencer*/
  uvm_sequencer #(instruction_item)	s0; 		// Sequencer Handle

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
// if agent is ACTIVE, then create monitor and sequencer, else create only monitor
      if (get_is_active() == UVM_ACTIVE) begin
    	s0 = uvm_sequencer#(instruction_item)::type_id::create("s0", this);
    	d0 = driver::type_id::create("d0", this);
      end
    m0 = monitor::type_id::create("m0", this);


  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    d0.seq_item_port.connect(s0.seq_item_export);
         // Assign interface handle in CFG bject to Driver and Monitor, if active
      if (get_is_active()== UVM_ACTIVE) begin 
         m_drv0.mem_if = m_cfg0.mem_if;
	  end
      m_mon0.mem_if = m_cfg0.mem_if;

      // Connect Sequencer to Driver, if the agent is active
      if (m_cfg0.active == UVM_ACTIVE) begin
         m_drv0.seq_item_port.connect (m_seqr0.seq_item_export);
      end
  endfunction
endclass



class env extends uvm_env;
  `uvm_component_utils(env)
  function new(string name="env", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  agent 		a0; 		// Agent handle
  scoreboard	sb0; 		// Scoreboard handle

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a0 = agent::type_id::create("a0", this);
    sb0 = scoreboard::type_id::create("sb0", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    a0.m0.mon_analysis_port.connect(sb0.m_analysis_imp);
  endfunction


	task run_phase (uvm_phase phase);
		set_report_verbosity_level (UVM_MEDIUM);
		uvm_report_info      (get_name(), $sformatf ("Hello UVM ! Simulation has started."), UVM_MEDIUM, `__FILE__, `__LINE__);
		`uvm_info   (get_name(), $sformatf("Finishing up with run_phase ... "), UVM_LOW)
	endtask : run_phase

	function check_all_instruction ();
		return sb0.all_instruction_checked();
	endfunction : check_all_instruction

endclass


`endif
