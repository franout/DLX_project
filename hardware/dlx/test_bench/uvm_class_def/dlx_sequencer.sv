//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_sequencer.sv
// Create : 2020-09-01 21:57:14
// Revise : 2020-09-01 22:05:28
// Editor : sublime text3, tab size (4)
// Description :
// -----------------------------------------------------------------------------


`ifndef __DLX_SEQUENCER_SV
`define __DLX_SEQUENCER_SV


class reg_item extends uvm_sequence_item;
  rand bit [`ADDR_WIDTH-1:0]  	addr;
  rand bit [`DATA_WIDTH-1:0] 	wdata;
  rand bit 						wr;
  bit [`DATA_WIDTH-1:0] 		rdata;

  // Use utility macros to implement standard functions
  // like print, copy, clone, etc
  `uvm_object_utils_begin(reg_item)
  	`uvm_field_int (addr, UVM_DEFAULT)
  	`uvm_field_int (wdata, UVM_DEFAULT)
  	`uvm_field_int (rdata, UVM_DEFAULT)
  	`uvm_field_int (wr, UVM_DEFAULT)
  `uvm_object_utils_end

  virtual function string convert2str();
    return $sformatf("addr=0x%0h wr=0x%0h wdata=0x%0h rdata=0x%0h", addr, wr, wdata, rdata);
  endfunction

  function new(string name = "reg_item");
    super.new(name);
  endfunction
endclass


class gen_item_seq extends uvm_sequence;
  `uvm_object_utils(gen_item_seq)
  function new(string name="gen_item_seq");
    super.new(name);
  endfunction

  rand int num; 	// Config total number of items to be sent

  constraint c1 { soft num inside {[2:5]}; }

  virtual task body();
    for (int i = 0; i < num; i ++) begin
    	reg_item m_item = reg_item::type_id::create("m_item");
    	start_item(m_item);
    	m_item.randomize();
    	`uvm_info("SEQ", $sformatf("Generate new item: "), UVM_LOW)
    	m_item.print();
      	finish_item(m_item);
    end
    `uvm_info("SEQ", $sformatf("Done generation of %0d items", num), UVM_LOW)
  endtask
endclass


// sequencer
class base_sequence extends uvm_sequence;
	`uvm_object_utils (base_sequence)

	my_data  data_obj;
	int unsigned      n_times;

	function new (string name = "base_sequence");
		super.new (name);
	endfunction

	// Raise an objection if started as the root sequence
	virtual task pre_body ();
		if (starting_phase != null)
			starting_phase.raise_objection (this);
	endtask


	virtual task body ();
		`uvm_info ("BASE_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
		data_obj = my_data::type_id::create ("data_obj");

		repeat (n_times) begin
			start_item (data_obj);
			assert (data_obj.randomize ());
			finish_item (data_obj);
		end
		`uvm_info (get_type_name (), $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
	endtask

	// Drop objection if started as the root sequence
	virtual task post_body ();
		if (starting_phase != null)
			starting_phase.drop_objection (this);
	endtask
endclass



class my_data extends uvm_sequence_item;
	`uvm_object_utils (my_data)

	rand bit [7:0]   data;
	rand bit [7:0]   addr;

	constraint c_addr { addr > 0; addr < 8;}

 	virtual function void display ();
		`uvm_info (get_type_name (), $sformatf ("addr = 0x%0h, data = 0x%0h", addr, data), UVM_MEDIUM);
	endfunction

endclass


`endif