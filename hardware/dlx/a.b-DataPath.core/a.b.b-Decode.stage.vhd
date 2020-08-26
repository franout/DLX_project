--------------------------------------------------------------------------------
-- Title       : decode stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.b-Decode.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:59:52 2020
-- Last update : Sat Aug 22 15:38:09 2020
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
		instruction_reg      : in std_logic_vector( IR_SIZE-1 downto 0 );
		-- to execute stage
		val_a                    : out std_logic_vector(N-1 downto 0);
		new_prog_counter_val_exe : out std_logic_vector(PC_SIZE-1 downto 0);
		val_b                    : out std_logic_vector(N-1 downto 0);
		val_immediate            : out std_logic_vector(N-1 downto 0);
		-- from write back stage
		update_reg_value : in std_logic_vector(N-1 downto 0);
		-- from / to control unit
		enable_rf    : in std_logic;
		read_rf_p1   : in std_logic;
		read_rf_p2   : in std_logic;
		write_rf     : in std_logic;
		rtype_itypen : in std_logic; -- =='1' rtype instrucion =='0' itype instructnions
		jump_sext 	 : in std_logic; -- signla for computing sign extentions of 26immediate values in jump insutrctions
		compute_sext : in std_logic-- signal for computing sign exention of 16bit immediate value
	) ;
end entity ; -- decode_stage

architecture structural of decode_stage is

	component sign_extension is
		generic (
			N : integer := 32;
			STARTING_BIT: integer := 16
		);
		port (
			val_to_exetend : in  std_logic_vector(STARTING_BIT-1 downto 0);
			enable         : in  std_logic;
			extended_val   : out std_logic_vector(N-1 downto 0)
		);
	end component sign_extension;
	signal rstn                                         : std_logic;
	signal val_reg_a_i,val_reg_b_i : std_logic_vector(N-1 downto 0);
	signal val_reg_immediate, val_reg_immediate_i ,val_reg_immediate_j: std_logic_vector(N-1 downto 0);
	signal clk_immediate,enable_sign_extension_logic                          : std_logic;
	signal instruction_reg_i,address_rf_write,del_reg_wb_2,del_reg_wb_1   : std_logic_vector(f_log2(RF_REGS)-1 downto 0);
	signal data_to_mux: std_logic_vector(N*2-1 downto 0);
	signal sel_immediate: std_logic_vector(0 downto 0);
begin

	rstn <= not(rst);

		-- logic for getting the correct address for write back stage
		-- depending on the current instruction ( if it is an I-type or R-type instruction)
		-- special case for jal instruction where the address is fixeed at 31
		instruction_reg_i<=instruction_reg(15 downto 11 ) when rtype_itypen ='1' and enable_sign_extension_logic='0' else  
						   instruction_reg( 20 downto 16 ) when rtype_itypen='0' and enable_sign_extension_logic='0' else 
							('1' & x"f") ; -- write return address in r31
		-- delay registers for write back address
		delay_reg_wb_1 : reg_nbit generic map (
			N => f_log2(RF_REGS)
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => instruction_reg_i,
			Q     => del_reg_wb_1
		);
		delay_reg_wb_2 : reg_nbit generic map (
			N => f_log2(RF_REGS)
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => del_reg_wb_1,
			Q     => del_reg_wb_2
		);
		delay_reg_wb_3 : reg_nbit generic map (
			N => f_log2(RF_REGS)
		)
		port map (
			clk   => clk,
			reset => rstn, -- reset is active high internally to the register
			d     => del_reg_wb_2,
			Q     => address_rf_write
		);


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
			ADD_RD1 => instruction_reg(25 downto 21), --(6 to 10),
			ADD_RD2 => instruction_reg(20 downto 16), --(11 to 15),
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
		sign_extension_logic_immediate : sign_extension generic map (
			N => N, 
			STARTING_BIT=>N/2
		)
		port map (
			val_to_exetend => instruction_reg(15 downto 0),--(0 to 16),
			enable         => compute_sext,
			extended_val   => val_reg_immediate_i
		);

		 --for distinguish between j and jal ( jal requires to write the return address in r31)
		enable_sign_extension_logic<= jump_sext and(not(enable_rf) or ( not(read_rf_p1) and  not(read_rf_p2))) and not(compute_sext);

		sign_extension_logic_jump: sign_extension generic map (
			N => N, 
			STARTING_BIT=>26
		)
		 port map (
			val_to_exetend => instruction_reg(25 downto 0),--(0 to 26),
			enable         =>enable_sign_extension_logic ,
			extended_val   => val_reg_immediate_j
		);


		-- mux for immediate reg
		data_to_mux <= val_reg_immediate_i & val_reg_immediate_j;
		sel_immediate(0)<= '1' when compute_sext ='0' else '0' ; -- default decision is the extend of a immediate16 ,
		-- when compute_sext='0' => enable_sign_extensio_logic for jump (immediate26extenstion ) is active
		immediate_reg_mux : MUX_zbit_nbit generic map (
			N => N,
			Z => 1 -- log2 of number of input signals
		)
		port map (
			inputs =>data_to_mux , --- sel =0 , sel =1 
			sel    => sel_immediate,
			y      => val_reg_immediate
		);




	-- register for immediate value
	clk_immediate <= clk and ( enable_sign_extension_logic or compute_sext) ; --clock gate;
		reg_immediate : reg_nbit generic map (
			N => N
		)
		port map (
			clk   => clk_immediate,
			reset => rstn, -- reset is active high internally to the register
			d     => val_reg_immediate,
			Q     => val_immediate
		);


	-- delay register for new program counter 

	--	delay_reg : reg_nbit generic map (
		--	N => N
--		)
	--	port map (
--			clk   => clk,
	--		reset => rstn, -- reset is active high internally to the register
--			d     => new_prog_counter_val,
	--		Q     => new_prog_counter_val_exe
		--);
	new_prog_counter_val_exe<=new_prog_counter_val;

end architecture ; -- structural
