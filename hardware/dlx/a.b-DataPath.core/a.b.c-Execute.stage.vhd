--------------------------------------------------------------------------------
-- Title       : execute stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c-Execute.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:04 2020
-- Last update : Mon Jul 27 15:22:42 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: 
--------------------------------------------------------------------------------

library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity execute_stage is
  generic (
		N       : integer := 32;
		PC_SIZE : integer := 32 -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic -- active low 
  ) ;
end entity ; -- execute_stage

architecture structural of execute_stage is

begin

-- branches



-- muxes for alu operands

-- arithmetic logical unit



-- alu register output 


-- delay register for b register (see decode stage)

end architecture ; -- structural