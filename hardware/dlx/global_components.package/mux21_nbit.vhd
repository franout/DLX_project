library ieee;
use ieee.std_logic_1164.ALL;
use work.constants.ALL;

	entity  mux21_nbit IS
	Generic (N: integer:= NUMBIT
		-- DELAY_MUX: Time:= TP_MUX
);
	Port (	A:	In	std_logic_vector(N-1 downto 0) ;
		B:	In	std_logic_vector(N-1 downto 0);
		SEL:	In	std_logic;
		Y:	Out	std_logic_vector(N-1 downto 0));
	end entity mux21_nbit;


      architecture beh of mux21_nbit IS

        begin
          process(a,b,sel)
            BEGIN
              if ( sel='1') THEN
              y<=a;
                elsif( sel='0') then
                  y<=b;
                  end IF;

              end PROCESS;
        
        end beh;

      architecture struc of mux21_nbit IS

component  MUX21 is
	Port (	A:	In	std_logic;
		B:	In	std_logic;
		S:	In	std_logic;
		Y:	Out	std_logic);
end component  MUX21;
        
        
        begin

          str:for i in 0 to N-1 GENERATE
            muxi: mux21 port MAP(a=>a(i),b=>b(i),s=>sel,y=>y(i));
              end GENERATE str;

        end struc;

        

configuration CFG_MUX21_GENERIC_BEH of MUX21_NBIT is
	for beh
	end for;
end CFG_MUX21_GENERIC_BEH;

configuration CFG_MUX21_GENERIC_STRUC of MUX21_NBIT Is
for struc
		for str
		for muxi: mux21 USE CONFIGURATION work.CFG_MUX21_BEHAVIORAL_2;
		end for;
  end for;
end for;

  end CFG_MUX21_GENERIC_STRUC;

