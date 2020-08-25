//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : rwmem.sv
// Create : 2020-07-21 19:00:09
// Revise : 2020-08-06 19:20:08
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps

`include "005-memory_interfaces.svh"

module rwmem
#(parameter FILE_PATH="",		// RAM output data file
			FILE_PATH_INIT="",	// RAM initialization data file
			WORD_SIZE= 32,		// Number of bits per word
			ADDRESS_SIZE = 16, 			// number of bits per address 
			DATA_DELAY= 2		// Delay ( in # of clock cycles )
			)
			 ( 
	 mem_interface.rw memif // memory interface clocked by clock 
);

/// internal signals
logic [WORD_SIZE-1:0] ram [0:2**ADDRESS_SIZE-1];
logic [WORD_SIZE-1:0] data_ir;
logic [WORD_SIZE-1:0] data_iw;
logic valid;
// for file operations
// 1. Declare an integer variable to hold the file descriptor
int fd;
string line;
int index=0;
int i;
integer dummy; // for removing simulation warning 


// check if the path has been defined
 initial begin
 	if (FILE_PATH=="" || FILE_PATH_INIT=="") begin 
 		$display("ERROR! PATHS for read write memory is not defined!",);
 		$exit(-1);
 	end
 end

// task for refreshing the dram output file 
task refresh_file;
		input string FILE_PATH_TASK;
		begin 
		//$display("in the task");
		fd = $fopen (FILE_PATH_TASK, "w");
		if (fd) begin 
		 $display("File was opened successfully : %0d", fd);
		end else begin 
			$display("Output File was NOT opened successfully : %0d", fd);
		    `ifndef VIVADO_SIM
		    $exit(-1);
		    `endif
		end
		// flush down the memory 
		for(i=0;i<2**ADDRESS_SIZE-1;i=i+1)begin
			$fwrite(fd, "%8h\n", ram[i]);
		end
		// 3. Close the file descriptor
		$fclose(fd);
		end
endtask : refresh_file


//always_ff @(posedge memif.clk) begin : proc_ram
always_comb begin : proc_ram
	if(!memif.rst) begin
		// fill up the memory with the init file
		
	  	// 2. Open a file called "note.txt" in the current folder with a "read" permission
		// If the file does not exist, then fd will be zero
		fd = $fopen (FILE_PATH_INIT, "r");
		if (fd) begin 
		 $display("File was opened successfully : %0d", fd);
		end else begin 
		     $display("File was NOT opened successfully : %0d", fd);
		     $exit(-1);
		end
		index=0;
		// fill up the memory 
		while (!$feof(fd) && (index <2**ADDRESS_SIZE)) begin
      	  dummy=$fgets(line, fd);
      	   ram[index]<=line.atohex();// save  and convert to hex value
      	   index=index+1;
	    end
    	// 3. Close the file descriptor
		$fclose(fd);
		valid<='b0;
	end else begin
		if (memif.ENABLE) begin
			if(memif.READNOTWRITE) begin // read operation 
				// byte selection
				case (memif.ADDRESS[1:0])
					2'b01: data_ir<=ram[memif.ADDRESS][8:0];// byte access
					2'b10: data_ir<=ram[memif.ADDRESS][16:0];// half word access
					default: data_ir<=ram[memif.ADDRESS];// word access 
				endcase;
				valid='b1;
			end else begin  // write operation
				data_ir<='Z;
				// byte selection
				case (memif.ADDRESS[1:0])
					2'b01: ram[memif.ADDRESS]<=data_iw[8:0];// byte access
					2'b10: ram[memif.ADDRESS]<=data_iw[16:0];// half word access
					default: ram[memif.ADDRESS]<=data_iw; // word access
				endcase;
				// refresh the content of the output file
				fork 
					refresh_file(FILE_PATH);
				join_none
				valid<='b1;
			end 
		end
	end
end

assign memif.DATA_READY= memif.ENABLE? valid: '0;


assign data_iw= ~memif.READNOTWRITE && memif.ENABLE? memif.INOUT_DATA :'Z;
assign memif.INOUT_DATA = memif.READNOTWRITE  && memif.ENABLE? data_ir :'Z;

endmodule : rwmem
