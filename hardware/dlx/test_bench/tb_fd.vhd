library IEEE;
use IEEE.std_logic_1164.all;


entity TBFD is
end TBFD;

architecture TEST of TBFD is

	signal	CK:		std_logic :='0';
	signal	RESET:		std_logic :='0';
	signal	D:		std_logic :='0';
	signal	QSYNCH:		std_logic;
	signal	QASYNCH:	std_logic;
	
	component FD
	
	Port (	CK:	In	std_logic;
		RESET:	In	std_logic;
		D:	In	std_logic;
		Q:	Out	std_logic);
	end component;

begin 
		
	UFD1 : FD
	Port Map ( CK, RESET, D, QSYNCH); -- sinc

	UFD2 : FD
	Port Map ( CK, RESET, D, QASYNCH); -- asinc
	
reset_p:PROCESS
BEGIN
reset<='0';
WAIT FOR 0.6 ns;
reset<='1';
WAIT FOR 1.1 ns;
reset<='0';
WAIT FOR 2.2 ns;
reset<='1';
WAIT FOR 3.2 ns;
reset<='0';
WAIT;
END PROCESS reset_p;


	
process_stimulus:PROCESS
BEGIN
d<='0';
WAIT FOR 0.4 ns;
d<='1';
WAIT FOR 1.1 ns;
d<='0';
WAIT FOR 1.4 ns;
d<='1';
WAIT FOR 1.7 ns;
d<='0';
WAIT FOR 2.1 ns;
d<='1';
WAIT;
END PROCESS process_stimulus;	
	
	PCLOCK : process(CK)
	begin
		CK <= not(CK) after 0.5 ns;	
	end process;



	

end TEST;

configuration FDTEST of TBFD is
   for TEST
      for UFD1 : FD
         use configuration WORK.CFG_FD_PIPPO; -- sincrono
      end for;
      for UFD2 : FD
         use configuration WORK.CFG_FD_PLUTO; -- asincrono
      end for;


   end for;
end FDTEST;

