//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : tb_dlx.sv
// Create : 2020-07-21 19:00:18
// Revise : 2020-07-24 19:29:13
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------

`timescale  1ns/1ps
`include "implemented_instructions.svh"

module tb_dlx ();
	localparam clock_period= 10 ns;
	logic rst_n;
	logic clk;


	initial begin
		clk = '0;
		forever #(clock_period/2) clk = ~clk;
	end

  	// Specify the default clocking
  	default clocking test_dlx @ (posedge clk);
  	
  	endclocking	// clock

/*
	-># time unit
	-> The ## operator can be used to delay execution by a specified number 
			of clocking events or clock cycles. This is same as what we
			 have seen in assertion section.
	
*/

	
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
	// check process for the instructions


	// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_dlx.fsdb");
			$fsdbDumpvars(0, "tb_dlx", "+mda", "+functions");
		end
	end


endmodule

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.ROCACHE_PKG.all;
use work.RWCACHE_PKG.all;

entity DLX_TestBench is
end DLX_TestBench;

architecture tb of DLX_TestBench is
	component ROMEM is
	generic (
		FILE_PATH	: string;				-- ROM data file
		ENTRIES		: integer := 128;		-- Number of lines in the ROM
		WORD_SIZE	: integer := 32;		-- Number of bits per word
		DATA_DELAY	: natural := 2			-- Delay ( in # of clock cycles )
	);
	port (
		CLK					: in std_logic;
		RST					: in std_logic;
		ADDRESS				: in std_logic_vector(WORD_SIZE - 1 downto 0);
		ENABLE				: in std_logic;
		DATA_READY			: out std_logic;
		DATA				: out std_logic_vector(2*WORD_SIZE - 1 downto 0)
	);
	end component;

	component RWMEM is
	generic(
			FILE_PATH: string;				-- RAM output data file
			FILE_PATH_INIT: string;			-- RAM initialization data file
			WORD_SIZE: natural := 32;		-- Number of bits per word
			ENTRIES: 	natural := 128;		-- Number of lines in the ROM
			DATA_DELAY: natural := 2		-- Delay ( in # of clock cycles )
		);
	port (
			CLK   				: in std_logic;
			RST					: in std_logic;
			ADDRESS				: in std_logic_vector(WORD_SIZE - 1 downto 0);
			ENABLE				: in std_logic;
			READNOTWRITE		: in std_logic;
			DATA_READY			: out std_logic;
			INOUT_DATA			: inout std_logic_vector(2*WORD_SIZE-1 downto 0)
		);
	end component;

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



library IEEE;

use IEEE.std_logic_1164.all;
use WORK.all;

entity tb_dlx is
end tb_dlx;

architecture TEST of tb_dlx is


    constant SIZE_IR      : integer := 32;       -- Instruction Register Size
    constant SIZE_PC      : integer := 32;       -- Program Counter Size
    constant SIZE_ALU_OPC : integer := 6;        -- ALU Op Code Word Size in case explicit coding is used
    signal Clock: std_logic := '0';
    signal Reset: std_logic := '1';

    component DLX
       generic (
       IR_SIZE      : integer := 32;       -- Instruction Register Size
       PC_SIZE      : integer := 32       -- Program Counter Size
       );  	   -- ALU_OPC_SIZE is explicit ALU Op Code Word Size
       port (
       Clk : in std_logic;
       Rst : in std_logic);                -- Active Low
    end component;
begin


        -- instance of DLX
	U1: DLX
        Generic Map (SIZE_IR, SIZE_PC) -- SIZE_ALU_OPC)   
	Port Map (Clock, Reset);
	

        PCLOCK : process(Clock)
	begin
		Clock <= not(Clock) after 0.5 ns;	
	end process;
	
	Reset <= '0', '1' after 6 ns, '0' after 11 ns, '1' after 15 ns;
       

end TEST;

-------------------------------

configuration CFG_TB of tb_dlx  is
	for TEST
	end for;
end CFG_TB;



//////////////////////
/////// sv hint //////
//////////////////////


/*synthesizable*/
interface example ();
logic banan;

modport random (output banan);
endinterface

// normally instantiated inside interfaces
clocking ran clk_event:
item list;
  endclocking ran

clocking bus @(posedge clk);
  parameter INPUT_SKEW=1;
  default inoo #10;
  input #3 banan;
  endclocking

  // program block simimlat to a module for solving race condition
  program
    helloWorld();
    initial
    begin: hello
      $display("helloWorld",);
    end

    initial
    begin: there
      $display("hello there",);
    end 
  endprogram: helloWorld

sequence d (data,en);
  (!en) #1 data=0;
endsequence

// if start match execture the next
// with |=> evaluation start in next cc otherwise it is overlapped
property p1;
  @(posedge clk) disable iff(!active)
  start |-> request ##2 (grant==1);
endproperty

  assert property (p1); // property can be concatenated with logical operators 
// inside property first_match , within and throughout
//also if then else in property


// there can be local variable and fucntion calls in property
//$rose  1 -> , $fell 0->  // used when the changes happen between 2 clock events
// $stable , $past for sample in the past


// ## number of sample edges or delay ##[1:5] it can be checkef for the next 4cc
// $ -> infinite number of cycles
// [*3] sequence of 3 events must be true for 3 consecutive cc
// [=3] sequence of 3 event which can be non consecutive [=3:5] min 3 max 4

