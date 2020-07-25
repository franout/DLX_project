//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : rwmem.sv
// Create : 2020-07-21 19:00:09
// Revise : 2020-07-25 15:44:25
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
interface rwmem_interface
#(parameter ADDRESS_SIZE=16,
	WORD_SIZE=32) 
(input logic clk);
 logic rst;  //  reset active low
 logic  [ADDRESS_SIZE - 1:0]ADDRESS;
 logic  ENABLE;
 logic  READNOTWRITE;
 logic  DATA_READY;
 logic [WORD_SIZE-1:0] INOUT_DATA;
 // clocking block
 // sampled after 1 time resoltuon see timescale
    clocking ram_interface @(posedge clk);
       input   #1  ADDRESS,ENABLE,READNOTWRITE; 
       inout   #1 INOUT_DATA;
       output  #1  DATA_READY;
    endclocking 
modport tb (input ADDRESS, ENABLE, READNOTWRITE,rst,inout INOUT_DATA, output DATA_READY);
endinterface



module rwmem
#(parameter FILE_PATH="",		// RAM output data file
			FILE_PATH_INIT="",	// RAM initialization data file
			WORD_SIZE= 32,		// Number of bits per word
			ADDRESS_SIZE = 16, 			// number of bits per address 
			DATA_DELAY= 2		// Delay ( in # of clock cycles )
			)
			 ( 
	 rwmem_interface.tb memif // memory interface clocked by clock 
);

/// internal signals
logic [WORD_SIZE-1:0] ram [0:2**ADDRESS_SIZE-1];
logic [WORD_SIZE-1:0] data_i;
logic valid;
// for file operations
// 1. Declare an integer variable to hold the file descriptor
int fd;
string line;
int index=0;
int i;

// task for refreshing the dram output file 
task refresh_dram();
		fd = $fopen (FILE_PATH, "w");
		if (fd) begin 
		 $display("File was opened successfully : %0d", fd);
		end else begin 
			$display("File was NOT opened successfully : %0d", fd);
		    exit(-1);
		end
		// flush down the memory 
		for(i=0;i<2**ADDRESS_SIZE-1;i=i+1)begin
			$fdisplay (fd, "%8h", ram[i]);
		end
		// 3. Close the file descriptor
		$fclose(fd);
endtask : refresh_dram


always_ff @(posedge memif.clk) begin : proc_ram
	if(!memif.rst) begin
		// fill up the memory with the init file
		
	  	// 2. Open a file called "note.txt" in the current folder with a "read" permission
		// If the file does not exist, then fd will be zero
		fd = $fopen (FILE_PATH_INIT, "r");
		if (fd) begin 
		 $display("File was opened successfully : %0d", fd);
		end else begin 
		     $display("File was NOT opened successfully : %0d", fd);
		     exit(-1);
		end
		index=0;
		// fill up the memory 
		while (!$feof(fd)) begin
      	  $fgets(line, fd);
      	   ram[index]<=line.atohex();// save  and convert to hex value
      	   index=index+1;
	    end
    	// 3. Close the file descriptor
		$fclose(fd);
		valid<='b0;
	end else begin
		if (memif.ENABLE) begin
			if(memif.READNOTWRITE) begin // read operation 
				data_i<=ram[memif.ADDRESS];
				valid='b1;
			end else begin  // write operation 
				ram[memif.ADDRESS]<=data_i;
				valid<='b1;
			end 
		end
	end
end


refresh_dram();

assign memif.DATA_READY= valid;
assign data_i= memif.READNOTWRITE ? memif.INOUT_DATA : {WORD_SIZE{'bZ}};
assign memif.INOUT_DATA = ~memif.READNOTWRITE ? data_i : {WORD_SIZE{'bZ}};

endmodule : rwmem