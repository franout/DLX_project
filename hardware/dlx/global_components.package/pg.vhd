library ieee; 
use ieee.std_logic_1164.all; 

entity PG is 
    generic ( NBIT : Natural := 8);
	Port (	A:	In	std_logic_vector(NBIT-1 downto 0);
            B:	In	std_logic_vector(NBIT-1 downto 0);
	    cin : In std_logic;
            p:	Out	std_logic_vector(NBIT-1 downto 0);
            g:	Out	std_logic_vector(NBIT-1 downto 0));
end PG; 

architecture BEHAVIORAL of PG is

begin

  p <= A xor B;
  g(NBIT-1 downto 1) <= A(NBIT-1 downto 1) and B(NBIT-1 downto 1);
  g(0) <= (A(0) and B(0)) or (p(0) and cin);
  
end BEHAVIORAL;

configuration CFG_PG_BEHAVIORAL of PG is	
  for BEHAVIORAL
  end for;
end CFG_PG_BEHAVIORAL;
