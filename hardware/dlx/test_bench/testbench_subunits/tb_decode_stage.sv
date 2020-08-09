//
//					\\\ Sapere Aude ///
//
// ////////////////////////////////////////////////////////////////////////////-
// Copyright (c) 2014-2020 All rights reserved
// ////////////////////////////////////////////////////////////////////////////-
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_decode_stage.sv
// Create : 2020-07-27 15:17:46
// Revise : 2020-07-29 17:53:34
// Editor : sublime text3, tab size (4)
// Description: 
// ////////////////////////////////////////////////////////////////////////////-
`timescale 1ns/1ps
`include "../003-global_defs.svh"

`define NBIT 32

program automatic test_decode(
						input logic clk,
						output logic rst,
						output logic [`IRAM_WORD_SIZE-1:0]instruction_reg,
						output logic [`IRAM_WORD_SIZE-1:0]new_prog_counter_val,
						output logic [`NBIT-1:0]update_reg_value,
						output logic enable_rf,
						output logic read_rf_p1,
						output logic read_rf_p2,
						output logic write_rf,
						output logic [5-1:0]address_rf_write,
						output logic compute_sext,
						input logic [`NBIT-1:0]val_a,
						input logic [`IRAM_WORD_SIZE-1:0]new_prog_counter_val_exe,
						input logic [`NBIT-1:0]val_b,
						input logic [`NBIT-1:0]val_immediate,
						output logic rtype_itypen
						);
  
	// tmp data for bit reverse
  	 //bit [7:0] array[8] ;// array of 8 8 bit values
  	 bit [4:0] array ; // we just need to reverse the address of the registers use {<<{array}} and then mask properly the integer value
	integer register_index;		 // {<<8{array}}; 

	integer i;

`ifndef  VIVADO_SIM
	default clocking test_clk @ (posedge clk);
  	endclocking	// clock
`endif

