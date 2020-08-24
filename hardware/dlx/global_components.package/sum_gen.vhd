library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity SUM_GEN is 
    generic (DSUM_GENS :    Time := 0 ns;
             DSUM_GENC :    Time := 0 ns;
             NBIT  :    Natural := 32;
             NBLOCKS :  Natural := 4);
    Port (  A:  In  std_logic_vector((NBIT-1) downto 0);
            B:  In  std_logic_vector((NBIT-1) downto 0);
            Ci: In  std_logic_vector((NBIT-1) downto 0);
            S:  Out std_logic_vector((NBIT-1) downto 0));
end SUM_GEN; 

architecture STRUCTURAL of SUM_GEN is

    component CSB is 
        generic (DCSBS :    Time := 0 ns;
                 DCSBC :    Time := 0 ns;
                 NBIT  :    Natural := 8);
        Port (  A:  In  std_logic_vector((NBIT-1) downto 0);
                B:  In  std_logic_vector((NBIT-1) downto 0);
                Ci: In  std_logic;
                S:  Out std_logic_vector((NBIT-1) downto 0));
    end component;

    constant CSB_BIT : Natural := NBIT/NBLOCKS;

begin

   GENCSB: for i IN 0 to NBLOCKS-1 generate
        CSBi: CSB generic map(DCSBS => DSUM_GENS, DCSBC => DSUM_GENC, NBIT => CSB_BIT) port map (A => A(((i+1)*CSB_BIT)-1 downto (i*CSB_BIT)), B => B(((i+1)*CSB_BIT)-1 downto (i*CSB_BIT)), Ci => Ci(i*CSB_BIT), S => S(((i+1)*CSB_BIT)-1 downto (i*CSB_BIT)));
    end generate;

end STRUCTURAL;

--configuration CFG_SUM_GEN_STRUCTURAL of SUM_GEN is
--    for STRUCTURAL
--        for all : CSB
--            use configuration WORK.CFG_CSB_STRUCTURAL;
--        end for;
--    end for;
--end CFG_SUM_GEN_STRUCTURAL;
