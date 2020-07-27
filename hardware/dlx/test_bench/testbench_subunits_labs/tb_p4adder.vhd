LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE work.constants.ALL;

ENTITY tb_p4adder IS
END ENTITY tb_p4adder;

ARCHITECTURE test OF tb_p4adder IS

CONSTANT tb_nbit: integer := 32;

COMPONENT  p4_adder IS
      GENERIC ( NBIT: integer :=8 ); -- number of bits for the adder
       PORT( a,b: IN std_logic_vector(NBIT -1 DOWNTO 0 );
                cin: IN std_logic;
               s:OUT std_logic_vector(NBIT-1 DOWNTO 0));

END COMPONENT  p4_adder;


SIGNAL tb_a,tb_b,tb_s: std_logic_vector(tb_nbit-1 DOWNTO 0);
SIGNAL tb_cin: std_logic;

BEGIN
dut: p4_adder GENERIC MAP(tb_nbit) PORT MAP(a=>tb_a,b=>tb_b,cin=>tb_cin,s=>tb_s);


stimulus:PROCESS
BEGIN
tb_cin<='0';
tb_a<=(OTHERS=>'0');
tb_b<=(OTHERS=>'0');
WAIT FOR 5 ns;

FOR I IN 0 TO 10 LOOP -- generation of sequential value 
    tb_a<=std_logic_vector(unsigned(tb_a)+"01"); -- adding one to previous value
    WAIT FOR 5 ns;
    tb_b<=std_logic_vector(unsigned(tb_b)+"10"); -- adding two to previous value
    WAIT FOR 5 ns;
END LOOP;

tb_cin<='1'; -- testing result with carry in 
WAIT FOR 5 ns;
tb_cin<='0';
-- checking the correct carry propagation
tb_a<=x"00000001";
tb_b<=(OTHERS=>'1');
WAIT FOR 5 ns;
WAIT;
END PROCESS stimulus;

END test;

CONFIGURATION CFG_TB_P4ADDER OF tb_p4adder IS
for test
end for;
END CONFIGURATION CFG_TB_P4ADDER;