initial begin
		$display("@%0dns Starting Program",$time);
		rtype_itypen=1;
		rst=0;
		enable_rf=0;
		address_rf_write=0;
		update_reg_value=0;
		compute_sext=0;
		instruction_reg=0;
		new_prog_counter_val=$urandom();
		read_rf_p2=0;
		read_rf_p1=0;
		write_rf=0;
		$display("Starting testbench for decode stge",);
		`ifndef  VIVADO_SIM
		## 1;
		`else 
		repeat(2)@(posedge clk);
		`endif
		$display("Reset stage",);
		rst=0;
		`ifndef  VIVADO_SIM
		## 1;
		`else 
		repeat(2)@(posedge clk);
		`endif
		$display("Sign extention check unsigned",);
		rst=1;
		compute_sext=1;
		instruction_reg='h12340FFF;
		`ifndef  VIVADO_SIM
		new_prog_counter_val=$urandom();
		## 1;
		`else 
		new_prog_counter_val=96523;
		repeat(2)@(posedge clk);
		`endif
		if(val_immediate!=='h0fff) begin
			$display("wrong sign extentions unsigned");
			$stop();
		end
		$display("Sign extention check signed",);
		compute_sext=1;
		instruction_reg='h12388FFF;
		`ifndef  VIVADO_SIM
		new_prog_counter_val=$urandom();
		## 1;
		`else 
		new_prog_counter_val=7896;
		repeat(2)@(posedge clk);
		`endif
		if(val_immediate!=='hffff8fff) begin 
			$display("wrong signed sign extention");
			$stop();
		end
		instruction_reg=0;
		enable_rf=1;
		$display("Read and write on the same port",);
		`ifndef  VIVADO_SIM
		$urandom_range(0,31);
		array=$urandom();
		`else 
		array=5;
		`endif
		register_index={<<{array}};
		read_rf_p1=1;
		read_rf_p2=1;
		// it is a reg to reg ops
//		instruction_reg[10:6]=register_index; 
//   	instruction_reg[15:11]=register_index+1;
		instruction_reg[25:21]=register_index; 
	   	instruction_reg[20:16]=register_index+1;
		`ifndef  VIVADO_SIM
		## 2;
		`else 
		repeat(4)@(posedge clk);
		`endif		
		if(val_a!==0 || val_b!==0) begin
			$display("Init values of register files are not zeros",);
			$stop();
		end

		// write
		read_rf_p1=0;
		read_rf_p2=0;
		write_rf=1;
	
		`ifndef  VIVADO_SIM
		array=$urandom();
		`else 
		array=3;
		`endif
		register_index={<<{array}};
		address_rf_write=register_index;
		instruction_reg[15:11]=address_rf_write;
		instruction_reg[20:16]=register_index;
		update_reg_value=159753;
		`ifndef  VIVADO_SIM
		## 3;
		`else 
		repeat(6)@(posedge clk);
		`endif
		// read again 
		read_rf_p1=1;
		write_rf=0;
		register_index=address_rf_write;
		instruction_reg[20:16]=register_index;
		`ifndef  VIVADO_SIM
		## 2;
		`else 
		repeat(4)@(posedge clk);
		`endif
		if(val_a!==159753)begin
			$display("Error in writing in the register file",);
			$stop();
		end
		$display("Random read and write",);
		for ( i=0;i<4;i++) begin
			register_index=$urandom();
			if(i%2==0) begin
				write_rf=0;
				read_rf_p1=1;
				read_rf_p2=1;	
				`ifndef  VIVADO_SIM
				array=$urandom();
				`else 
				array=i;
				`endif
				register_index={<<{array}};
				instruction_reg[10:6]=register_index; // check indexes 
				instruction_reg[15:11]=register_index+1;	
				`ifndef  VIVADO_SIM
				## 2;
				`else 
				repeat(4)@(posedge clk);
				`endif
			end else begin 
				write_rf=1;
				read_rf_p1=0;
				read_rf_p2=0;
				`ifndef  VIVADO_SIM
				array=$urandom();
				`else 
				array=i;
				`endif
				register_index={<<{array}};
				address_rf_write=register_index;
				instruction_reg[20:16]=register_index;
				update_reg_value=159753;
				`ifndef  VIVADO_SIM
				## 1;
				`else 
				repeat(2)@(posedge clk);
				`endif
			end 
			
		end
		`ifndef  VIVADO_SIM
		## 1;
		`else 
		repeat(2)@(posedge clk);
		`endif
		$display("Decode stage has passed the testbench",);
		$finish;
end 	


endprogram : test_decode


module tb_decode_stage ();
localparam clock_period= 10ns;
	logic clk;

	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end
  	// Specify the default clocking
  	default clocking test_clk @ (posedge clk);
  	endclocking	// clock


  	// signal declaration 
	wire rst;
	wire [`IRAM_WORD_SIZE-1:0]new_prog_counter_val;
	wire [`IRAM_WORD_SIZE-1:0]instruction_reg;
	wire [`NBIT-1:0]val_a;
	wire [`IRAM_WORD_SIZE-1:0]new_prog_counter_val_exe;
	wire [`NBIT-1:0]val_b;
	wire [`NBIT-1:0]val_immediate;
	wire [`NBIT-1:0]update_reg_value;
	wire enable_rf;
	wire read_rf_p1;
	wire read_rf_p2;
	wire rtype_itypen;
	wire write_rf;
	wire [5-1:0]address_rf_write; // # regs is fixed at 32
	wire compute_sext; // msb is for signed or not 

  	// property definitions
  	// ADDRESS CHECK RANGE for rf
  	property address_range(int min, int max);
  				write_rf |=> (address_rf_write>= min && address_rf_write<=max);
  	endproperty;

  	property address_equality;
  	int v_a; 
     (!$stable(address_rf_write), v_a = address_rf_write) |=> (v_a==(instruction_reg[20:16]>>4));
  		  			
  	endproperty;

  	// address  it is the same for the rf and ir
  	property address_equal_rf_ir;
  		@(test_clk) 
			disable iff(!rst || !enable_rf )
  		write_rf |=> (  address_equality and address_range(0,31) ); // address equals to the ones in the IR , check also the range
  	endproperty;

  	// read and output on the same port
	sequence read_port(port_num, val);
		port_num ##1 val;
	endsequence;
 
  	property read_p1;
  		@(test_clk)
  			disable iff(!rst|| !enable_rf || compute_sext)
			read_port(read_rf_p1 ,val_a);
  	endproperty;

  	property read_p2;
  		@(test_clk)
  			disable iff(!rst|| !enable_rf || compute_sext)
	  			read_port(read_rf_p2, val_b);
  	endproperty;

  	sequence write_rf_seq;
  		rtype_itypen ##3 write_rf;
  	endsequence;

  	property write_in_rf;
  		@(test_clk)
  			disable iff(!rst || !enable_rf || compute_sext)
  				//write_rf |=> address_rf_write;
  				rtype_itypen |-> write_rf_seq;
  	endproperty;


  	// program counter propagation to the first operand of the ALU
  	property pc_propagation;
  		 @(test_clk)
  		 	disable iff (!rst) // except for reset condition 
  		 		$changed(new_prog_counter_val)|-> $changed(new_prog_counter_val_exe );
  	endproperty;

  	/// properties instantiations

  	pc_propagation_check: assert  property (pc_propagation) else $display("Failed at %0dns pc propagation check",$time());
  	address_equal_rf_ir_check: assert  property (address_equal_rf_ir) else $display("Failed at %0dns address equal in IR and write RF",$time());
  	read_p1_check: assert property  (read_p1)else $display("Failed at %0dns Read port 1 rf",$time());
  	read_p2_check: assert property  (read_p2)else $display("Failed at %0dns Read port 2 rf",$time());
  	write_rf_check: assert property  (write_in_rf)else $display("Failed at %0dns Write port rf",$time());

  	// instantiate the uut
  	decode_stage #(
  		.N       (`NBIT) ,
		.RF_REGS (32) , //number of registers in register file component
		.IR_SIZE (`IRAM_WORD_SIZE),  //Instruction register size
		.PC_SIZE (`DRAM_WORD_SIZE)  //Program Counter Size
  		)
  	uut (
  		.clk(clk),
		.rst(rst), // active low
		// from fetch stage
		.new_prog_counter_val(new_prog_counter_val),
		.instruction_reg(instruction_reg),
		// to execute stage
		.val_a(val_a),
		.new_prog_counter_val_exe(new_prog_counter_val_exe),
		.val_b(val_b),
		.val_immediate(val_immediate),
		// from write back stage
		.update_reg_value(update_reg_value),
		// from / to control unit
		.enable_rf(enable_rf),
		.read_rf_p1(read_rf_p1),
		.read_rf_p2(read_rf_p2),
		.write_rf(write_rf),
		.rtype_itypen(rtype_itypen),
		.compute_sext(compute_sext) // signal for computing sign exention of 16bit immediate value
  		);



  	// instanatiate the test_program
  	test_decode test(
				.clk(clk),
  				.rst(rst),
  				.new_prog_counter_val(new_prog_counter_val),
  				.instruction_reg(instruction_reg),
  				.update_reg_value(update_reg_value),
  				.enable_rf(enable_rf),
				.read_rf_p1(read_rf_p1),
				.read_rf_p2(read_rf_p2),
				.write_rf(write_rf),
				.address_rf_write(address_rf_write),
				.compute_sext(compute_sext),
				.val_a(val_a),
				.new_prog_counter_val_exe(new_prog_counter_val_exe),
				.val_b(val_b),
				.val_immediate(val_immediate),
				.rtype_itypen(rtype_itypen)
  					);



endmodule
