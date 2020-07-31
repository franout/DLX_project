--------------------------------------------------------------------------------
-- Title       : datapath of dlx
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b-DataPath.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:58:34 2020
-- Last update : Fri Jul 31 17:41:38 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: structural architecture of datapath
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity DATAPATH is
generic (
	N: integer:=32
	);	
port (
	clk: in std_logic,
	reset_n: in std_logic
);
end entity DATAPATH;




architecture structural of DATAPATH is

	component fetch_stage is
		generic (
			IR_SIZE : integer := 32;
			PC_SIZE : integer := 32
		);
		port (
			clk                    : in  std_logic;
			rst                    : in  std_logic;
			new_pc_value_mem_stage : in  std_logic_vector(PC_SIZE-1 downto 0);
			new_pc_value           : out std_logic_vector(PC_SIZE-1 downto 0);
			IRAM_ADDRESS           : out std_logic_vector( iram_address_size- 1 downto 0);
			IRAM_ENABLE            : out std_logic;
			IRAM_READY             : in  std_logic;
			IRAM_DATA              : in  std_logic_vector(IR_SIZE-1 downto 0);
			curr_instruction       : out std_logic_vector(IR_SIZE-1 downto 0);
			iram_enable_cu         : in  std_logic;
			iram_ready_cu          : out std_logic
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
			clk                      : in  std_logic;
			rst                      : in  std_logic;
			new_prog_counter_val     : in  std_logic_vector(PC_SIZE-1 downto 0);
			instruction_reg          : in  std_logic_vector(IR_SIZE-1 downto 0);
			val_a                    : out std_logic_vector(N-1 downto 0);
			new_prog_counter_val_exe : out std_logic_vector(PC_SIZE-1 downto 0);
			val_b                    : out std_logic_vector(N-1 downto 0);
			val_immediate            : out std_logic_vector(N-1 downto 0);
			update_reg_value         : in  std_logic_vector(N-1 downto 0);
			enable_rf                : in  std_logic;
			read_rf_p1               : in  std_logic;
			read_rf_p2               : in  std_logic;
			write_rf                 : in  std_logic;
			address_rf_write         : in  std_logic_vector(f_log2(RF_REGS)-1 downto 0);
			compute_sext             : in  std_logic
		);
	end component decode_stage;





	component memory_stage is
		generic (
			N       : integer := 32;
			PC_SIZE : integer := 32
		);
		port (
			clk                 : in    std_logic;
			rst                 : in    std_logic;
			new_pc_value        : in    std_logic_vector(PC_SIZE-1 downto 0);
			new_pc_value_branch : out   std_logic_vector(PC_SIZE-1 downto 0);
			select_pc           : in    std_logic_vector(0 downto 0);
			alu_output_val      : in    std_logic_vector(N-1 downto 0);
			value_to_mem        : in    std_logic_vector(N-1 downto 0);
			data_from_memory    : out   std_logic_vector(N-1 downto 0);
			data_from_alu       : out   std_logic_vector(N-1 downto 0);
			dram_enable_cu      : in    std_logic;
			dram_r_nw_cu        : in    std_logic;
			dram_ready_cu       : out   std_logic;
			DRAM_ADDRESS        : out   std_logic_vector(dram_address_size-1 downto 0);
			DRAM_ENABLE         : out   std_logic;
			DRAM_READNOTWRITE   : out   std_logic;
			DRAM_READY          : in    std_logic;
			DRAM_DATA           : inout std_logic_vector(data_size-1 downto 0)
		);
	end component memory_stage;



	component write_back_stage is
		generic (
			N : integer:=32
		);
		port (
			data_from_memory : in  std_logic_vector(N-1 downto 0);
			data_from_alu    : in  std_logic_vector(N-1 downto 0);
			data_to_rf       : out std_logic_vector(N-1 downto 0);
			select_wb        : in  std_logic_vector(0 downto 0)
		);
	end component write_back_stage;		

begin


