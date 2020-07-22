//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_memories.sv
// Create : 2020-07-22 20:19:53
// Revise : 2020-07-22 20:24:30
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------


module tb_memories ();
	logic clk;
	logic reset_n;




	initial begin 
		$display("Starting testbench for memories",);


		$finish()
	end

// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_memories.fsdb");
			$fsdbDumpvars(0, "tb_memories", "+mda", "+functions");
		end
	end


endmodule