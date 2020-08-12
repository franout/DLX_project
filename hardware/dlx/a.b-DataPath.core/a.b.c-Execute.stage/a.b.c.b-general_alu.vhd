--------------------------------------------------------------------------------
-- Title       : General alu
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c.b-general_alu.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Sat Aug  8 12:22:46 2020
-- Last update : Wed Aug 12 23:17:21 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.globals.all;
use WORK.global_components.all;
use WORK.constants.all;


entity general_alu is
  generic (N  :    integer := 32);
  port ( FUNC : IN TYPE_OP_ALU;
    DATA1, DATA2 : IN  std_logic_vector(N-1 downto 0);
    cin          : in  std_logic;
    overflow     : out std_logic;
    OUTALU       : OUT std_logic_vector(N-1 downto 0));
end entity general_alu;

architecture behavioural of general_alu is
  --  upper bound for rotate operations 
  constant logN : integer := f_log2(N);
  signal adder_out: std_logic_vector(N-1 downto 0);
begin

-- defined in global_components
p4_adder_lab: p4_adder generic map (
 NBIT=>N 
)
port map (
  a=>DATA1,
  b=>DATA2,
  cin=>cin,
  cout=>overflow,
  s=> adder_out
);

-- todo HANDLE THE OVERFLOW
  P_ALU : process (FUNC, DATA1, DATA2)
    variable tmp : std_logic_vector(N-1 downto 0);
  begin
    case FUNC is
      when ADD    => OUTALU <= adder_out;
      when SUB    => OUTALU <= std_logic_vector(unsigned(data1)-unsigned(data2)) ; -- we can use the p4 adder
      when MULT   => OUTALU <= std_logic_vector(unsigned(data1((N/2)-1 DOWNTO 0))*unsigned(data2((N/2)-1 DOWNTO 0))); -- add booth multiplier pipelined
      when BITAND => OUTALU <= DATA1 AND DATA2;
      when BITOR  => OUTALU <= DATA1 OR DATA2;
      when BITXOR => OUTALU <= DATA1 XOR DATA2;

      when FUNCLSL => tmp := data1;
        FOR i IN 0 to N-1 LOOP
          if (i < unsigned(data2)) then
            tmp := tmp(N-2 downto 0) & '0';
          end if;
        END LOOP;
        OUTALU <= tmp;

      when FUNCLSR => tmp := data1;
        FOR i IN 0 to N-1 LOOP
          if (i < to_integer(unsigned(data2))) then
            tmp := '0' & tmp(N-1 downto 1);
          end if;
        END LOOP;
        OUTALU <= tmp;


-- remove the rotate for the basic version 
      when FUNCRL => tmp := data1;
        FOR i IN 0 to N-1 LOOP
          if (i < unsigned(data2(logN-1 downto 0))) then
            tmp := tmp(N-2 downto 0) & tmp(N-1);

          end if;
        END LOOP;
        OUTALU <= tmp;


      when FUNCRR =>
        tmp := data1;
        FOR i IN 0 to N-1 LOOP
          if (i < unsigned(data2(logN-1 downto 0))) then
            tmp := tmp(0) & tmp(N-1 downto 1);
          end if;
        END LOOP;
        OUTALU <= tmp;

      when others => null;
    end case;
  end process P_ALU;



end architecture behavioural;