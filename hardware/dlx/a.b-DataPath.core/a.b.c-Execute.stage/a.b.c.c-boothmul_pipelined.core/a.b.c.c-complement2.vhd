LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


-- this entity is used for providing the 2's complement of a given input value
ENTITY complement2 IS
GENERIC ( N:integer:=8);
PORT( value_in: IN std_logic_vector(N-1 DOWNTO 0);
	value_out: OUT std_logic_vector(N-1 DOWNTO 0));

END ENTITY complement2;

ARCHITECTURE beh OF complement2 IS


BEGIN
PROCESS (value_in)
BEGIN 

-- computing the 2's complement of the input value 
value_out <= std_logic_vector(unsigned(NOT(value_in))+1); 


END PROCESS;

END beh;

configuration CFG_COMPLEMENT2_BEH of complement2 is
	for beh
	end for;
end CFG_COMPLEMENT2_BEH;
