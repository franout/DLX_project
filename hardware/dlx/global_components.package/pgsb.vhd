library ieee; 
use ieee.std_logic_1164.all; 

entity PGSB is 
  Port (  P_in_ik:      In  std_logic;
            P_in_kj:      In  std_logic;
            G_in_ik:  In  std_logic;
            G_in_kj:  In  std_logic;
            G_out:  Out std_logic;
            P_out:  Out std_logic);
end PGSB; 

architecture BEHAVIORAL of PGSB is

begin

  G_out <= G_in_ik or (P_in_ik and G_in_kj);
  P_out <= P_in_ik and P_in_kj;
  
end BEHAVIORAL;

configuration CFG_PGSB_BEHAVIORAL of PGSB is  
  for BEHAVIORAL
  end for;
end CFG_PGSB_BEHAVIORAL;