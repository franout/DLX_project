//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : romem.sv
// Create : 2020-07-21 19:00:01
// Revise : 2020-07-22 20:17:52
// Editor : sublime text3, tab size (4)
// Description:  Instruction memory for DLX
// 				Memory filled by a process which reads from a file
//				It  behaves like a cache, i.e. it is able to provide data in 1 cc
//				It is byte addressable
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
`include "memory_interfaces.svh"

module romem
#(parameter FILE_PATH="",	// ROM INIT data file Note: add also extension
WORD_SIZE	= 32,		 	// Number of bits per word
ADDRESS_SIZE = 16, 			// number of bits per address 
DATA_DELAY	= 2			 	// Delay ( in # of clock cycles )
)
 (
	mem_interface.ro mif // memory interface clocked by clk
);

/// internal signals
logic [WORD_SIZE-1:0]ram [0:2**ADDRESS_SIZE-1];
logic [WORD_SIZE-1:0] data_out;
logic valid;

// for file operations
// 1. Declare an integer variable to hold the file descriptor
int fd;
string line;
int index=0;
int dummy; // for removing simulation warning

// check if the path has been defined
 initial begin
 	if (FILE_PATH=="") begin 
 		$display("ERROR! PATH for read only memory is not defined!",);
 		$exit(-1);
 	end
 end


always_ff @(posedge mif.clk) begin : proc_ram
	if(!mif.rst) begin
		// fill up the memory with the init file
		
	  	// 2. Open a file called "note.txt" in the current folder with a "read" permission
		// If the file does not exist, then fd will be zero
		fd = $fopen (FILE_PATH, "r");
		if (fd) begin 
		 $display("File was opened successfully : %0d", fd);
		end else begin 
		     $display("File was NOT opened successfully : %0d", fd);
		     $exit(-1);
		end
		index=0;
		// fill up the memory 
		while (!$feof(fd)) begin
      	  dummy= $fgets(line, fd);
      	   ram[index]<=line.atohex();// save  and convert to hex value
      	   index=index+1;
	    end
    	// 3. Close the file descriptor
		$fclose(fd);
		valid<='b0;
	end else begin
		if (mif.ENABLE) begin
			valid='b1;
			data_out<=ram[mif.ADDRESS];
		end else begin 
			// memory not enabled
			valid<='b0;
		end 
	end
end


assign mif.DATA_READY= valid;
assign mif.DATA= valid ? data_out : 'Z;

endmodule


		
