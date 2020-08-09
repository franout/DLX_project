--------------------------------------------------------------------------------
-- Title       : global component
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 001-global_components.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:56:15 2020
-- Last update : Sat Aug  8 15:46:44 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: package which contains all basic components from the labs of MS
-- 				the component files are in the folder ./global_components.package
--				Suggestion: Open the folder of the dlx with Sublime Text v3 in order
--						to see the declaration for each component when selected with the mouse
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.globals.all;
use work.constants.all; -- for avoiding compilation error 
use work.alu_types.all;

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

  	-- windowed register file s
  	component wrf is
 	generic (  NBITREG:    natural := 64;
 	           M:          natural := 8; -- number of global registers
 	           -- F and N must be power of two
 	           N:          natural := 4; -- number of registers in each in/out/local section
 	           F:          natural := 8); -- number of windows
 	port ( CLK: 		IN std_logic;
 	       RESET: 	IN std_logic;
 	       ENABLE: 	IN std_logic;
 	       RD1: 		IN std_logic;
 	       RD2: 		IN std_logic;
 	       WR: 		IN std_logic;
 	       ADD_WR: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1 downto 0);  -- the most significant part of the address identifies the global registers from the local one 
 	       ADD_RD1: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1  downto 0);
 	       ADD_RD2: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1  downto 0);
 	       DATAIN: 	IN std_logic_vector(NBITREG-1 downto 0);
 	       OUT1: 		OUT std_logic_vector(NBITREG-1 downto 0);
 	       OUT2: 		OUT std_logic_vector(NBITREG-1 downto 0);
 	       SUB_CALL:   IN std_logic;
 	       SUB_RET:    IN std_logic;
 	       FILL:       OUT std_logic;
 	       SPILL:      OUT std_logic;
 	       DATA_MEM_IN:   IN std_logic_vector(NBITREG-1 downto 0);
 	       DATA_MEM_OUT: OUT std_logic_vector(NBITREG-1 downto 0);
 	       READY : OUT std_logic); -- signal for the CU that defines when no memory operaions are being performed 
	end component wrf;

	-- register file 
	component register_file is
	 generic (  NBITREG: natural := 64;
	            NBITADD: natural := 5);
	 port ( CLK: 		IN std_logic;
	         RESET: 	IN std_logic;
		 ENABLE: 	IN std_logic;
		 RD1: 		IN std_logic;
		 RD2: 		IN std_logic;
		 WR: 		IN std_logic;
		 ADD_WR: 	IN std_logic_vector(NBITADD-1 downto 0);
		 ADD_RD1: 	IN std_logic_vector(NBITADD-1 downto 0);
		 ADD_RD2: 	IN std_logic_vector(NBITADD-1 downto 0);
		 DATAIN: 	IN std_logic_vector(NBITREG-1 downto 0);
	     OUT1: 		OUT std_logic_vector(NBITREG-1 downto 0);
		 OUT2: 		OUT std_logic_vector(NBITREG-1 downto 0));
	end component register_file;

	-- p4 adder
		-- hierarchy:
		-- sparse tree carry generator:
			-- propagate and generate network
			-- general propagate  and generate block
			-- general generate block 
		-- sum generator:
			-- carry select block:
				-- ripple carry adder x2:
					-- full adder
	component p4_adder IS
      GENERIC ( NBIT: integer :=8 ); -- number of bits for the adder
       PORT( a,b: IN std_logic_vector(NBIT -1 DOWNTO 0 );
                cin: IN std_logic;
               s:OUT std_logic_vector(NBIT-1 DOWNTO 0));

	END component p4_adder;

	-- mux 2x1 on nbit 
	component   mux21_nbit IS
	Generic (N: integer:= NUMBIT);
	Port (	A:	In	std_logic_vector(N-1 downto 0) ;
		B:	In	std_logic_vector(N-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(N-1 downto 0));
	end component mux21_nbit;

	-- behavioural full adder
	component FA is
	Port (  A:	In	std_logic;
	        B:	In	std_logic;
	        Ci:	In	std_logic;
	        S:	Out	std_logic;
	        Co:	Out	std_logic);
	end component FA; 

	-- basic encoder 
	component encoder IS
	PORT (y: IN std_logic_vector(2 DOWNTO 0);
	        sel:OUT std_logic_vector(2 DOWNTO 0)); 
	END component encoder;

	-- top level entity of the booth multiplier
	component boothmul IS
            GENERIC(N: integer:=32);
            PORT( multiplier, multiplicand:IN std_logic_vector(N-1 DOWNTO 0);
                   result: OUT std_logic_vector(2*N-1 DOWNTO 0));
	END component boothmul;


	-- behavioural adder 
	component  adder IS
      GENERIC ( NBIT: integer :=8 ); -- number of bits for the adder
       PORT( a,b: IN std_logic_vector(NBIT-1 DOWNTO 0 );
                cin: IN std_logic;
               s:OUT std_logic_vector(NBIT DOWNTO 0));
	END component adder;


end package global_components;

package body global_components is

end package body global_components;
