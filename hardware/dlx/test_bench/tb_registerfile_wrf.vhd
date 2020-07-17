library IEEE;

use IEEE.std_logic_1164.all;
use WORK.constants.ALL;

entity TBREGISTERFILE is
end TBREGISTERFILE;

architecture TESTA of TBREGISTERFILE is
	
       signal CLK: std_logic := '1';
       signal RESET: std_logic;
       signal ENABLE: std_logic;
       signal RD1: std_logic;
       signal RD2: std_logic;
       signal WR: std_logic;
       signal ADD_WR: std_logic_vector(3 downto 0);
       signal ADD_RD1: std_logic_vector(3 downto 0);
       signal ADD_RD2: std_logic_vector(3 downto 0);
       signal DATAIN: std_logic_vector(63 downto 0);
       signal OUT1: std_logic_vector(63 downto 0);
       signal OUT2: std_logic_vector(63 downto 0);
       signal SUB_CALL: std_logic;
       signal SUB_RET: std_logic;
       signal FILL: std_logic;
       signal SPILL: std_logic;
       signal DATA_MEM_IN: std_logic_vector(63 downto 0) := (OTHERS => '0');
       signal DATA_MEM_OUT: std_logic_vector(63 downto 0);
       signal READY : std_logic;

component wrf is
 generic (  NBITREG:    natural := 64;
            M:          natural := 8;
            -- F and N must be "esponenti di 2"
            N:          natural := 4;
            F:          natural := 8);
 port ( CLK: 		IN std_logic;
        RESET: 	IN std_logic;
        ENABLE: 	IN std_logic;
        RD1: 		IN std_logic;
        RD2: 		IN std_logic;
        WR: 		IN std_logic;
        ADD_WR: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1 downto 0); -- waste some address but better area size
        ADD_RD1: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1  downto 0);
        ADD_RD2: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1  downto 0);
        DATAIN: 	IN std_logic_vector(NBITREG-1 downto 0);
        OUT1: 		OUT std_logic_vector(NBITREG-1 downto 0);
        OUT2: 		OUT std_logic_vector(NBITREG-1 downto 0);
        SUB_CALL:   IN std_logic;
        SUB_RET:    IN std_logic;
        FILL:       OUT std_logic;
        SPILL:      OUT std_logic;
        DATA_MEM_IN:   IN std_logic_vector(NBITREG-1 downto 0);
        DATA_MEM_OUT: OUT std_logic_vector(NBITREG-1 downto 0);
        READY : OUT std_logic);
end  component wrf;

