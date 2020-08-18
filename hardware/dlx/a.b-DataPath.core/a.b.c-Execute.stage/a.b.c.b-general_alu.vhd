--------------------------------------------------------------------------------
-- Title       : General alu
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c.b-general_alu.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Sat Aug  8 12:22:46 2020
-- Last update : Mon Aug 17 11:41:56 2020
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
  generic (N : integer := 32);
  port (
    -- signal for pipelined booth multipliers
    clk,rst : in std_logic;
    -- exception control logic 
    zero_mul_detect  : out std_logic;
    mul_exeception   : out std_logic;
    FUNC             : IN  TYPE_OP_ALU;
    DATA1, DATA2     : IN  std_logic_vector(N-1 downto 0);
    cin              : in  std_logic;
    signed_notsigned : in  std_logic;
    overflow         : out std_logic;
    OUTALU           : OUT std_logic_vector(N-1 downto 0));
end entity general_alu;

architecture behavioural of general_alu is

  component boothmul_pipelined is
    generic (
      N : integer := 32
    );
    port (
      clk,rst                  : in  std_logic;
      multiplier, multiplicand : IN  std_logic_vector(N-1 DOWNTO 0);
      result                   : OUT std_logic_vector(2*N-1 DOWNTO 0)
    );
  end component boothmul_pipelined;

  --  upper bound for rotate operations 
  constant logN              : integer := f_log2(N);
  signal adder_out           : std_logic_vector(N-1 downto 0);
  signal DATA2_I             : std_logic_vector(N-1 downto 0);
  signal data1_mul,data2_mul : std_logic_vector(N/2-1 downto 0);
  signal dataout_mul         : std_logic_vector(N-1 downto 0);
  signal cout                : std_logic;
begin

    -- defined in global_components 
    -- p4 adder using the sparse tree carry generator 
    -- for both addition and subtraction 
    p4_adder_lab : p4_adder generic map (
      NBIT => N
    )
    port map (
      a    => DATA1,
      b    => DATA2_I,
      cin  => cin,
      cout => cout,
      s    => adder_out
    );

  boothmul_pipelined_i : boothmul_pipelined
    generic map (
      N => N/2
    )
    port map (
      clk          => clk,
      rst          => rst,
      multiplier   => data1_mul ,
      multiplicand => data2_mul,
      result       => dataout_mul
    );



  P_ALU: process (FUNC, DATA1, DATA2,adder_out,dataout_mul,cout)
    variable tmp                               : std_logic_vector(N-1 downto 0);
    variable check_mul_logic,check_mul_logic2 : std_logic := '1';
  begin
    case FUNC is
      when ADD => DATA2_I <= DATA2;
        OUTALU <= adder_out;
        -- overflow logic if(signed_notsigned='1') then 
        -- check overflow only if they have different sign
        if(signed_notsigned='1') then
          if(DATA1(N-1)/=DATA2(N-1)) then
            if(adder_out(N-1)/=DATA1(N-1)) then
              overflow <= '1';
            end if;
          end if;
        else -- unsigned computation
          overflow <= cout;
        end if;

      when SUB =>                     -- addition between the two complement 
         DATA2_I <= not(DATA2);      -- +1 from cin (from CU)
        OUTALU <= adder_out;

        if(signed_notsigned='1')then
          if(DATA1(N-1)/=DATA2(N-1)) then
            if(adder_out(N-1)=DATA2(N-1)) then
              overflow <= '1';
            end if;
          end if;
        else -- unsigned
          overflow <= cout;
        end if;


      when MULT => -- using the booth multiplier ( a pipelined version of the lab's one) 
        data1_mul <= DATA1((N/2)-1 DOWNTO 0);
        data2_mul <= DATA2((N/2)-1 downto 0);
        -- exception if using multiplication between bitwidth > 16
        for i in N-1 downto N/2  loop
          check_mul_logic := not(data1(i)) and check_mul_logic and not(data2(i));
        end loop ;
        if(check_mul_logic='0') then
          mul_exeception <= '1';
        else
          mul_exeception <= '0';
        end if;
        -- if not exception keep continuing check 
        --zero detect logic 
		check_mul_logic:='1';
		check_mul_logic2:='1';
        for i in N/2-1 downto 0 loop
          check_mul_logic   := check_mul_logic and not(data1(i));
          check_mul_logic2 := check_mul_logic2 and not(data2(i));
        end loop ;
        if(check_mul_logic2='1' or  check_mul_logic='1' ) then
          zero_mul_detect <= '1';
          OUTALU    <= (OTHERS=>'0');
        else
          zero_mul_detect <= '0';
          OUTALU    <= dataout_mul;
        end if;
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
      when others => 
			OUTALU<=(OTHERS=>'0');
			overflow<='0';
			zero_mul_detect<='0';
		    mul_exeception <='0';
    end case;
  end process P_ALU;




end architecture behavioural;
