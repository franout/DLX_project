library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;


-- ripple carry adder 
entity RCA is 
    generic (NBIT  : 	Natural := 8);
    Port (	A:	In	std_logic_vector((NBIT-1) downto 0);
            B:	In	std_logic_vector((NBIT-1) downto 0);
            Ci:	In	std_logic;
            S:	Out	std_logic_vector((NBIT-1) downto 0);
            Co:	Out	std_logic);
end RCA; 

architecture STRUCTURAL of RCA is

    signal STMP : std_logic_vector((NBIT-1) downto 0); --- temporary sum 
    signal CTMP : std_logic_vector((NBIT) downto 0); -- temporary  carry 

component FA
    Port (  A:	In	std_logic;
            B:	In	std_logic;
            Ci:	In	std_logic;
            S:	Out	std_logic;
            Co:	Out	std_logic);
end component; 

begin

	  CTMP(0) <= Ci; -- the first bit of the temporary carry is the carry in 
      S <= STMP; -- assignment of the sum
	  Co <= CTMP(NBIT); -- the carry out is the last generated carry out of the last full adder
	        

		--- generation and interconnection of a generic number of full adder with an interconnencted chain of carry
		-- i.e the carry out  of the i-th block is the carry in of the i-th+1 block , the case of i=0 is described above
	  ADDER1: for I in 1 to NBIT generate
        FAI : FA Port Map (A(I-1), B(I-1), CTMP(I-1), STMP(I-1), CTMP(I));
      end generate;

end STRUCTURAL;


configuration CFG_RCA_STRUCTURAL of RCA is
      for STRUCTURAL 
              for ADDER1
                        for all : FA
                                use configuration WORK.CFG_FA_BEHAVIORAL;
                                  end for;
                                  end for;
                                    end for;
                            end CFG_RCA_STRUCTURAL;


