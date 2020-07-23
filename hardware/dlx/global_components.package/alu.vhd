library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use IEEE.std_logic_arith.all;
use WORK.constants.all;
use WORK.alu_types.all;

entity ALU is
  generic (N : integer := numBit);
  port 	 ( FUNC: IN TYPE_OP;
           DATA1, DATA2: IN std_logic_vector(N-1 downto 0);
           OUTALU: OUT std_logic_vector(N-1 downto 0));
end ALU;

architecture BEHAVIOR of ALU is
-- function for compute the log2 
function f_log2 ( x: integer ) return integer is
    variable i: integer;

    begin
        i:=0;
        while ( 2**i < x ) loop
            i:=i+1;
        end loop;
        return i;
    end function f_log2;
    --  upper bound for rotate operations 
    constant logN : integer := f_log2(N);

begin

P_ALU: process (FUNC, DATA1, DATA2)

  -- complete all the requested functions
    variable tmp : std_logic_vector(N-1 downto 0);
  begin
    case FUNC is
	when ADD 	=> OUTALU <=std_logic_vector(unsigned(data1)+unsigned(data2)) ; 
	when SUB 	=> OUTALU <= std_logic_vector(unsigned(data1)-unsigned(data2)) ;
	when MULT 	=> OUTALU <= std_logic_vector(unsigned(data1((N/2)-1 DOWNTO 0))*unsigned(data2((N/2)-1 DOWNTO 0)));
	when BITAND 	=> 	    	OUTALU <= DATA1 AND DATA2;
	when BITOR 	=>      		OUTALU <= DATA1 OR DATA2;
	when BITXOR 	=>  		OUTALU <= DATA1 XOR DATA2;

    when FUNCLSL 	=>  tmp := data1;
                        FOR i IN 0 to N-1 LOOP
                            if (i < unsigned(data2)) then
                                tmp := tmp(N-2 downto 0) & '0';
                            end if;
                        END LOOP;
                        OUTALU <= tmp;                        

	when FUNCLSR 	=>  tmp := data1;
                        FOR i IN 0 to N-1 LOOP
                            if (i < to_integer(unsigned(data2))) then
                              tmp := '0' & tmp(N-1 downto 1);
							end if;
                        END LOOP;
                        OUTALU <= tmp;


	when FUNCRL 	=>  tmp := data1;
                        FOR i IN 0 to N-1 LOOP
                            if (i < unsigned(data2(logN-1 downto 0))) then
                                tmp := tmp(N-2 downto 0) & tmp(N-1);
					
                            end if;
                        END LOOP;
                        OUTALU <= tmp;


	when FUNCRR 	=>  
                    tmp := data1;
                        FOR i IN 0 to N-1 LOOP
                        if (i < unsigned(data2(logN-1 downto 0))) then
                            tmp := tmp(0) & tmp(N-1 downto 1);
						end if;
                    END LOOP;
                    OUTALU <= tmp;

	when others => null;
    end case; 
  end process P_ALU;

end BEHAVIOR;

configuration CFG_ALU_BEHAVIORAL of ALU is
  for BEHAVIOR
  end for;
end CFG_ALU_BEHAVIORAL;
