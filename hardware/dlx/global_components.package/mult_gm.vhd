LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.constants.ALL;

-- goldedn model of a multiplier with an high level operation
-- used for checking in the testbench
ENTITY mult_gm IS
    GENERIC(N: integer:=32);
    PORT( multiplier, multiplicand:IN std_logic_vector(N-1 DOWNTO 0);
           result: OUT std_logic_vector(2*N-1 DOWNTO 0));
END ENTITY mult_gm;


ARCHITECTURE GM OF mult_gm IS

BEGIN

    result<=std_logic_vector(signed(multiplier)*signed(multiplicand));

END GM;

CONFIGURATION CFG_MULT_GM OF mult_gm IS
for GM
end for;
END CFG_MULT_GM;
