library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADDER_32 is
	generic (n: NATURAL:= 33);	        
	port (INA_ADD: in signed (n-1 downto 0);
		  	INB_ADD: in signed (n-1 downto 0);
		  	OUT_ADD: out signed (n-1 downto 0);
		  	CTRL_ADD1, CTRL_ADD2: in STD_LOGIC);
end entity ADDER_32;

architecture Behaviour if ADDER_32 is 
	begin	  
	discrimination: process (CTRL_ADD1, CTRL_ADD2) is
		begin
			if CTRL_ADD1 = '1' and CTRL_ADD2 = '0' then
				OUT_ADD <= INA_ADD - INB_ADD;
			elsif CTRL_ADD1 = '0' and CTRL_ADD2 = '1' then
				OUT_ADD <= INB_ADD - INA_ADD;
			else				
			  	OUT_ADD <= INA_ADD + INB_ADD;
			end if;
		end process;
end architecture Behaviour;