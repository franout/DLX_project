library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;


-- carry select block 
entity CSB is 
    generic (DCSBS : 	Time := 0 ns;
             DCSBC : 	Time := 0 ns;
             NBIT  : 	Natural := 8);
    Port (  A:	In	std_logic_vector((NBIT-1) downto 0);
            B:	In	std_logic_vector((NBIT-1) downto 0);
            Ci:	In	std_logic;
            S:	Out	std_logic_vector((NBIT-1) downto 0));
end CSB; 

architecture STRUCTURAL of CSB is

    component RCA is
        generic (NBIT  : 	Natural := 8);
        Port (  A:	In	std_logic_vector((NBIT-1) downto 0);
                B:	In	std_logic_vector((NBIT-1) downto 0);
                Ci:	In	std_logic;
                S:	Out	std_logic_vector((NBIT-1) downto 0);
                Co:	Out	std_logic);
    end component;

    signal out_c0, out_c1 : std_logic_vector((NBIT-1) downto 0);

begin
	-- generating both the sums with the two possible values of the carry in 
	-- instantation of the rca with the carry in sets to zero
    RCA0: RCA generic map(NBIT => NBIT) port map (A => A, B => B, Ci => '0', S => out_c0);
	-- instantaton of the rca with the carry in sets to one 
    RCA1: RCA generic map( NBIT => NBIT) port map (A => A, B => B, Ci => '1', S => out_c1);

    --behavioural mux component
    S <=    out_c0 when Ci = '0' else
            out_c1;
				        
end STRUCTURAL;

configuration CFG_CSB_STRUCTURAL of CSB is
    for STRUCTURAL
        for all : RCA
            use configuration WORK.CFG_RCA_STRUCTURAL;
        end for;
    end for;
end CFG_CSB_STRUCTURAL;
