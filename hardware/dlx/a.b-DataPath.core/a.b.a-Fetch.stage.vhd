--------------------------------------------------------------------------------
-- Title       : Fetch stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.a-Fetch.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:59:30 2020
-- Last update : Sun Aug 30 22:59:03 2020
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

entity fetch_stage is
	generic (
		IR_SIZE : integer := 32; -- Instruction Register Size
		PC_SIZE : integer := 32  -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic;
		--from  memory stage
		new_pc_value_mem_stage : in std_logic_vector(PC_SIZE-1 downto 0);
		branch_taken           : in std_logic;
		-- to decode stage
		new_pc_value : out std_logic_vector(PC_SIZE-1 downto 0);
		-- IRAM interface{Iram interface}

		IRAM_ADDRESS : out std_logic_vector( iram_address_size- 1 downto 0); -- the current PC value 
		IRAM_ENABLE  : out std_logic;                                        -- from control unit
		IRAM_READY   : in  std_logic;                                        -- to the control unit 
		IRAM_DATA    : in  std_logic_vector(0 to IR_SIZE-1 );
		-- to/from control unit
		curr_instruction : out std_logic_vector(IR_SIZE-1 downto 0);
		iram_enable_cu   : in  std_logic;
		update_pc_branch : in  std_logic;
		stall            : in  std_logic;
		iram_ready_cu    : out std_logic
	) ;
end entity ; -- fetch_stage

architecture structural of fetch_stage is

	-- internal signals declaration
	signal new_program_counter_val : std_logic_vector(PC_SIZE-1 downto 0);
	signal program_counter_val     : std_logic_vector(PC_SIZE-1 downto 0);
	signal instruction_reg_val     : std_logic_vector(IR_SIZE-1 downto 0);
	signal curr_instruction_to_reg : std_logic_vector(IR_SIZE-1 downto 0);
	signal restn                   : std_logic;
begin

	restn <= not(rst);

	-- Program counter
	program_counter : reg_nbit
		generic map (
			n => PC_SIZE
		)
		port map (
			clk   => clk,
			reset => restn,
			d     => new_pc_value_mem_stage,
			Q     => program_counter_val
		);



	-- logic for incremenentig the program counter 
	new_program_counter_val <= --std_logic_vector(unsigned(program_counter_val)+0) when iram_enable_cu='0' and update_pc_branch='0' and branch_taken='0' 
		std_logic_vector(unsigned(new_pc_value_mem_stage)+4) when update_pc_branch='1' or branch_taken='1' else
		std_logic_vector(unsigned(program_counter_val)+0)    when iram_enable_cu='0' else
		std_logic_vector(unsigned(program_counter_val)+4);

	-- New Program counter
	new_program_counter : reg_nbit
		generic map (
			n => PC_SIZE
		)
		port map (
			clk   => clk,
			reset => restn,
			d     => new_program_counter_val,
			Q     => new_pc_value
		);

	-- delay register for jal instuction 


	-- Instruction register
	instruction_reg : reg_nbit
		generic map (
			n => IR_SIZE
		)
		port map (
			clk   => clk,
			reset => restn,
			d     => curr_instruction_to_reg,
			Q     => instruction_reg_val
		);

	curr_instruction_to_reg <= IRAM_DATA when stall='0' else instruction_reg_val ;

	curr_instruction <= instruction_reg_val; -- it has to go to the CU and part of it to the register file in the decode stage

	IRAM_ENABLE   <= iram_enable_cu;       -- forward memory enable
	iram_ready_cu <= IRAM_READY;           -- forward to control unit 
	IRAM_ADDRESS  <= program_counter_val ; --when iram_enable_cu='1' else
	                                 --		(OTHERS => 'Z');

end architecture ; -- structural
