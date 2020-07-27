library IEEE;

use IEEE.std_logic_1164.all;
use WORK.constants.all;

entity TBMUX21_GENERIC is
end TBMUX21_GENERIC;

architecture TEST of TBMUX21_GENERIC is

        constant NBIT: integer := 16; 
	signal	A1:	std_logic_vector(NBIT-1 downto 0);
	signal	B1:	std_logic_vector(NBIT-1 downto 0);
	signal	S1:	std_logic;
	signal	output1:	std_logic_vector(NBIT-1 downto 0);
	signal	output2:	std_logic_vector(NBIT-1 downto 0);
	
	component mux21_nbit
	Generic (N: integer:= numBit);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0) ;
		B:	In	std_logic_vector(NBIT-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(NBIT-1 downto 0));
	end component;

begin 
		
	U1 : mux21_nbit
	Generic Map (NBIT)
	Port Map ( A1, B1, S1, output1); 

	U2 : mux21_nbit
	Generic Map (NBIT)
	Port Map ( A1, B1, S1, output2); 



		A1 <= "0000000100000001";
		B1 <= "1000000000000001";
		S1 <= '0', '1' after 5 ns;


end TEST;

configuration MUX21GENTEST of TBMUX21_GENERIC is
   for TEST
      for U1: MUX21_NBIT
         use configuration WORK.CFG_MUX21_GENERIC_BEH; 
      end for;

      for U2: MUX21_nbit
         use configuration WORK.CFG_MUX21_GENERIC_STRUC; 
      end for;

   end for;
end MUX21GENTEST;

