library IEEE;
use IEEE.std_logic_1164.all;
use work.CONSTANTS.ALL;

entity tb_regN is
end tb_regN;

architecture TEST of tb_regN is

	signal	CK:		std_logic ;
	signal	RESET:		std_logic ;
	signal	D,QSYNCH,qasynch:	       std_logic_vector(4-1 downto 0);

	

component reg_nbit IS
  generic ( n: INTEGER := 4);
  port (clk,reset:in std_logic;
      d:in std_logic_vector(N-1 DOWNTO 0);
        Q:out std_logic_vector(N-1 downto 0));
  end component REG_NBIT;
  
begin 
		
	reg_sr : reg_nbit generic map(4)
	Port Map (clk=>ck,reset=>reset,d=>d,q=>qsynch ); -- sinc

	reg_asr : reg_nbit generic map(4)
	Port Map ( clk=>ck,reset=>reset,d=>d,q=>qasynch); -- asinc
	


stimulus:PROCESS
  BEGIN

  reset<='1';
    wait for 1.5 ns;
    reset<='0';                 
    wait for 0.3 ns;
    d<="0001";
    wait;
  end process stimulus;
      	
	

	
	PCLOCK : process
	begin
          ck<='0';
          wait for 0.5 ns;
          ck<='1';
          wait for 0.5 ns;
          end process;



	

end TEST;

configuration regn_TEST of tb_regN is
   for TEST
      for reg_sr:reg_nbit use configuration WORK.CFG_REG_PIPPO; -- sincrono
      end for;
      
      for reg_asr:reg_nbit use configuration WORK.CFG_REG_PLUTO; -- asincrono
      end for;


   end for;
end regn_TEST;

