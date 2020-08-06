//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_datapath.sv
// Create : 2020-07-27 15:16:24
// Revise : 2020-08-06 19:12:03
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "../003-global_defs.svh"

program test_datapath(output logic rst,mem_interface.ro iram_if , mem_interface.rw dram_if);


  	default clocking test_clk @ (posedge iram_if.clk); // it is the same clock for dram
  	endclocking	// clock

	initial begin 
		$display("@%0dns Starting Program",$time);
		##1;
		$display("Starting integration testbench for datapath",);
		$urandom_range(0,2**`IRAM_SIZE);



		##3;
		$display("Datapath has passed the testbench!",);
		$finish;

	end 

endprogram : test_datapath

module tb_datapath ();
localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock
  	// property definitions


  	// property instantiation 

  	// memory interfaces
	mem_interface #(.ADDRESS_SIZE(`DRAM_ADDRESS_SIZE),
			.WORD_SIZE(`DRAM_WORD_SIZE))
	dram_if (.clk(clk));

	mem_interface #(.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.WORD_SIZE(`IRAM_WORD_SIZE)) 
	iram_if ( .clk(clk));

	// instantiate the dut and connect the interface
	romem #(.FILE_PATH   ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE   (`IRAM_WORD_SIZE),
		.ADDRESS_SIZE(`IRAM_ADDRESS_SIZE),
		.DATA_DELAY  (2)) 
		iram
	(.mif(iram_if));
		
	rwmem #(
		.FILE_PATH     ("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem_out.txt"), // it should update the existing file
		.FILE_PATH_INIT("/home/ms20.50/Desktop/DLX_project/hardware/dlx/test_bench/memories/test_mem.txt"),
		.WORD_SIZE     (`DRAM_WORD_SIZE),
		.ADDRESS_SIZE  (`DRAM_ADDRESS_SIZE),
		.DATA_DELAY    (2))
	dram ( .memif(dram_if));



  	// unit under test
  	DATAPATH #(
  		.N(`NUMBIT),
  		.RF_REGS(`RF_REGS),
  		.IR_SIZE(`IRAM_WORD_SIZE),
  		.PC_SIZE(`IRAM_ADDRESS_SIZE)
  		) 
  	uut 
  	(
		.clk(clk),
		.rst(rst),
		// iram interface
		.IRAM_ADDRESS(iram_if.ADDRESS),
		.IRAM_ENABLE(iram_if.ENABLE),
		.IRAM_READY(iram_if.DATA_READY),
		.IRAM_DATA(iram_if.DATA),
		// dram interface
		.DRAM_ADDRESS      (dram_if.ADDRESS),
		.DRAM_ENABLE       (dram_if.ENABLE),
		.DRAM_READNOTWRITE (dram_if.READNOTWRITE),
		.DRAM_READY        (dram_if.DATA_READY),
		.DRAM_DATA         (dram_if.INOUT_DATA),
		// control unit interface, signals from/to control unit 
		// for fetch stage
		.iram_enable_cu	(iram_enable_cu	),
		.iram_ready_cu	(iram_ready_cu	),
		.curr_instruction_to_cu (curr_instruction_to_cu), // RECHEC
		// for decode stage
		.enable_rf      (enable_rf),
		.read_rf_p1     (read_rf_p1),
		.read_rf_p2     (read_rf_p2),
		.write_rf       (write_rf),
		.address_rf_write (address_rf_write),
		.compute_sext  (compute_sext),
		// for execute stage
		.alu_op_type(alu_op_type), // todo
		.sel_val_a(sel_val_a),
		.sel_val_b(sel_val_b),
		.evaluate_branch(evaluate_branch),
		// for memory stage
		.dram_enable_cu(dram_enable_cu),
		.dram_r_nw_cu(dram_r_nw_cu),
		.dram_ready_cu(dram_ready_cu),
		// for write back stage   
		.select_wb(select_wb)
	);

  	// test program 
  	test_datapath test(rst,.dram_if(dram_if),
  						.iram_if(iram_if));
endmodule
