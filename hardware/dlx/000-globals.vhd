--------------------------------------------------------------------------------
-- Title       : globals
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 000-globals.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:56:54 2020
-- Last update : Thu Jul 23 17:40:24 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: global constants, functions and  definitions for the dlx
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

package globals is

--------------------------------------------------------------------------------
-- for debug purpuses
--synthesis_translate off
constant tot_state : integer := 1; 
--synthesis_translate on
--------------------------------------------------------------------------------

-- definition for instruction 
constant endianess: string := "big";
constant instruction_size : integer := 32; 
constant opcode_length : integer := 6; -- length in the instruction 
constant register_address_field_length : integer := 5; -- length in the instruction 
constant immediate_length : integer := 16;   --  for I-type instructions
constant alu_function_length : integer := 11;  -- for R-type instructions
constant jump_address_length : integer := 26; -- for J-type instruction  

-- definition for data
constant data_size : integer := 32; 



-- definition for memories size
constant dram_size : integer := 128; 
constant dram_address_size : integer := f_log2(dram_size); 
constant iram_size : integer := 128; 
constant iram_address_size : integer := f_log2(iram_size); 


-- from lab 
    type TYPE_OP is (ADD, SUB, MULT, BITAND, BITOR, BITXOR, FUNCLSL, FUNCLSR, FUNCRL, FUNCRR);


	type aluOp is (
		NOP, ADDS, LLS, LRS --- to be completed
			);
	-- see also implemented_instruction.svh in ./test_bench
	type instruction is (

		);



-- from lab 
-- Control unit input sizes
    constant OP_CODE_SIZE : integer :=  6;                                              -- OPCODE field size
    constant FUNC_SIZE    : integer :=  11;                                             -- FUNC field size
    constant ADD_REG_SIZE : integer := 5;                                               -- # of bits used for addressing the registers for both an I-Type or R-Type instruction 
    constant instr_length : integer := 32;                                              -- number of bits for an instruction 


-- R-TYPE -> register to register operation 
-- I-TYPE -> register and an immediate of ALU operation or load/store memory operatins 


-- R-Type instruction -> FUNC field
    -- In  R-Type the func field it indicates the types of mathematical(this information is in the opcode) operation to execute
    constant RTYPE_ADD : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000001";    -- ADD RS1,RS2,RD
    constant RTYPE_SUB : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000010";    -- SUB RS1,RS2,RD
    constant RTYPE_AND : std_logic_vector(FUNC_SIZE - 1 downto 0):=  "00000000011";     -- AND RS1,RS2,RD
    constant RTYPE_OR : std_logic_vector(FUNC_SIZE - 1 downto 0):=  "00000000100";      -- OR  RS1,RS2,RD
    constant NOP : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000000";          -- do nothing 

-- R-Type instruction -> OPCODE field
-- it is used to notify that the cpu has to execute a mathematical operation 
    constant RTYPE : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000000";          -- for ADD, SUB, AND, OR register-to-register operation

-- I-Type instruction -> OPCODE field
    constant ITYPE_ADDI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000001";    -- ADDI1 RS1,RD,INP1
    constant ITYPE_SUBI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000010";    -- SUBI1 RS1,RD,INP1
    constant ITYPE_ANDI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000011";    -- ANDI1 RS1,RD,INP1
    constant ITYPE_ORI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=   "000100";    -- ORI1 RS1,RD,INP1 
    constant ITYPE_ADDI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000101";   -- ADDI2 RS1,RD,INP2
    constant ITYPE_SUBI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000110";    -- SUBI2 RS1,RD,INP2
    constant ITYPE_ANDI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000111";    -- ANDI2 RS1,RD,INP2
    constant ITYPE_ORI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=   "001000";    -- ORI2 RS1,RD,INP2
    constant ITYPE_MOV : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=    "001001";    -- MOV RS1,RD
    constant ITYPE_S_REG1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001010";    -- S_REG1  RD,INP1 r1 not used reg[RD]<= INP2 RD always r2
    constant ITYPE_S_REG2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001011";    -- S_REG2 RD,INP2 r2 not used  reg[RD]<= INP2 RD always r1
    constant ITYPE_S_MEM2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001100";    -- S_MEM2 RD,RS,INP1  mem[ [reg[RD]+inp1]<=reg[RS]
    constant ITYPE_L_MEM1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001101";    -- L_MEM1 RS,RD,INP1  reg[RS]<=mem[reg[RS]+INP1]
    constant ITYPE_L_MEM2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001110";    -- L_MEM2 RS1,RD,INP1 reg[RS]<=mem[reg[RS]+INP2]



-- function for calculating the log2 of an integers
function f_log2 ( x: integer ) return integer;

end globals;

package body globals is

function f_log2 ( x: integer ) return integer is
    variable i: integer;

    begin
        i:=0;
        while ( 2**i < x ) loop
            i:=i+1;
        end loop;
        return i;
end function f_log2;


end package body globals;