-- fetch stage
--- Instruction fetch(IF) cycle: Send out the PC and fetch the instruction from memory into
--the instruction register (IR) and increment the PC by 4 to address the next sequential
--instruction. The NPC register is used to hold the next sequential PC.
--IR < − MEM[PC]
--NPC < − PC + 4
	fetch_stage_dp : entity work.fetch_stage
		generic map (
			IR_SIZE => IR_SIZE,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk                    => clk,
			rst                    => rst,
			new_pc_value_mem_stage => new_pc_value_mem_stage,
			new_pc_value           => new_pc_value,
			IRAM_ADDRESS           => IRAM_ADDRESS,
			IRAM_ENABLE            => IRAM_ENABLE,
			IRAM_READY             => IRAM_READY,
			IRAM_DATA              => IRAM_DATA,
			curr_instruction       => curr_instruction,
			iram_enable_cu         => iram_enable_cu,
			iram_ready_cu          => iram_ready_cu
		);

-- decode stage
--• Instruction decode/register fetch(ID) cycle: Decode the instruction and access the register
--file (RF) to read the registers. The outputs of the general-purpose registers are read into
--two temporary registers (A and B).
--A < − regF[IR6...IR10]
--B < − regF[IR11...IR15]
--C < − regF[IR16...IR31]
--(4.1)
	decode_stage_dp : entity work.decode_stage
		generic map (
			N       => N,
			RF_REGS => RF_REGS,
			IR_SIZE => IR_SIZE,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk                      => clk,
			rst                      => rst,
			new_prog_counter_val     => new_prog_counter_val,
			instruction_reg          => instruction_reg,
			val_a                    => val_a,
			new_prog_counter_val_exe => new_prog_counter_val_exe,
			val_b                    => val_b,
			val_immediate            => val_immediate,
			update_reg_value         => update_reg_value,
			enable_rf                => enable_rf,
			read_rf_p1               => read_rf_p1,
			read_rf_p2               => read_rf_p2,
			write_rf                 => write_rf,
			address_rf_write         => address_rf_write,
			compute_sext             => compute_sext
		);

--execute stage
--Execution/effective address cycle(EX): The ALU operates on the operands (A and B)
--prepared in the previous cycle and the result is stored in the ALUOutput register.
--ALU − OUT < − A + IMM Memory reference
--ALU − OUT < − A func B Alu Operation
--ALU − OUT < − A op IMM Register-Immediate ALU
--ALU − OUT < − NPC + IMM Address del Branch


-- memory stage
--a load, data return from memory and is placed in the LMD (Load Memory Data) register.
--If it is a store, the data from the B register is written into memory. In either case the
--address used is the one computed in the prior cycle and stored in the ALUOutput register.
--LMD < − MEM[ALU − OUT ]
--MEM < − [ALU − OUT ] < − B
	memory_stage_dp : entity work.memory_stage
		generic map (
			N       => N,
			PC_SIZE => PC_SIZE
		)
		port map (
			clk                 => clk,
			rst                 => rst,
			new_pc_value        => new_pc_value,
			new_pc_value_branch => new_pc_value_branch,
			select_pc           => select_pc,
			alu_output_val      => alu_output_val,
			value_to_mem        => value_to_mem,
			data_from_memory    => data_from_memory,
			data_from_alu       => data_from_alu,
			dram_enable_cu      => dram_enable_cu,
			dram_r_nw_cu        => dram_r_nw_cu,
			dram_ready_cu       => dram_ready_cu,
			DRAM_ADDRESS        => DRAM_ADDRESS,
			DRAM_ENABLE         => DRAM_ENABLE,
			DRAM_READNOTWRITE   => DRAM_READNOTWRITE,
			DRAM_READY          => DRAM_READY,
			DRAM_DATA           => DRAM_DATA
		);


-- write back stage
--• Write-back(WB) cycle: Write the result into the register file, whether it comes from the
--memory system or from ALU; the register destination field is also in one of the two positions
--depending on the function code.
--regF[IR6...IR10] < −ALU − OUT
--regF[IR11...IR15] < −ALU − OUT
--regF[IR16...IR31] < −ALU − OUT

	write_back_stage_dp :write_back_stage
		generic map (
			N => N
		)
		port map (
			data_from_memory => data_from_memory,
			data_from_alu    => data_from_alu,
			data_to_rf       => data_to_rf,
			select_wb        => select_wb
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