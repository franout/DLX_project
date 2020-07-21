library ieee; 
use ieee.std_logic_1164.all; 

entity GSB is 
	Port (	P_in_ik:	    In	std_logic;
            G_in_ik:	In	std_logic;
            G_in_kj:	In	std_logic;
            G_out:	Out	std_logic);
end GSB; 

architecture BEHAVIORAL of GSB is

begin

  G_out <= G_in_ik or (P_in_ik and G_in_kj);
  
end BEHAVIORAL;

configuration CFG_GSB_BEHAVIORAL of GSB is	
  for BEHAVIORAL
  end for;
end CFG_GSB_BEHAVIORAL;
