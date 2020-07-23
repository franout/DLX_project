library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.all;

entity register_file is
 generic (  NBITREG: natural := 64;
            NBITADD: natural := 5);
 port ( CLK: 		IN std_logic;
         RESET: 	IN std_logic;
	 ENABLE: 	IN std_logic;
	 RD1: 		IN std_logic;
	 RD2: 		IN std_logic;
	 WR: 		IN std_logic;
	 ADD_WR: 	IN std_logic_vector(NBITADD-1 downto 0);
	 ADD_RD1: 	IN std_logic_vector(NBITADD-1 downto 0);
	 ADD_RD2: 	IN std_logic_vector(NBITADD-1 downto 0);
	 DATAIN: 	IN std_logic_vector(NBITREG-1 downto 0);
     OUT1: 		OUT std_logic_vector(NBITREG-1 downto 0);
	 OUT2: 		OUT std_logic_vector(NBITREG-1 downto 0));
end register_file;

architecture beh of register_file is

    -- suggested structures
    subtype REG_ADDR is natural range 0 to (2**NBITADD)-1; -- using natural type
	type REG_ARRAY is array(REG_ADDR) of std_logic_vector(NBITREG-1 downto 0); 
	signal REGISTERS : REG_ARRAY; 

	
begin 

    process(clk)
    begin
        if(clk'event and clk='1') then
            if(RESET = '1') then
                REGISTERS <= (OTHERS => (OTHERS => '0'));
            else
                if(ENABLE = '1') then
                    if(RD1 = '1') then
                        OUT1 <= REGISTERS(to_integer(unsigned(ADD_RD1)));
                    end if;
                    if(RD2 = '1') then
                        OUT2 <= REGISTERS(to_integer(unsigned(ADD_RD2)));
                    end if;
                    if(WR = '1') then
                        REGISTERS(to_integer(unsigned(ADD_WR))) <= DATAIN;
                    end if;
            
                end if;
            end if;
        end if;
    end process;

end beh;




configuration CFG_RF_BEH of register_file is
  for beh
  end for;
end configuration;
