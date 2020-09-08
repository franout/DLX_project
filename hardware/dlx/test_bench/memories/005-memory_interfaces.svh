`ifndef __MEMORY_INTERFACES__VH
`define __MEMORY_INTERFACES__VH

`timescale 1ns/1ps

interface mem_interface
	#(parameter ADDRESS_SIZE=16,
	WORD_SIZE=32)
	 ( input wire clk);

 	 logic rst;  //  reset active low
 	 logic  [ADDRESS_SIZE-1:0] ADDRESS;
	 logic  ENABLE;
	 wire  DATA_READY;
	 wire  [WORD_SIZE-1:0]DATA;
	 logic  READNOTWRITE;
	 wire  [WORD_SIZE-1:0] INOUT_DATA;


	// for umv tb
	logic [WORD_SIZE-1:0]DATA_UVM;
	logic [WORD_SIZE-1:0]INOUT_DATA_UVM;


    clocking ram_interface @(posedge clk);
       input   #1  ADDRESS,ENABLE; // sampled after 1 time resoltuon see `timescale
       output  #1  DATA_READY,DATA;
    endclocking

    // automatic bind the cover points to the address
		covergroup address_cov () @ (posedge ENABLE iff rst);
		    addr : coverpoint ADDRESS {
		       option.auto_bin_max = 10; // max number of bins
		   }
		 endgroup
 
 		// explicitly bind the coverpoitn
      covergroup memory_rw @ (posedge READNOTWRITE or negedge READNOTWRITE);
       read_write : coverpoint READNOTWRITE {
        bins  read  = {0};
        bins  write = {1};
      }
    endgroup
    //=======
    // instantiate cover group
    
    address_cov cov_address = new();
    memory_rw cov_rw = new();

modport rw (input ADDRESS, ENABLE, READNOTWRITE,rst,clk, inout INOUT_DATA, output DATA_READY); // read write memory interface
modport ro (input ADDRESS, ENABLE, rst,clk , output DATA_READY, DATA); // read only memory interface

endinterface



`endif//__MEMORY_INTERFACES__VH
