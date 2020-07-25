library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use work.globals.ALL;

--- a multiplexer for selection among a generic number of signals glued together 
	entity  MUX_zbit_nbit IS
		Generic (	N: integer:= NUMBIT; -- number of bit for every signal
					Z: integer:= 3); -- log2 of the number of signals in input, baiscally it is the length of the selection signal 
		Port (	inputs:	In std_logic_vector(0 TO  ((2**Z)*(N))-1 ); -- one single input with the concatenantion of all input signals 
				SEL:	In std_logic_vector(Z-1 downto 0);
				Y:		Out	std_logic_vector(N-1 downto 0));
	end entity mux_zbit_nbit;


	architecture beh of mux_zbit_nbit IS
	
	begin

		PROCESS(inputs,sel)
			variable x : integer;
		BEGIN
			--looping over all the signals, checking for the correct one to choose 
    		for i in 0 to (2**Z)-1 loop
				if (i = to_integer(unsigned(SEL))) then
					x:=(i+1) * N;
			  		Y <= inputs(X-N TO X-1);
				end if;
			end loop;
		END PROCESS;

	end beh;

configuration CFG_MUX_BEH of mux_zbit_nbit is
	for beh
	end for;
end CFG_MUX_BEH;

