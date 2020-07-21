//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx.sv
// Create : 2020-07-21 19:00:18
// Revise : 2020-07-21 19:27:30
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ps/1ns
`include "implemented_instructions.svh"

module tb_dlx ();
	logic rstb;
	logic srst;
	logic clk;

	// clock
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end

	// reset
	initial begin
		rstb <= '0;
		srst <= '0;
		#20
		rstb <= '1;
		repeat (5) @(posedge clk);
		srst <= '1;
		repeat (1) @(posedge clk);
		srst <= '0;
	end

	// instantiate the components
	// Instruction memory

	// Data memory

	//DLX top level entity


	initial begin
		$display("Attention!!",);
		$display("Starting a very fancy testbench in System Verilog",);


		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_tb_dlx.fsdb");
			$fsdbDumpvars(0, "tb_tb_dlx", "+mda", "+functions");
		end
	end


endmodule



entity DLX_TestBench is
end DLX_TestBench;

architecture tb of DLX_TestBench is


	component DLX is
		port (
			-- Inputs
			CLK						: in std_logic;		-- Clock
			RST						: in std_logic;		-- Reset:Active-High

			IRAM_ADDRESS			: out std_logic_vector(Instr_size - 1 downto 0);
			IRAM_ISSUE				: out std_logic;
			IRAM_READY				: in std_logic;
			IRAM_DATA				: in std_logic_vector(2*Data_size-1 downto 0);

			DRAM_ADDRESS			: out std_logic_vector(Instr_size-1 downto 0);
			DRAM_ISSUE				: out std_logic;
			DRAM_READNOTWRITE		: out std_logic;
			DRAM_READY				: in std_logic;
			DRAM_DATA				: inout std_logic_vector(2*Data_size-1 downto 0)
		);
	end component;

	signal CLK :				std_logic := '0';		-- Clock
	signal RST :				std_logic;		-- Reset:Active-Low
	signal IRAM_ADDRESS :		std_logic_vector(Instr_size - 1 downto 0);
	signal IRAM_ENABLE :		std_logic;
	signal IRAM_READY :			std_logic;
	signal IRAM_DATA :			std_logic_vector(2*Data_size-1 downto 0);

	signal DRAM_ADDRESS :		std_logic_vector(Instr_size-1 downto 0);
	signal DRAM_ENABLE :		std_logic;
	signal DRAM_READNOTWRITE :	std_logic;
	signal DRAM_READY :			std_logic;
	signal DRAM_DATA :			std_logic_vector(2*Data_size-1 downto 0);

begin
	-- IRAM
	IRAM : ROMEM
		generic map ("/home/gandalf/Desktop/dlx/rocache/hex.txt")
		port map (CLK, RST, IRAM_ADDRESS, IRAM_ENABLE, IRAM_READY, IRAM_DATA);

	-- DRAM
	DRAM : RWMEM
		generic map ("/home/gandalf/Desktop/dlx/rwcache/hex_init.txt","/home/gandalf/Desktop/dlx/rwcache/hex.txt")
		port map ( CLK, RST, DRAM_ADDRESS, DRAM_ENABLE, DRAM_READNOTWRITE, DRAM_READY, DRAM_DATA );

	-- DLX
	My_DLX_GIANLUCA : DLX
		port map ( CLK, RST, IRAM_ADDRESS, IRAM_ENABLE, IRAM_READY, IRAM_DATA, DRAM_ADDRESS, DRAM_ENABLE, DRAM_READNOTWRITE, DRAM_READY, DRAM_DATA );

	Clk <= not Clk after 10 ns;
	Rst <= '1', '0' after 5 ns;
	
end tb;

