--------------------------------------------------------------------------------
-- Title       : myTypes
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 000-globals.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it>
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 20:46:26 2020
-- Last update : Wed Jul 22 22:51:22 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: global constants, functions and  definitions for the dlx
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package myTypes is

	type aluOp is (
		NOP, ADDS, LLS, LRS --- to be completed
			);
	-- see also implemented_instruction.svh in ./test_bench
	type instruction is (

		);

	--TODO add the log2 funcion 
end myTypes;

