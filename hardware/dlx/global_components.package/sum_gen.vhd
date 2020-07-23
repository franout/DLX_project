library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;


-- sum generator with carry select lines 
entity SUM_GEN is 
    generic (DSUM_GENS : 	Time := 0 ns;
             DSUM_GENC : 	Time := 0 ns;
             NBIT  : 	Natural := 32;
             NBLOCKS :  Natural := 4);
    Port (  A:	In	std_logic_vector((NBIT-1) downto 0);
            B:	In	std_logic_vector((NBIT-1) downto 0);
            Ci:	In	std_logic_vector((NBIT-1) downto 0); -- vector of carry select for each carry select block 
            S:	Out	std_logic_vector((NBIT-1) downto 0));
end SUM_GEN; 

architecture STRUCTURAL of SUM_GEN is

    component CSB is 
        generic (DCSBS : 	Time := 0 ns;
                 DCSBC : 	Time := 0 ns;
                 NBIT  : 	Natural := 8);
        Port (  A:	In	std_logic_vector((NBIT-1) downto 0);
                B:	In	std_logic_vector((NBIT-1) downto 0);
                Ci:	In	std_logic;
                S:	Out	std_logic_vector((NBIT-1) downto 0));
    end component;

    constant CSB_BIT : Natural := NBIT/NBLOCKS; -- number of bit for each CSB ( carry select block ) 

begin
	
	--- instantiate of the chain of carry select block on CSB_BIT with the proper index for getting the right input and output signals 
   GENCSB: for i IN 0 to NBLOCKS-1 generate
        CSBi: CSB generic map(DCSBS => DSUM_GENS, DCSBC => DSUM_GENC, NBIT => CSB_BIT) port map (A => A(((i+1)*CSB_BIT)-1 downto (i*CSB_BIT)), B => B(((i+1)*CSB_BIT)-1 downto (i*CSB_BIT)), Ci => Ci(i*CSB_BIT), S => S(((i+1)*CSB_BIT)-1 downto (i*CSB_BIT)));
    end generate;

end STRUCTURAL;

configuration CFG_SUM_GEN_STRUCTURAL of SUM_GEN is
    for STRUCTURAL
        for all : CSB
            use configuration WORK.CFG_CSB_STRUCTURAL;
        end for;
    end for;
end CFG_SUM_GEN_STRUCTURAL;
