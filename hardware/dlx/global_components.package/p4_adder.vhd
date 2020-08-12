LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.constants.ALL;

-- pentium 4 adder 
ENTITY p4_adder IS
      GENERIC ( NBIT: integer :=8 ); -- number of bits for the adder
       PORT( a,b: IN std_logic_vector(NBIT -1 DOWNTO 0 );
                cin: IN std_logic;
               s:OUT std_logic_vector(NBIT-1 DOWNTO 0);
                cout: OUT std_logic);
END ENTITY p4_adder;

ARCHITECTURE struc OF p4_adder IS


-- sparse tree carry generator
COMPONENT  STCG is 
    generic (   NBIT:   Natural := 32;
                SDIST:  Natural := 4);
    Port (  A:      In  std_logic_vector(NBIT-1 downto 0);
            B:      In  std_logic_vector(NBIT-1 downto 0);
            cin: IN std_logic;
            Cout:   Out std_logic_vector(NBIT downto 0));
end COMPONENT STCG;

-- sum generator
COMPONENT  SUM_GEN is 
    generic (DSUM_GENS : 	Time := 0 ns;
             DSUM_GENC : 	Time := 0 ns;
             NBIT  : 	Natural := 32;
             NBLOCKS :  Natural := 4);
    Port (  A:	In	std_logic_vector((NBIT-1) downto 0);
            B:	In	std_logic_vector((NBIT-1) downto 0);
            Ci:	In	std_logic_vector((NBIT-1) downto 0);
            S:	Out	std_logic_vector((NBIT-1) downto 0));
end COMPONENT SUM_GEN;


constant nbit_rca: integer:= 4;
SIGNAL C_select: std_logic_vector( NBIT DOWNTO 0);

BEGIN

carry_select: stcg GENERIC MAP (NBIT=>NBIT,SDIST=>nbit_rca) PORT MAP(A=>a,B=>b,cin=>cin,Cout=>C_select);
sums: sum_gen GENERIC MAP (DSUM_GENS=> 0 ns,DSUM_GENC=> 0 ns,NBIT=>NBIT,NBlocks=>nbit_rca ) PORT MAP(A=>a,B=>b,Ci=>c_select( NBIT-1 DOWNTO 0),S=>s);
cout<=C_select(NBIT);


END struc;

