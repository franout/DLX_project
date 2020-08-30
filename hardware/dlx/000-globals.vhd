--------------------------------------------------------------------------------
-- Title       : globals
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 000-globals.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:56:54 2020
-- Last update : Sun Aug 30 22:58:17 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: global constants, functions and  definitions for the dlx
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use work.constants.all; -- it contains f_log2 function 

package globals is

    -- function for transforming from big endian to little endian
    function b2l_endian (a : in std_logic_vector)
        return std_logic_vector;

    -- function for transforming from little endian to big endian
    function l2b_endian(a : in std_logic_vector)
        return std_logic_vector;

    -- function for calculating the log2 of an integer
    --function f_log2 ( x: integer ) return integer; it is in the constants package from the labs

    --------------------------------------------------------------------------------
    -- for debug purpuses
    --synthesis_translate off
    constant tot_state : integer := 3;
    --synthesis_translate on
    --------------------------------------------------------------------------------

    -- definition for instruction 
    constant endianess                     : string  := "big"; -- for memory access
    constant instr_length                  : integer := 32;    -- number of bits for an instruction 
    constant opcode_length                 : integer := 6;     -- length in the instruction 
    constant register_address_field_length : integer := 5;     -- length in the instruction 
    constant immediate_length              : integer := 16;    --  for I-type instructions
    constant alu_function_length           : integer := 11;    -- for R-type instructions
    constant jump_address_length           : integer := 26;    -- for J-type instruction  
    constant OP_CODE_SIZE                  : integer := 6;     -- OPCODE field size
    constant FUNC_SIZE                     : integer := 11;    -- FUNC field size
    constant tot_cu_sign                   : integer := 22;    -- number of total signoal (I/O) of control unit

    -- definition for data
    constant data_size : integer := 32;
    -- definition for register file 
    constant register_in_rf : integer := 32;

    -- definition for memories size
    --      constant dram_size         :  integer  := 2**32-1;
    constant dram_address_size : integer := 32; --f_log2(dram_size);
                                                --      constant iram_size         : integer  := 2**32-1;
    constant iram_address_size : integer := 32; --f_log2(iram_size);

    -- R-TYPE -> register to register operation 
    -- I-TYPE -> register and an immediate of ALU operation or load/store memory operatins 
    -- from lab defined in alu_types.vhd package
    type TYPE_OP_ALU is (ADD, SUB, MULT, BITAND, BITOR, BITXOR, FUNCLSL, FUNCLSR,GE,LE,NE);

    -- see also implemented_instruction.svh in ./test_bench
    -- removed as attribute encoding for being compliant with synthesis and remove warning 
    --type instruction is (
    --            i_regtype,i_addi ,i_andi ,i_beqz ,i_benz ,i_j ,i_jal ,i_lw ,i_nop
    --           ,i_ori ,i_sgei ,i_slei ,i_slli ,i_snei ,
    --            i_srli ,i_subi ,i_sw ,i_xori
    --
    --    );
    --type ireg_instruction_funcode is(i_add,i_mul,i_and ,i_or,i_sge ,i_sle,i_sll ,i_sne,i_srl,i_sub,i_xor);




    -- for being complaint with synthesis
    constant i_regtype : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"0";
    constant i_addi    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"8";
    constant i_andi    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"c";
    constant i_beqz    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"4";
    constant i_benz    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"5";
    constant i_j       : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"2";
    constant i_jal     : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"3";
    constant i_lw      : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"3";
    constant i_nop     : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "01"&x"5";
    constant i_ori     : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"d";
    constant i_sgei    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "01"&x"d";
    constant i_slei    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "01"&x"c";
    constant i_slli    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "01"&x"4";
    constant i_snei    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "01"&x"9";
    constant i_srli    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "01"&x"6";
    constant i_subi    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"a";
    constant i_sw      : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"b";
    constant i_xori    : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"e";

    --- function opcode definition
    constant i_add : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"0";
    constant i_mul : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "11"&x"f";
    constant i_and : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"4";
    constant i_or  : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"5";
    constant i_sge : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"d";
    constant i_sle : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"c";
    constant i_sll : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"4";
    constant i_sne : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"9";
    constant i_srl : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "00"&x"6";
    constant i_sub : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"2";
    constant i_xor : std_logic_vector(OP_CODE_SIZE-1 downto 0) := "10"&x"6";

end globals;

package body globals is




    -- function for transforming from big endian to little endian
    function b2l_endian (a : in std_logic_vector)
        return std_logic_vector is
        variable result    : std_logic_vector(a'RANGE);
        constant cNumBytes : natural := a'length / 8;

    begin
        for i in 0 to cNumBytes-1 loop
            for j in 7 downto 0 loop
                result(8*i + j) := a(8*(cNumBytes-1-i) + j);
            end loop; -- j
        end loop;     -- i

        return result;
    end; -- function b2l_endian


    -- function for transforming from little endian to big endian  it is actually the same function
    function l2b_endian(a : in std_logic_vector)
        return std_logic_vector is
        variable result    : std_logic_vector(a'RANGE);
        constant cNumBytes : natural := a'length / 8;
    begin
        for i in 0 to cNumBytes-1 loop
            for j in 7 downto 0 loop
                result(8*i + j) := a(8*(cNumBytes-1-i) + j);
            end loop; -- j
        end loop;     -- i

        return result;
    end; -- function l2b_endian


end package body globals;


