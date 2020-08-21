--------------------------------------------------------------------------------
-- Title       : datapath of dlx
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b-DataPath.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:58:34 2020
-- Last update : Fri Aug 21 22:49:41 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: structural architecture of datapath
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.globals.all;
use work.constants.all; -- for log2 function


entity DATAPATH is
	generic (
		N       : integer := 32;
		RF_REGS : integer := 32; -- number of registers in register file component
		IR_SIZE : integer := 32; -- Instruction register size
		PC_SIZE : integer := 32  -- Program Counter Size
	);
	port (
		clk : in std_logic;
		rst : in std_logic;
		-- iram interface
		IRAM_ADDRESS : out std_logic_vector( iram_address_size- 1 downto 0);
		IRAM_ENABLE  : out std_logic;
		IRAM_READY   : in  std_logic;
		IRAM_DATA    : in  std_logic_vector(IR_SIZE-1 downto 0);
		-- dram interface
		DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
		DRAM_ENABLE       : out   std_logic;
		DRAM_READNOTWRITE : out   std_logic;
		DRAM_READY        : in    std_logic;
		DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0);
		-- control unit interface, signals from/to control unit 
		-- for fetch stage
		iram_enable_cu         : in  std_logic;
		iram_ready_cu          : out std_logic;
		curr_instruction_to_cu : out std_logic_vector(PC_SIZE-1 downto 0);
		-- for decode stage
		enable_rf    : in std_logic;
		read_rf_p1   : in std_logic;
		read_rf_p2   : in std_logic;
		write_rf     : in std_logic;
		rtype_itypen : in std_logic; -- =='1' rtype instrucion =='0' itype instructnions
		compute_sext : in std_logic;
		-- for execute stage
		alu_op_type      : in std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
		sel_val_a        : in std_logic_vector(0 downto 0 );
		sel_val_b        : in std_logic_vector(0 downto 0 );
		signed_notsigned : in std_logic;
		evaluate_branch  : in std_logic_vector(1 downto 0);
		alu_cin          : in std_logic;
		-- from execute stage
		alu_overflow : out std_logic;
		-- exception control logic for multiplication 
		zero_mul_detect : out std_logic;
		mul_exeception  : out std_logic;
		-- for memory stage
		dram_enable_cu : in  std_logic;
		dram_r_nw_cu   : in  std_logic;
		dram_ready_cu  : out std_logic;
		-- for write back stage   
		select_wb : in std_logic_vector(0 downto 0)

	);
end entity DATAPATH;




architecture structural of DATAPATH is

	component fetch_stage is
		generic (
			IR_SIZE : integer := 32;
			PC_SIZE : integer := 32
		);
		port (
			clk : in std_logic;
			rst : in std_logic;
			--from  memory stage
			new_pc_value_mem_stage : in std_logic_vector(PC_SIZE-1 downto 0);
			-- to decode stage
			new_pc_value : out std_logic_vector(PC_SIZE-1 downto 0);
			-- IRAM interface
			IRAM_ADDRESS : out std_logic_vector( iram_address_size- 1 downto 0); -- the current PC value 
			IRAM_ENABLE  : out std_logic;                                        -- from control unit
			IRAM_READY   : in  std_logic;                                        -- to the control unit 
			IRAM_DATA    : in  std_logic_vector(IR_SIZE-1 downto 0);
			-- to/from control unit
			curr_instruction : out std_logic_vector(IR_SIZE-1 downto 0);
			iram_enable_cu   : in  std_logic;
			iram_ready_cu    : out std_logic
		);
	end component fetch_stage;


	component decode_stage is
		generic (
			N       : integer := 32;
			RF_REGS : integer := 32;
			IR_SIZE : integer := 32;
			PC_SIZE : integer := 32
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
			enable_rf    : in std_logic;
			read_rf_p1   : in std_logic;
			read_rf_p2   : in std_logic;
			write_rf     : in std_logic;
			rtype_itypen : in std_logic; -- =='1' rtype instrucion =='0' itype instructnions
			compute_sext : in std_logic  -- signal for computing sign exention of 16bit immediate value
		);
	end component decode_stage;


	component execute_stage is
		generic (
			N       : integer := 32;
			PC_SIZE : integer := 32
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
			evaluate_branch  : in  std_logic_vector(1 downto 0);
			-- exception control logic for multiplication 
			zero_mul_detect : out std_logic;
			mul_exeception  : out std_logic
		);
	end component execute_stage;


	component memory_stage is
		generic (
			N       : integer := 32;
			PC_SIZE : integer := 32
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
		);
	end component memory_stage;



	component write_back_stage is
		generic (
			N : integer := 32
		);
		port (
			-- datapath, from memory stage
			data_from_memory : in  std_logic_vector(N-1 downto 0);
			data_from_alu    : in  std_logic_vector(N-1 downto 0);
			data_to_rf       : out std_logic_vector(N-1 downto 0); -- to decode stage
			                                                       -- control signals from cu
			select_wb : in std_logic_vector(0 downto 0)
		);
	end component write_back_stage;

	-- interconnection signal declarations
	signal new_pc_value_mem_stage_i   : std_logic_vector(PC_SIZE-1 downto 0);
	signal new_pc_value               : std_logic_vector(PC_SIZE-1 downto 0);
	signal new_pc_value_decode        : std_logic_vector(PC_SIZE-1 downto 0);
	signal curr_instruction_i         : std_logic_vector(IR_SIZE-1 downto 0);
	signal val_a_i                    : std_logic_vector(N-1 downto 0);
	signal new_prog_counter_val_exe_i : std_logic_vector(PC_SIZE-1 downto 0);
	signal val_b_i                    : std_logic_vector(N-1 downto 0);
	signal val_immediate_i            : std_logic_vector(N-1 downto 0);
	signal update_reg_value_i         : std_logic_vector(N-1 downto 0);
	signal branch_condition_i         : std_logic_vector(0 downto 0);
	signal prog_counter_forwaded_i    : std_logic_vector(PC_SIZE-1 downto 0);
	signal alu_output_val_i           : std_logic_vector(N-1 downto 0);
	signal value_to_mem_i             : std_logic_vector(N-1 downto 0);
	signal data_from_memory_i         : std_logic_vector(N-1 downto 0);
	signal data_from_alu_i            : std_logic_vector(N-1 downto 0);
