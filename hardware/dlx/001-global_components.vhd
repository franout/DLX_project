--------------------------------------------------------------------------------
-- Title       : global component
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 001-global_components.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it>
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:27:14 2020
-- Last update : Wed Jul 22 22:55:01 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: package which contains all basic components from the labs of MS
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package global_components is
	-- dummy alu declaration
	component ALU is
	  generic (N : integer := numBit);
	  port 	 ( FUNC: IN TYPE_OP;
	           DATA1, DATA2: IN std_logic_vector(N-1 downto 0);
	           OUTALU: OUT std_logic_vector(N-1 downto 0));
	end component ALU;
	
	--- a multiplexer for selection among a generic number of signals glued together 
	component  MUX_zbit_nbit IS
		Generic (	N: integer:= NUMBIT; -- number of bit for every signal
					Z: integer:= 3); -- log2 of the number of signals in input, baiscally it is the length of the selection signal 
		Port (	inputs:	In std_logic_vector(0 TO  ((2**Z)*(N))-1 ); -- one single input with the concatenantion of all input signals 
				SEL:	In std_logic_vector(Z-1 downto 0);
				Y:		Out	std_logic_vector(N-1 downto 0));
	end component MUX_zbit_nbit;

	-- register n bit 
  	component reg_nbit IS
  	generic ( n: INTEGER := numbit);
  	port (clk,reset:in std_logic;
  	    d:in std_logic_vector(N-1 DOWNTO 0);
  	      Q:out std_logic_vector(N-1 downto 0));
  	end component reg_nbit;

end package global_components;

package body global_components is

end package body global_components;