--------------------------------------------------------------------------------
-- Title       : execute stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c-Execute.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:04 2020
-- Last update : Sun Aug  2 16:09:49 2020
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
	component check_branch_logic is
		generic (
			N : integer := 32
		);
		port (
			input_val : in  std_logic_vector(N-1 downto 0);
			enable    : in  std_logic;
			decision  : out std_logic
		);
	end component check_branch_logic;
	signal rstn   : std_logic;
	signal branch_taken: std_logic_vector(0 downto 0);
	signal data_to_mux_a,data_to_mux_b   : std_logic_vector(N-1 downto 0);
	signal opb,opa                       : std_logic_vector(N-1 downto 0);
	signal alu_out                       : std_logic_vector(N-1 downto 0);
begin
	rstn <= not(rst);
		-- branches
		-- zero check logic  
		check_branch_logic_i : check_branch_logic generic map (
			N => N
		)
		port map (
			enable    => evaluate_branch,
			input_val => val_a,
			decision  => branch_taken(0)
		);
	-- condition register delay
		condition_delay_reg : reg_nbit generic map (
			N => 1
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => branch_taken,
			Q     => branch_condition
		);



	-- muxes for alu operands
	-- first operand
	data_to_mux_a <= val_a & new_prog_counter_val_exe;

		-- definition of component is in the global_components package
		alu_opa : MUX_zbit_nbit generic map (
			N => N,
			Z => 1 -- log2 of number of input signals
		)
		port map (
			inputs => data_to_mux_a, --- sel =0 , sel =1 
			sel    => sel_val_a,
			y      => opa
		);

	-- second operand
	-- arithmetic logical unit
	data_to_mux_b <= val_b & val_immediate;
		alu_opb : MUX_zbit_nbit generic map (
			N => N,
			Z => 1 -- log2 of number of input signals
		)
		port map (
			inputs => data_to_mux_b, --- sel =0 , sel =1 
			sel    => sel_val_b,
			y      => opb
		);


	------------------------------------------------------------------------ 
	-- ALU instantiation 
	ALU_i : ALU
		generic map (
			N => N
		)
		port map (
			FUNC   => alu_op_type, -- todo put only addition for the first time
			DATA1  => opa,
			DATA2  => opb,
			OUTALU => alu_out
		);

		-- alu register output 
		alu_reg_out : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => alu_out,
			Q     => alu_output_val
		);


		-- delay register for b register (see decode stage)
		reg_del_b : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => val_b,
			Q     => value_to_mem
		);


		-- delay register for pc
		del_reg_pc : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => new_prog_counter_val_exe,
			Q     => prog_counter_forwaded
		);


end architecture ; -- structural