//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : dlx_scoreboard.sv
// Create : 2020-09-01 21:56:39
// Revise : 2020-09-01 22:04:42
// Editor : sublime text3, tab size (4)
// Description :
// -----------------------------------------------------------------------------


`ifndef __DLX_SCOREBOARD_SV
`define __DLX_SCOREBOARD_SV

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  function new(string name="scoreboard", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  reg_item refq[`DEPTH];
  uvm_analysis_imp #(reg_item, scoreboard) m_analysis_imp;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_analysis_imp = new("m_analysis_imp", this);
  endfunction

  virtual function write(reg_item item);
     if (item.wr) begin
        if (refq[item.addr] == null)
          refq[item.addr] = new;

        refq[item.addr] = item;
       `uvm_info(get_type_name(), $sformatf("Store addr=0x%0h wr=0x%0h data=0x%0h", item.addr, item.wr, item.wdata), UVM_LOW)
      end

        if (!item.wr) begin
          if (refq[item.addr] == null)
            if (item.rdata != 'h1234)
              `uvm_error (get_type_name(), $sformatf("First time read, addr=0x%0h exp=1234 act=0x%0h",
                                                     item.addr, item.rdata))
          	else
              `uvm_info(get_type_name(), $sformatf("PASS! First time read, addr=0x%0h exp=1234 act=0x%0h",
                                                   item.addr, item.rdata), UVM_LOW)
          else
            if (item.rdata != refq[item.addr].wdata)
              `uvm_error (get_type_name(), $sformatf("addr=0x%0h exp=0x%0h act=0x%0h",
                                                    item.addr, refq[item.addr].wdata, item.rdata))
           else
             `uvm_info(get_type_name(), $sformatf("PASS! addr=0x%0h exp=0x%0h act=0x%0h",
                       item.addr, refq[item.addr].wdata, item.rdata), UVM_LOW)
        end
  endfunction
endclass


class my_scoreboard extends uvm_scoreboard;
   `uvm_component_utils (my_scoreboard)

   `uvm_analysis_imp_decl (_data)

   uvm_analysis_imp_data    #(my_data, my_scoreboard)     data_export;    // Receive data from monitor

   function new (string name ="my_scoreboard", uvm_component parent=null);
      super.new (name, parent);
   endfunction

   virtual function void build_phase (uvm_phase phase);
      super.build_phase (phase);
      data_export   = new ("data_export", this);
   endfunction

   function void write_data (my_data data_obj);
      `uvm_info ("SCBD", "Received data item", UVM_HIGH)
      data_obj.print (uvm_default_line_printer); // object dependent
   endfunction
endclass


`endif