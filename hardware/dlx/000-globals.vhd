--------------------------------------------------------------------------------
-- Title       : globals
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 000-globals.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:56:54 2020
-- Last update : Wed Aug 19 22:52:05 2020
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
        constant tot_state : integer := 4;
        --synthesis_translate on
        --------------------------------------------------------------------------------

        -- definition for instruction 
        constant endianess                     : string  := "big"; -- for memory access
        constant instr_length : integer := 32; -- number of bits for an instruction 
        constant opcode_length                 : integer := 6;  -- length in the instruction 
        constant register_address_field_length : integer := 5;  -- length in the instruction 
        constant immediate_length              : integer := 16; --  for I-type instructions
        constant alu_function_length           : integer := 11; -- for R-type instructions
        constant jump_address_length           : integer := 26; -- for J-type instruction  
        constant OP_CODE_SIZE : integer := 6;  -- OPCODE field size
        constant FUNC_SIZE    : integer := 11; -- FUNC field size
        constant tot_cu_sign : integer := 19;  -- number of total signoal (I/O) of control unit

        -- definition for data
        constant data_size : integer := 32;
        -- definition for register file 
        constant register_in_rf : integer := 32;

        -- definition for memories size
        constant dram_size         : integer := 2**16;
        constant dram_address_size : integer := f_log2(dram_size);
        constant iram_size         : integer := 2**16;
        constant iram_address_size : integer := f_log2(iram_size);

        -- R-TYPE -> register to register operation 
        -- I-TYPE -> register and an immediate of ALU operation or load/store memory operatins 
        -- from lab defined in alu_types.vhd package
        type TYPE_OP_ALU is (ADD, SUB, MULT, BITAND, BITOR, BITXOR, FUNCLSL, FUNCLSR);

        -- see also implemented_instruction.svh in ./test_bench
        type instruction is (
                i_add,i_addi ,i_and  ,i_andi ,i_beqz ,i_benz ,i_j ,i_jal ,i_lw ,i_nop ,i_or 
                ,i_ori ,i_sgl ,i_sgei ,i_sle ,i_slei ,i_sll ,i_slli ,i_sne ,i_snei ,i_srl ,
                i_srli ,i_sub ,i_subi ,i_sw ,i_xor ,i_xori

            );
        attribute encoding: std_logic_vector(OP_CODE_SIZE-1 downto 0);
        attribute encoding of i_add[return instruction] : literal is b"10"&x"0";
        attribute encoding of i_addi[return instruction] : literal is b"00"&x"8";

        attribute encoding of i_nop[return instruction] : literal is b"01"&x"5";

        attribute encoding of i_j[return instruction] : literal is b"00"&x"2";
        -- TODO add all the encodings of the instruction basic version 




        end globals;

        package body globals is




            -- function for transforming from big endian to little endian
            function b2l_endian (a : in std_logic_vector)
                return std_logic_vector is
                variable result : std_logic_vector(a'RANGE);
                alias aa        : std_logic_vector(a'REVERSE_RANGE) is a;
            begin
                for i in aa'RANGE loop
                    result(i) := aa(i);
                end loop ;
                return result;
            end; -- function b2l_endian

            -- function for transforming from little endian to big endian
            function l2b_endian(a : in std_logic_vector)
                return std_logic_vector is
                variable result : std_logic_vector(a'RANGE);
                alias aa        : std_logic_vector(a'REVERSE_RANGE) is a;
            begin
                for i in aa'RANGE loop
                    result(i) := aa(i);
                end loop ;
                return result;
            end; -- function l2b_endian


        end package body globals;


