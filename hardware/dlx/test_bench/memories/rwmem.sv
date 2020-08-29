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
// Description: sample the address and the write value on posedge kick out the value read at negedge
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
logic [WORD_SIZE/4-1:0] ram [0:2**ADDRESS_SIZE*4-1];
logic [WORD_SIZE-1:0] data_ir;
logic [WORD_SIZE-1:0] data_iw;
logic valid;
logic r_w;
logic enable;
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
		 $display("File was opened successfully : %0d --> Refreshing dram memory file", fd);
		end else begin 
			$display("Output File was NOT opened successfully : %0d", fd);
		    `ifndef VIVADO_SIM
		    $exit(-1);
		    `endif
		end
		// flush down the memory 
		for(i=0;i<2**ADDRESS_SIZE*4-1;i=i+1)begin
			$fwrite(fd, "%8h\n", ram[i]);
		end
		// 3. Close the file descriptor
		$fclose(fd);
		end
endtask : refresh_file

/* sample address and save into memory */
always_ff @(posedge memif.clk or negedge memif.clk) begin : proc_ram_s
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
		while (!$feof(fd) && (index <2**ADDRESS_SIZE*4)) begin
      	  dummy=$fgets(line, fd);
      	   {ram[index],ram[index+1],ram[index+2],ram[index+3]}<=line.atohex();// save  and convert to hex value
      	   index=index+4;
	    end
    	// 3. Close the file descriptor
		$fclose(fd);
		valid<='b0;
		r_w<='1;
		enable<='0;
	end else begin
		if (memif.ENABLE) begin
			if(memif.READNOTWRITE ) begin // read operation 
				// byte selection
				r_w<='1;
				enable<='1;
				if(memif.ADDRESS >= 2**ADDRESS_SIZE*4-1) begin 
						data_ir<='0;
				end else begin 
				case (memif.ADDRESS[1:0])
					2'b01: data_ir<={24'd0,ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+3]};// byte access
					2'b10: data_ir<={16'd0,ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+2],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+3]};// half word access
					default: data_ir<={ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+1],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+2],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+3]};// word access 
						
				endcase;
				end
				valid='b1;
				
			end else if (!memif.READNOTWRITE  )  begin  // write operation
				data_ir<='Z;
				enable<='1;
					r_w<='0;
				if(memif.ADDRESS <= 2**ADDRESS_SIZE*4-1) begin 
				// byte selection
				case (memif.ADDRESS[1:0])
					2'b01: ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+3]<=data_iw[8:0];// byte access
					2'b10: {ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+2],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+3]}<=data_iw[16:0];// half word access
					default: {ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+1],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+2],ram[{memif.ADDRESS[ADDRESS_SIZE-1:2],2'b00}+3]}<=data_iw; // word access
				endcase;
				// refresh the content of the output file
				fork 
					refresh_file(FILE_PATH);
				join_none
				end
				valid<='b1;
			end 
		end else begin 
			enable<='0;
			valid<='0;
			data_ir<='0;
			r_w<='1;
		end 
	end
end



assign memif.DATA_READY=valid;

assign data_iw= ~memif.READNOTWRITE  && memif.ENABLE ? memif.INOUT_DATA :'Z; // cause it sample directly when we have the address
assign memif.INOUT_DATA = 	r_w && enable ? data_ir :'Z; // one cc of delay

endmodule : rwmem
