--------------------------------------------------------------------------------
-- Title       : decode stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.b-Decode.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:59:52 2020
-- Last update : Sun Aug  2 16:08:03 2020
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
use work.constants.f_log2;
use work.global_components.all;

entity decode_stage is
	generic (
		N       : integer := 32;
		RF_REGS : integer := 32; -- number of registers in register file component
		IR_SIZE : integer := 32; -- Instruction register size
		PC_SIZE : integer := 32  -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic; -- active low 
		                    -- from fetch stage
		new_prog_counter_val : in std_logic_vector(PC_SIZE-1 downto 0);
		instruction_reg      : in std_logic_vector(IR_SIZE-1 downto 0);
		-- to execute stage
		val_a                    : out std_logic_vector(N-1 downto 0);
		new_prog_counter_val_exe : out std_logic_vector(PC_SIZE-1 downto 0);
		val_b                    : out std_logic_vector(N-1 downto 0);
		val_immediate            : out std_logic_vector(N-1 downto 0);
		-- from write back stage
		update_reg_value : in std_logic_vector(N-1 downto 0);
		-- from / to control unit
		enable_rf        : in std_logic;
		read_rf_p1       : in std_logic;
		read_rf_p2       : in std_logic;
		write_rf         : in std_logic;
		address_rf_write : in std_logic_vector(f_log2(RF_REGS)-1 downto 0);
		compute_sext     : in std_logic-- signal for computing sign exention of 16bit immediate value
	) ;
end entity ; -- decode_stage

architecture structural of decode_stage is

	component sign_extension is
		generic (
			N : integer := 32
		);
		port (
			val_to_exetend : in  std_logic_vector(N/2-1 downto 0);
			enable         : in  std_logic;
			extended_val   : out std_logic_vector(N-1 downto 0)
		);
	end component sign_extension;
	signal rstn                                         : std_logic;
	signal val_reg_a_i,val_reg_b_i, val_reg_immediate_i : std_logic_vector(N-1 downto 0);
	signal clk_immediate                                : std_logic;
begin

	rstn <= not(rst);

	-- register file 
	reg_file : register_file
		generic map (
			NBITREG => N,
			NBITADD => f_log2(RF_REGS)
		)
		port map (
			CLK     => clk,
			RESET   => rstn,
			ENABLE  => enable_rf,
			RD1     => read_rf_p1,
			RD2     => read_rf_p2,
			WR      => write_rf,
			ADD_WR  => address_rf_write,
			ADD_RD1 => instruction_reg(10 downto 6), -- TODO the reverse
			ADD_RD2 => instruction_reg(15 downto 11),
			DATAIN  => update_reg_value,
			OUT1    => val_reg_a_i,
			OUT2    => val_reg_b_i
		);


		-- register for first output value from register file
		reg_a : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => val_reg_a_i,
			Q     => val_a
		);


		-- register for second output value from register file 
		reg_b : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => val_reg_b_i,
			Q     => val_b
		);


		-- sign exted logic check only the last bit of the immediate value and extend ( it work for both signed and unsigned)
		sign_extension_logic_i : sign_extension generic map (
			N => N
		)
		port map (
			val_to_exetend => instruction_reg(N-1 downto 16),
			enable => compute_sext,
			extended_val => val_reg_immediate_i
		);





	-- register for immediate value
	clk_immediate <= clk and compute_sext; --clock gate;
		reg_immediate : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk_immediate,
			reset => rstn, -- reset is active high internally to the register
			d     => val_reg_immediate_i,
			Q     => val_immediate
		);


	-- delay register for new program counter 

		delay_reg : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => new_prog_counter_val,
			Q     => new_prog_counter_val_exe
		);

end architecture ; -- structural
