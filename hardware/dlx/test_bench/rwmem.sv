//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : rwmem.sv
// Create : 2020-07-21 19:00:09
// Revise : 2020-07-21 19:03:52
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
interface rwmem_interface (
input logic  [WORD_SIZE - 1:0]ADDRESS,
input logic  ENABLE,
input logic  READNOTWRITE,
output logic  DATA_READY,
			INOUT_DATA			: inout std_logic_vector(2*WORD_SIZE-1 downto 0)
	);
endinterface


module rwmem
#(parameter FILE_PATH="",		// RAM output data file
			FILE_PATH_INIT="",	// RAM initialization data file
			WORD_SIZE= 32,		// Number of bits per word
			ENTRIES= 128,		// Number of lines in the ROM
			DATA_DELAY= 2		// Delay ( in # of clock cycles )
			)
			 (
	input clk,    // Clock
	input rst,  //  reset active low
	
);

endmodule