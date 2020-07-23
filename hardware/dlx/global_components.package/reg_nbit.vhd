library  ieee;
use IeeE.std_logic_1164.ALL;
use WORK.CONSTANTS.all;


entity reg_nbit IS
  generic ( n: INTEGER := numbit);
  port (clk,reset:in std_logic;
      d:in std_logic_vector(N-1 DOWNTO 0);
        Q:out std_logic_vector(N-1 downto 0));
  end entity REG_NBIT;


  architecture struc of reg_nbit IS
    component  FD is
	Port (	D:	In	std_logic;
		CK:	In	std_logic;
		RESET:	In	std_logic;
		Q:	Out	std_logic);
end component  FD;

BEGIN
    reg:for I in 0 to N-1 GENERATE

D_I: fd port MAP(D(I),CLK,RESET,Q(I));
  
        end generate reg;
      
  end struc;

configuration CFG_REG_PIPPO of reg_nbit IS
  for struc
    for reg

  for d_i:  fd use configuration work.CFG_FD_PIPPO;
  end for;

  
  end for;
    end for;
  end CFG_REG_PIPPO;


  configuratiOn CFG_REG_PLUTO of reg_nBit IS
    for struc
    for reg
    for d_i: fd use configuration work.CFG_FD_PLUTO;
  end for;
  end FOR;
  end FOR;
  end CFG_REG_PLUTO;
