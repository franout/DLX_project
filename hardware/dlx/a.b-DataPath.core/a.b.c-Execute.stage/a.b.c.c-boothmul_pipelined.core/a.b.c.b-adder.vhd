LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- behavioural adder 
ENTITY adder IS
	GENERIC ( NBIT :    integer := 8 ); -- number of bits for the adder
	PORT( a,b      : IN std_logic_vector(NBIT-1 DOWNTO 0 );
		cin : IN  std_logic;
		s   : OUT std_logic_vector(NBIT DOWNTO 0));
END ENTITY adder;


ARCHITECTURE beh OF adder IS


BEGIN

	PROCESS (a,b,cin)
	BEGIN
		s <= std_logic_vector(signed(a(NBIT-1) & a)+signed(b(NBIT-1) & b)+('0'&cin));
	END PROCESS;

END beh;

CONFIGURATION CFG_ADDER_BEH OF adder IS
	for beh
	end for;
END CONFIGURATION CFG_ADDER_BEH;
