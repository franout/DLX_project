LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.constants.ALL;


ENTITY  tb_stcg IS
END ENTITY tb_stcg;

ARCHITECTURE test OF tb_stcg IS
COMPONENT  STCG is 
    generic (   NBIT:   Natural := 32;
                SDIST:  Natural := 4);
    Port (  A:      In  std_logic_vector(NBIT-1 downto 0);
            B:      In  std_logic_vector(NBIT-1 downto 0);
            cin: IN std_logic;
            Cout:   Out std_logic_vector(NBIT downto 0)); -- the last bit is the carry out 
end COMPONENT STCG; 

SIGNAL tb_a,tb_b: std_logic_vector( 31 DOWNTO 0 );
SIGNAL tb_out: std_logic_vector( 32 DOWNTO 0);
SIGNAL tb_co: std_logic_vector((32/4-1) DOWNTO 0);
SIGNAL tb_cin,tb_cout: std_logic;

BEGIN
dut: stcg GENERIC MAP(NBIT=>32,SDIST=>4) PORT MAP(A=>tb_a,B=>tb_b,cin=>tb_cin,Cout=>tb_out);

usefulcarry:FOR I IN 0 TO 7 GENERATE
tb_co(i)<=tb_out(4*(i));
END GENERATE usefulcarry;
tb_cout<=tb_out(32);

stimulus:PROCESS
BEGIN
tb_cin<='0';
tb_a<=x"FFFFFFFF";
tb_b<=x"00000001";
WAIT FOR 5 ns;
ASSERT tb_co=x"FD" REPORT "WRONG CARRY GENERATION" SEVERITY FAILURE ; 
END PROCESS stimulus;



END test;

CONFIGURATION CGF_TB_STCG OF tb_stcg IS
for test
for dut: STCG use configuration work.CFG_STCG_STRUCTURAL;
end for;
end for;
END CONFIGURATION CGF_TB_STCG;