begin


	-- fetch stage
	--- Instruction fetch(IF) cycle: Send out the PC and fetch the instruction from memory into
	--the instruction register (IR) and increment the PC by 4 to address the next sequential
	--instruction. The NPC register is used to hold the next sequential PC.
	--IR < − MEM[PC]
	--NPC < − PC + 4
	fetch_stage_dp : fetch_stage
		generic map (
			IR_SIZE => IR_SIZE,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk => clk ,
			rst => rst ,
			--from  memory stage
			new_pc_value_mem_stage => new_pc_value_mem_stage_i,
			-- to decode stage
			new_pc_value => new_pc_value_decode,
			-- IRAM interface
			IRAM_ADDRESS => IRAM_ADDRESS,
			IRAM_ENABLE  => IRAM_ENABLE ,
			IRAM_READY   => IRAM_READY ,
			IRAM_DATA    => IRAM_DATA ,
			-- to/from control unit
			curr_instruction => curr_instruction_i,
			iram_enable_cu   => iram_enable_cu,
			iram_ready_cu    => iram_ready_cu
		);

	curr_instruction_to_cu <= curr_instruction_i;
	-- decode stage
	--• Instruction decode/register fetch(ID) cycle: Decode the instruction and access the register
	--file (RF) to read the registers. The outputs of the general-purpose registers are read into
	--two temporary registers (A and B).
	--A < − regF[IR6...IR10]
	--B < − regF[IR11...IR15]
	--C < − regF[IR16...IR31]
	--(4.1)
	decode_stage_dp : decode_stage
		generic map (
			N       => N,
			RF_REGS => RF_REGS,
			IR_SIZE => IR_SIZE,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk => clk,
			rst => rst,
			-- from fetch stage
			new_prog_counter_val => new_pc_value_decode,
			instruction_reg      => curr_instruction_i,
			-- to execute stage
			val_a                    => val_a_i ,
			new_prog_counter_val_exe => new_prog_counter_val_exe_i ,
			val_b                    => val_b_i ,
			val_immediate            => val_immediate_i ,
			-- from write back stage
			update_reg_value => update_reg_value_i,
			-- from / to control unit
			enable_rf    => enable_rf ,
			read_rf_p1   => read_rf_p1 ,
			read_rf_p2   => read_rf_p2 ,
			write_rf     => write_rf ,
			rtype_itypen => rtype_itypen,
			compute_sext => compute_sext
		);

	--execute stage
	--Execution/effective address cycle(EX): The ALU operates on the operands (A and B)
	--prepared in the previous cycle and the result is stored in the ALUOutput register.
	--ALU − OUT < − A + IMM Memory reference
	--ALU − OUT < − A func B Alu Operation
	--ALU − OUT < − A op IMM Register-Immediate ALU
	--ALU − OUT < − NPC + IMM Address del Branch
	execute_stage_dp : execute_stage
		generic map (
			N       => N,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk => clk ,
			rst => rst ,
			-- from decode stage
			val_a                    => val_a_i,
			val_b                    => val_b_i,
			val_immediate            => val_immediate_i,
			new_prog_counter_val_exe => new_prog_counter_val_exe_i,
			-- to memory stage
			branch_condition      => branch_condition_i ,
			prog_counter_forwaded => prog_counter_forwaded_i ,
			alu_output_val        => alu_output_val_i ,
			value_to_mem          => value_to_mem_i ,
			-- to/from control unit
			alu_op_type      => alu_op_type ,
			sel_val_a        => sel_val_a ,
			sel_val_b        => sel_val_b ,
			cin              => alu_cin,
			overflow         => alu_overflow,
			evaluate_branch  => evaluate_branch,
			signed_notsigned => signed_notsigned,
			zero_mul_detect  => zero_mul_detect,
			mul_exeception   => mul_exeception
		);

	-- memory stage
	--a load, data return from memory and is placed in the LMD (Load Memory Data) register.
	--If it is a store, the data from the B register is written into memory. In either case the
	--address used is the one computed in the prior cycle and stored in the ALUOutput register.
	--LMD < − MEM[ALU − OUT ]
	--MEM < − [ALU − OUT ] < − B
	memory_stage_dp : memory_stage
		generic map (
			N       => N,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk => clk ,
			rst => rst ,
			-- from fetch stage  it is actually from execute stage case it has been delayed for synch the pipeline
			new_pc_value => prog_counter_forwaded_i,
			-- to fetch stage
			new_pc_value_branch => new_pc_value_mem_stage_i,
			-- from execute stage
			select_pc      => branch_condition_i, -- selection signal for the new value of the PC
			alu_output_val => alu_output_val_i,
			value_to_mem   => value_to_mem_i,
			-- to write back stage
			data_from_memory => data_from_memory_i,
			data_from_alu    => data_from_alu_i ,
			-- control signals from CU
			dram_enable_cu => dram_enable_cu ,
			dram_r_nw_cu   => dram_r_nw_cu ,
			dram_ready_cu  => dram_ready_cu ,
			-- DRAM INTERFACES 
			DRAM_ADDRESS      => DRAM_ADDRESS ,
			DRAM_ENABLE       => DRAM_ENABLE ,
			DRAM_READNOTWRITE => DRAM_READNOTWRITE ,
			DRAM_READY        => DRAM_READY ,
			DRAM_DATA         => DRAM_DATA
		);


	-- write back stage
	--• Write-back(WB) cycle: Write the result into the register file, whether it comes from the
	--memory system or from ALU; the register destination field is also in one of the two positions
	--depending on the function code.
	--regF[IR6...IR10] < −ALU − OUT
	--regF[IR11...IR15] < −ALU − OUT
	--regF[IR16...IR31] < −ALU − OUT

	write_back_stage_dp : write_back_stage
		generic map (
			N => N
		)
		port map (
			-- datapath, from memory stage
			data_from_memory => data_from_memory_i,
			data_from_alu    => data_from_alu_i,
			data_to_rf       => update_reg_value_i, -- to decode stage
			                                        -- control signals from cu
			select_wb => select_wb
		);




