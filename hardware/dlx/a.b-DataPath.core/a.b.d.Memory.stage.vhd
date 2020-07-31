--------------------------------------------------------------------------------
-- Title       : memory stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.d.Memory.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:17 2020
-- Last update : Fri Jul 31 17:44:12 2020
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
use work.globals.all;


entity memory_stage is
	generic (
		N       : integer := 32;
		PC_SIZE : integer := 32 -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic;
		-- from fetch stage
		new_pc_value : in std_logic_vector(PC_SIZE-1 downto 0);
		-- to fetch stage
		new_pc_value_branch : out std_logic_vector(PC_SIZE-1 downto 0);
		-- from execute stage
		select_pc      : in std_logic_vector(0 downto 0); -- selection signal for the new value of the PC
		alu_output_val : in std_logic_vector(N-1 downto 0);
		value_to_mem   : in std_logic_vector(N-1 downto 0);
		-- to write back stage
		data_from_memory : out std_logic_vector(N-1 downto 0);
		data_from_alu    : out std_logic_vector(N-1 downto 0);
		-- control signals from CU
		dram_enable_cu : in  std_logic;
		dram_r_nw_cu   : in  std_logic;
		dram_ready_cu  : out std_logic;
		-- DRAM INTERFACES 
		DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
		DRAM_ENABLE       : out   std_logic; -- it comes from the CU
		DRAM_READNOTWRITE : out   std_logic; -- it comes from the CU
		DRAM_READY        : in    std_logic; -- it goes to the control unit 
		DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0)
	) ;
end entity ; -- memory_stage

architecture structural of memory_stage is
	signal data_ir : std_logic_vector(data_size-1 downto 0);

	signal data_mux_i : std_logic_vector(PC_SIZE*2-1 downto 0);
	signal rstn       : std_logic;
begin

	rstn <= not(rst); -- reset is active high internally to the registers

	-- concantenate the data
	data_mux_i <= new_pc_value & alu_output_val;
		-- mux for update the PC	
		branch_mux : MUX_zbit_nbit generic map (
			N => N,
			Z => 1 -- log2 of number of input signals
		)
		port map (
			inputs => data_mux_i, --- sel =0 , sel =1 
			sel    => select_pc ,
			y      => new_pc_value_branch
		);



		lmd : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => data_ir,
			Q     => data_from_memory
		);

		-- to write back stage 
		-- delay register for data from alu
		delay_regg : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => alu_output_val,
			Q     => data_from_alu
		);

	DRAM_ADDRESS      <= alu_output_val( dram_address_size-1 downto 0 ); -- computed address, dllx is computing memory addresses on 32 bit. however 32 bit in sv for the memory cause an overflow so it is 16 bit address
	DRAM_ENABLE       <= dram_enable_cu;
	DRAM_READNOTWRITE <= dram_r_nw_cu;
	dram_ready_cu     <= DRAM_READY;


	data_ir <= DRAM_DATA when dram_r_nw_cu='1' ;

	DRAM_DATA <= value_to_mem when dram_r_nw_cu='0' else (OTHERS => 'Z');

end architecture ; -- structural