begin 

    RG:wrf GENERIC MAP(NBITREG=>64, M=>8 ,N=>2 ,F=>4 ) PORT MAP (CLK,RESET,ENABLE,RD1,RD2,WR,ADD_WR,ADD_RD1,ADD_RD2,DATAIN,OUT1,OUT2, SUB_CALL, SUB_RET, FILL, SPILL, DATA_MEM_IN, DATA_MEM_OUT, READY);



    PCLOCK : process(CLK)
	begin
		CLK <= not(CLK) after 0.5 ns;	
	end process;
	
	
	process
	begin
        RESET <= '0';
        ENABLE <= '1';
		wait for 1.7 ns;
		RESET <= '1';
        wait for 1 ns;
        ADD_WR <= (OTHERS => '0');
        -- writing in first window
        DATAIN <= "1000000000000000000000000000000000000000000000000000000000000000";
        WR <= '1';
        wait for 1 ns;
		-- writing global
        ADD_WR <= "1000";
        DATAIN <= "1111111111111111111111111111111111111111111111111111111111111111";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
		-- read 1 -> first register of current window
        ADD_RD1 <= (OTHERS => '0');
		-- read 2 -> first global register
        ADD_RD2 <= "1000";
		wait for 1 ns;
        RD1 <= '1';
        RD2 <= '1';
		wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- sub0 (no spill)
        SUB_CALL <= '1';
        wait for 1 ns;
        SUB_CALL <= '0';
		wait for 0.5 ns;
		-- wait for spill (not this case)
		if(not(READY = '1')) then
	        wait until READY = '1';
		end if;
        ADD_WR <= (OTHERS => '0');
        -- write in first register of current active window
        DATAIN <= "0000000000000000000000000000000000000000000000000000000000000000";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
        -- read first register of current active window and global
        RD1 <= '1';
        RD2 <= '1';
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- sub1 (no spill)
        SUB_CALL <= '1';
        wait for 1 ns;
        SUB_CALL <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
        ADD_WR <= (OTHERS => '0');
        DATAIN <= "0000000000000000000000000000000000000000000000000000000000000001";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
		RD1 <= '1';
		RD2 <= '1';
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- sub2 (first spill [OUT sub 2 overwrites IN initial window])
        SUB_CALL <= '1';
        wait for 1 ns;
        SUB_CALL <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
        ADD_WR <= (OTHERS => '0');
        DATAIN <= "0000000000000000000000000000000000000000000000000000000000000010";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
		RD1 <= '1';
		RD2 <= '1';
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- sub3 (spill)
        SUB_CALL <= '1';
        wait for 1 ns;
        SUB_CALL <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
        ADD_WR <= (OTHERS => '0');
        DATAIN <= "0000000000000000000000000000000000000000000000000000000000000011";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
		RD1 <= '1';
		RD2 <= '1';
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- sub4 (spill)
        SUB_CALL <= '1';
        wait for 1 ns;
        SUB_CALL <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
        ADD_WR <= (OTHERS => '0');
        DATAIN <= "0000000000000000000000000000000000000000000000000000000000000100";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
		RD1 <= '1';
		RD2 <= '1';
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- sub5 (spill)
        SUB_CALL <= '1';
        wait for 1 ns;
        SUB_CALL <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
        ADD_WR <= (OTHERS => '0');
        DATAIN <= "0000000000000000000000000000000000000000000000000000000000000101";
        WR <= '1';
        wait for 1 ns;
        WR <= '0';
		RD1 <= '1';
		RD2 <= '1';
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- ret5 (no fill)
        SUB_RET <= '1';
        wait for 1 ns;
        SUB_RET <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
		RD1 <= '1';
		RD2 <= '1';
		-- should read 4 (no fill)
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- ret4 (no fill)
        SUB_RET <= '1';
        wait for 1 ns;
        SUB_RET <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
		RD1 <= '1';
		RD2 <= '1';
		-- should read 3 (no fill)
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- ret3
        SUB_RET <= '1';
        wait for 1 ns;
        SUB_RET <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
		RD1 <= '1';
		RD2 <= '1';
		-- should read 0 (fill and DATA_MEM_IN all 0)
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- ret2
        SUB_RET <= '1';
        wait for 1 ns;
        SUB_RET <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
		RD1 <= '1';
		RD2 <= '1';
		-- should read 0 (fill and DATA_MEM_IN all 0)
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- ret1
        SUB_RET <= '1';
        wait for 1 ns;
        SUB_RET <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
		RD1 <= '1';
		RD2 <= '1';
		-- should read 0 (fill and DATA_MEM_IN all 0)
        wait for 1 ns;
		RD1 <= '0';
		RD2 <= '0';
        -- ret0
        SUB_RET <= '1';
        wait for 1 ns;
        SUB_RET <= '0';
		wait for 0.5 ns;
        if(not(READY = '1')) then wait until READY = '1'; end if;
        ENABLE <= '0';
        RD1 <= '0';
        RD2 <= '0';
        wait;
	end process;

end TESTA;


configuration CFG_TESTRF of TBREGISTERFILE is
  for TESTA
	for RG : wrf
		use configuration WORK.CFG_WRF_BEH;
	end for; 
  end for;
end CFG_TESTRF;