end architecture structural;


--- Instruction fetch(IF) cycle: Send out the PC and fetch the instruction from memory into
--the instruction register (IR) and increment the PC by 4 to address the next sequential
--instruction. The NPC register is used to hold the next sequential PC.
--IR < − MEM[PC]
--NPC < − PC + 4
--• Instruction decode/register fetch(ID) cycle: Decode the instruction and access the register
--file (RF) to read the registers. The outputs of the general-purpose registers are read into
--two temporary registers (A and B).
--A < − regF[IR6...IR10]
--B < − regF[IR11...IR15]
--C < − regF[IR16...IR31]
--(4.1)
--• Execution/effective address cycle(EX): The ALU operates on the operands (A and B)
--prepared in the previous cycle and the result is stored in the ALUOutput register.
--ALU − OUT < − A + IMM Memory reference
--ALU − OUT < − A func B Alu Operation
--ALU − OUT < − A op IMM Register-Immediate ALU
--ALU − OUT < − NPC + IMM Address del Branch
--(4.2)
--16
--• Memory access/branch completion(MEM) cycle : Access memory if needed. If instruction is
--a load, data return from memory and is placed in the LMD (Load Memory Data) register.
--If it is a store, the data from the B register is written into memory. In either case the
--address used is the one computed in the prior cycle and stored in the ALUOutput register.
--LMD < − MEM[ALU − OUT ]
--MEM < − [ALU − OUT ] < − B
--(4.3)
--• Write-back(WB) cycle: Write the result into the register file, whether it comes from the
--memory system or from ALU; the register destination field is also in one of the two positions
--depending on the function code.
--regF[IR6...IR10] < −ALU − OUT
--regF[IR11...IR15] < −ALU − OUT
--regF[IR16...IR31] < −ALU − OUT