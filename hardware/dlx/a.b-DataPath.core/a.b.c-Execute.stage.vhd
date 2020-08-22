--------------------------------------------------------------------------------
-- Title       : execute stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c-Execute.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:04 2020
-- Last update : Fri Aug 21 22:49:38 2020
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
		signed_notsigned : in  std_logic;
		alu_op_type      : in  std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
		sel_val_a        : in  std_logic_vector(0 downto 0);
		sel_val_b        : in  std_logic_vector(0 downto 0);
		cin              : in  std_logic;
		overflow         : out std_logic;
		-- exception control logic for multiplication 
		zero_mul_detect : out std_logic;
		mul_exeception  : out std_logic;
		evaluate_branch : in  std_logic_vector(1 downto 0)
	) ;
end entity ; -- execute_stage

architecture structural of execute_stage is

	component general_alu is
		generic (
			N : integer := 32
		);
		port (
			clk,rst : in std_logic;
			-- exception control logic 
			zero_mul_detect  : out std_logic;
			mul_exeception   : out std_logic;
			FUNC             : IN  TYPE_OP_ALU;
			DATA1, DATA2     : IN  std_logic_vector(N-1 downto 0);
			signed_notsigned : in  std_logic;
			cin              : in  std_logic;
			overflow         : out std_logic;
			OUTALU           : OUT std_logic_vector(N-1 downto 0)
		);
	end component general_alu;

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
	signal rstn        ,evaluate_branch_enable                : std_logic;
	signal branch_taken,branch_taken_reg_q                : std_logic_vector(0 downto 0);
	signal data_to_mux_a,data_to_mux_b : std_logic_vector(N*2-1 downto 0);
	signal opb,opa                     : std_logic_vector(N-1 downto 0);
	signal alu_out                     : std_logic_vector(N-1 downto 0);
	signal alu_op_type_i               : TYPE_OP_ALU;
begin
	rstn <= not(rst);
		-- branches
		-- zero check logic  
		evaluate_branch_enable<= evaluate_branch(0) or evaluate_branch(1); -- activate the check branch logic in both cases (!==0 or ===0)
		check_branch_logic_i : check_branch_logic generic map (
			N => N
		)
		port map (
			enable    => evaluate_branch_enable,
			input_val => val_a,
			decision  => branch_taken(0)
		);

		-- forward check logic when checking ==0 otherwise it is gonna be the negated result of check zero logic for !==0
		branch_taken_reg_q(0)<= branch_taken(0) when evaluate_branch(1)='0' else not(branch_taken(0));

		-- condition register delay
		condition_delay_reg : reg_nbit generic map (
			N => 1
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => branch_taken_reg_q,
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
	-- transform in in internal type (for System verilog compatibility)
	alu_op_type_i <= SUB WHEN alu_op_type=x"1" else
		MULT                WHEN alu_op_type=x"2" else
		BITAND              WHEN alu_op_type=x"3" else
		BITOR               WHEN alu_op_type=x"4" else
		BITXOR              WHEN alu_op_type=x"5" else
		FUNCLSL             WHEN alu_op_type=x"6" else
		FUNCLSR             WHEN alu_op_type=x"7" else
		GE                  WHEN alu_op_type=x"8" else
		LE                  WHEN alu_op_type=x"9" else
		NE                  WHEN alu_op_type=x"a" else
		ADD ; --(OTHERS=>'0');
	general_alu_i : general_alu
		generic map (
			N => N
		)
		port map (
			clk => clk,
			rst => rstn,
			-- exception control logic 
			zero_mul_detect  => zero_mul_detect,
			mul_exeception   => mul_exeception,
			FUNC             => alu_op_type_i,
			DATA1            => opa,
			DATA2            => opb,
			cin              => cin,
			overflow         => overflow,
			OUTALU           => alu_out,
			signed_notsigned => signed_notsigned
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
