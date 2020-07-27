--------------------------------------------------------------------------------
-- Title       : memory stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.d.Memory.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:17 2020
-- Last update : Mon Jul 27 15:17:14 2020
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
use work.global_components.all;
use work.global.all;
entity memory_stage is
	generic (
		N       : integer := 32;
		PC_SIZE : integer := 32 -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic; -- active low 
		                    -- from fetch stage
		new_pc_value : in std_logic_vector(PC_SIZE-1 downto 0);
		-- from execute stage
		select_pc      : in std_logic_vector(0 downto 0); -- selection signal for the new value of the PC
		alu_output_val : in std_logic_vector(N-1 downto 0);
		value_to_mem   : in std_logic_vector(N-1 downto 0);
		-- to write back stage
		data_from_memory : out std_logic_vector(N-1 downto 0);
		data_from_alu    : out std_logic_vector(N-1 downto 0);
		-- control signals from CU

		-- DRAM INTERFACES 
		DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
		DRAM_ENABLE       : out   std_logic; -- it comes from the CU
		DRAM_READNOTWRITE : out   std_logic; -- it comes from the CU
		DRAM_READY        : in    std_logic; -- it goes to the control unit 
		DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0)
	) ;
end entity ; -- memory_stage

architecture structural of memory_stage is

begin


		-- mux for update the PC	
		branch_mux : MUX_zbit_nbit generic map (
			N => N,
			Z => 1 -- log2 of number of input signals
		)
		port map (
			inputs => , --- sel =0 , sel =1 
			sel    => ,
			y      =>
		);



		lmd : regN generic map (
			N => N
		)
		port map (
			clk   => ,
			reset => not(), -- reset is active low internally to the register
			d     => ,
			Q     =>
		);

end architecture ; -- structural