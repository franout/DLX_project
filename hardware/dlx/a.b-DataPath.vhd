--------------------------------------------------------------------------------
-- Title       : datapath of dlx
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b-DataPath.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:58:34 2020
-- Last update : Wed Jul 22 22:59:01 2020
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




begin


-- fetch stage


-- decode stage


--execute stage



-- memory stage


-- write back stage

	
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