LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


-- this encoder is basically a LUT 
ENTITY encoder IS
	PORT (y : IN std_logic_vector(2 DOWNTO 0);
		sel : OUT std_logic_vector(2 DOWNTO 0));
END ENTITY encoder;


ARCHITECTURE beh OF encoder IS
	type mem_t is array(0 to (2**3)-1) of std_logic_vector(2 downto 0);
	constant LUT_enc : mem_t := ("000", "001", "001", "010", "110", "111", "111", "000"); -- selection signal for the multiplexer in order to correctly 																							--select 0, A,- A,-2A
BEGIN
	sel <= LUT_enc(to_integer(unsigned(y)));
END beh;


configuration CFG_ENCODER_BEH of encoder is
	for beh
	end for;
end CFG_ENCODER_BEH;
