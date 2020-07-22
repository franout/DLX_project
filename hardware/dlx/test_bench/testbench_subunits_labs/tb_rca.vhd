library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; -- we need a conversion to unsigned 

entity TBRCA is 
end TBRCA; 

architecture TEST of TBRCA is

  component LFSR16 
    port (CLK, RESET, LD, EN : in std_logic; 
          DIN : in std_logic_vector(15 downto 0); 
          PRN : out std_logic_vector(15 downto 0); 
          ZERO_D : out std_logic);
  end component;

  component RCA
        generic ( DRCAS : Time := 0 ns;
	          DRCAC : Time := 0 ns;
		  NBIT : Natural := 8);
	Port (	A:	In	std_logic_vector(5 downto 0);
		B:	In	std_logic_vector(5 downto 0);
		Ci:	In	std_logic;
		S:	Out	std_logic_vector(5 downto 0);
		Co:	Out	std_logic);
  end component;
  

  constant Period: time := 1 ns; -- Clock period (1 GHz)
  signal CLK : std_logic :='0';
  signal RESET,LD,EN,ZERO_D : std_logic;
  signal DIN, PRN : std_logic_vector(15 downto 0);
  signal test : std_logic;

  signal A, B, S1, S2, S3 : std_logic_vector(5 downto 0);
  signal Ci, Co1, Co2, Co3 : std_logic;

Begin

-- Instanciate the ADDER without delay in the carry generation
  UADDER1: RCA 
	   generic map (DRCAS => 0.02 ns, DRCAC => 0 ns, NBIT => 6) 
	   port map (A, B, Ci, S1, Co1);
  
-- Instanciate the ADDER with delay
  UADDER2: RCA 
	   generic map (DRCAS => 0.02 ns, DRCAC => 0.02 ns, NBIT => 6) 
	   port map (A, B, Ci, S2, Co2);

-- Instanciate the ADDER behavioral
  UADDER3: RCA 
	   generic map (DRCAS => 0.02 ns, DRCAC => 0.02 ns, NBIT => 6) 
	   port map (A, B, Ci, S3, Co3);
  



-- Forcing adder input to LFSR output
  Ci <= '0';

  --A <= "010001";
  A(0) <= PRN(0);
  A(5) <= PRN(2);
  A(3) <= PRN(4);
  A(1) <= PRN(6);
  A(4) <= PRN(8);
  A(2) <= PRN(10);
  
  B(0) <= PRN(1);
  B(5) <= PRN(3);
  B(3) <= PRN(5);
  B(1) <= PRN(7);
  B(4) <= PRN(9);
  B(2) <= PRN(11);
  

-- Instanciate the Unit Under Test (UUT)
  UUT: LFSR16 port map (CLK=>CLK, RESET=>RESET, LD=>LD, EN=>EN, 
                        DIN=>DIN,PRN=>PRN, ZERO_D=>ZERO_D);
-- Create the permanent Clock and the Reset pulse
  CLK <= not CLK after Period/2;
  RESET <= '1', '0' after Period;
-- Open file, make a load, and wait for a timeout in case of design error.
  STIMULUS1: process
  begin
    DIN <= "0000000000000001";
    EN <='1';
    LD <='1';
    wait for 2 * PERIOD;
    LD <='0';
    wait for (65600 * PERIOD);
  end process STIMULUS1;

end TEST;

configuration RCATEST of TBRCA is
  for TEST
    for UADDER1: RCA
      use configuration WORK.CFG_RCA_STRUCTURAL;
    end for;
    for UADDER2: RCA
      use configuration WORK.CFG_RCA_STRUCTURAL;
    end for;
    for UADDER3: RCA
      use configuration WORK.CFG_RCA_BEHAVIORAL;
    end for;
  end for;
end RCATEST;
