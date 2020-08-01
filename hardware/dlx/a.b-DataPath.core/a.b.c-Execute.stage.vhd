--------------------------------------------------------------------------------
-- Title       : execute stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c-Execute.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:04 2020
-- Last update : Sat Aug  1 18:30:50 2020
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
use work.globals.all;
use work.global_components.all;

entity execute_stage is
	generic (
		N       : integer := 32;
		PC_SIZE : integer := 32 -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic; -- active low 
		-- from decode stage
		val_a                    : in std_logic_vector(N-1 downto 0);
		val_b                    : in std_logic_vector(N-1 downto 0);
		val_immediate            : in std_logic_vector(N-1 downto 0);
		new_prog_counter_val_exe : in std_logic_vector(PC_SIZE-1 downto 0);
		-- to memory stage
		branch_condition      : out std_logic_vector(0 downto 0);
		prog_counter_forwaded : out std_logic_vector(PC_SIZE-1 downto 0 );
		alu_output_val        : out std_logic_vector(N-1 downto 0);
		value_to_mem          : out std_logic_vector(N-1 downto 0);
		-- to/from control unit
		alu_op_type     : in std_logic_vector( 2 downto 0 );
		sel_val_a       : in std_logic_vector(0 downto 0);
		sel_val_b       : in std_logic_vector(0 downto 0);
		evaluate_branch : in std_logic

	) ;
end entity ; -- execute_stage

architecture structural of execute_stage is

signal rstn: std_logic;

begin
	rstn<=not(rst);
	-- branches
	-- zero check logic 


	-- condition register delay


	-- muxes for alu operands
	-- first operand


	-- second operand
	-- arithmetic logical unit



	-- alu register output 


	-- delay register for b register (see decode stage)



	-- delay register for pc


end architecture ; -- structural