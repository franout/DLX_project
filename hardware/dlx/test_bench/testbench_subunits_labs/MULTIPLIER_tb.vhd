library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use WORK.CONSTANTS.all;

entity MULTIPLIER_tb is
end MULTIPLIER_tb;


architecture TEST of MULTIPLIER_tb is


  COMPONENT  boothmul IS
            GENERIC(N: integer:=8);
            PORT( multiplier, multiplicand:IN std_logic_vector(N-1 DOWNTO 0);
                   result: OUT std_logic_vector(2*N-1 DOWNTO 0));
END COMPONENT boothmul;

  COMPONENT  mult_gm IS
            GENERIC(N: integer:=8);
            PORT( multiplier, multiplicand:IN std_logic_vector(N-1 DOWNTO 0);
                   result: OUT std_logic_vector(2*N-1 DOWNTO 0));
END COMPONENT mult_gm;
  
  --  input	 
  signal A_mp_i : std_logic_vector(numBit-1 downto 0) := (OTHERS => '0');
  signal B_mp_i : std_logic_vector(numBit-1 downto 0) := (OTHERS => '0');

  -- output
  signal Y_mp_i,Y_mp_i1 : std_logic_vector(2*numBit-1 downto 0);





begin

dut: mult_gm GENERIC MAP(N=>numBit) PORT MAP(multiplier=>A_mp_i,multiplicand=>B_mp_i,result=>Y_mp_i);
dut1: boothmul GENERIC MAP(N=>numBit) PORT MAP(multiplier=>A_mp_i,multiplicand=>B_mp_i,result=>Y_mp_i1);


-- PROCESS FOR TESTING TEST ---------
  stimulus: process
  begin
  -- cycle for operand A
    NumROW:for i in 1 to (2**numBit)-1 loop

    	    -- cycle for operand B
    		NumCOL:for j in 0 to (2**numBit)-1 loop
		    wait for 1 ns;
		    B_mp_i <= std_logic_vector(unsigned(B_mp_i)+"01");
			WAIT for 1 ns;
    	    ASSERT signed(Y_mp_i)=signed(Y_mp_i1)  REPORT "wrong multiplication" SEVERITY WARNING;

		end loop NumCOL ;

		A_mp_i <= std_logic_vector(unsigned(A_mp_i)+"01"); 	

	end loop NumROW;
    wait;          
end process stimulus;


end TEST;
