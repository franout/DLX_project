--------------------------------------------------------------------------------
-- Title       : globals
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : 000-globals.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:56:54 2020
-- Last update : Fri Aug 21 18:52:14 2020
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
        constant tot_cu_sign : integer := 20;  -- number of total signoal (I/O) of control unit

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
        type TYPE_OP_ALU is (ADD, SUB, MULT, BITAND, BITOR, BITXOR, FUNCLSL, FUNCLSR,GE,LE,NE);

        -- see also implemented_instruction.svh in ./test_bench
        type instruction is (
                i_regtype,i_add,i_addi ,i_mul,i_and  ,i_andi ,i_beqz ,i_benz ,i_j ,i_jal ,i_lw ,i_nop ,i_or 
                ,i_ori ,i_sge ,i_sgei ,i_sle ,i_slei ,i_sll ,i_slli ,i_sne ,i_snei ,i_srl ,
                i_srli ,i_sub ,i_subi ,i_sw ,i_xor ,i_xori

            );
        attribute encoding: std_logic_vector(OP_CODE_SIZE-1 downto 0);
        attribute encoding of i_regtype[return instruction] : literal is b"00"&x"0";
        attribute encoding of i_add[return instruction] : literal is b"10"&x"0";
        attribute encoding of i_addi[return instruction] : literal is b"00"&x"8";
        attribute encoding of i_mul[return instruction] : literal is b"11"&x"f";
        attribute encoding of i_and[return instruction] : literal is b"10"&x"4";
        attribute encoding of i_andi[return instruction] : literal is b"00"&x"c";
        attribute encoding of i_beqz[return instruction] : literal is b"00"&x"4";
        attribute encoding of i_benz[return instruction] : literal is b"00"&x"5";
        attribute encoding of i_j[return instruction] : literal is b"00"&x"2";
        attribute encoding of i_jal[return instruction] : literal is b"00"&x"3";
        attribute encoding of i_lw[return instruction] : literal is b"10"&x"3";
        attribute encoding of i_nop[return instruction] : literal is b"01"&x"5";
        attribute encoding of i_or[return instruction] : literal is b"10"&x"5";
        attribute encoding of i_ori[return instruction] : literal is b"00"&x"d";
        attribute encoding of i_sge[return instruction] : literal is b"10"&x"d";
        attribute encoding of i_sgei[return instruction] : literal is b"01"&x"d";
        attribute encoding of i_sle[return instruction] : literal is b"10"&x"c";
        attribute encoding of i_slei[return instruction] : literal is b"01"&x"c";
        attribute encoding of i_sll[return instruction] : literal is b"00"&x"4";
        attribute encoding of i_slli[return instruction] : literal is b"01"&x"4";
        attribute encoding of i_sne[return instruction] : literal is b"10"&x"9";
        attribute encoding of i_snei[return instruction] : literal is b"01"&x"9";
        attribute encoding of i_srl[return instruction] : literal is b"00"&x"6";
        attribute encoding of i_srli[return instruction] : literal is b"10"&x"6";
        attribute encoding of i_sub[return instruction] : literal is b"10"&x"2";
        attribute encoding of i_subi[return instruction] : literal is b"00"&x"a";
        attribute encoding of i_sw[return instruction] : literal is b"10"&x"b";
        attribute encoding of i_xor[return instruction] : literal is b"10"&x"6";
        attribute encoding of i_xori[return instruction] : literal is b"00"&x"e";

        end globals;

        package body globals is




            -- function for transforming from big endian to little endian
            function b2l_endian (a : in std_logic_vector)
                return std_logic_vector is
                variable result : std_logic_vector(a'RANGE);
				constant cNumBytes : natural := a'length / 8;

            begin
      			for i in 0 to cNumBytes-1 loop
 				     for j in 7 downto 0 loop
				        result(8*i + j) :=a(8*(cNumBytes-1-i) + j);
				     end loop;  -- j
			    end loop;  -- i

                return result;
            end; -- function b2l_endian


            -- function for transforming from little endian to big endian  it is actually the same function
            function l2b_endian(a : in std_logic_vector)
                return std_logic_vector is
                variable result : std_logic_vector(a'RANGE);
                constant cNumBytes : natural := a'length / 8;
            begin
         		for i in 0 to cNumBytes-1 loop
 				    for j in 7 downto 0 loop
				        result(8*i + j) :=a(8*(cNumBytes-1-i) + j);
				     end loop;  -- j
			    end loop;  -- i

                return result;
            end; -- function l2b_endian


        end package body globals;


