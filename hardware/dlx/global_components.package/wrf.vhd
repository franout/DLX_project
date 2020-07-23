library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.constants.all;
use WORK.all;

entity wrf is
 generic (  NBITREG:    natural := 64;
            M:          natural := 8; -- number of global registers
            -- F and N must be power of two
            N:          natural := 4; -- number of registers in each in/out/local section
            F:          natural := 8); -- number of windows
 port ( CLK: 		IN std_logic;
        RESET: 	IN std_logic;
        ENABLE: 	IN std_logic;
        RD1: 		IN std_logic;
        RD2: 		IN std_logic;
        WR: 		IN std_logic;
        ADD_WR: 	IN std_logic_vector(f_log2(2**f_log2(3*N) + M)-1 downto 0);  -- the most significant part of the address identifies the global registers from the local one 
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
        READY : OUT std_logic); -- signal for the CU that defines when no memory operaions are being performed 
end wrf;

architecture beh of wrf is


    subtype REG_ADDR is natural range 0 to (F*2*N) + M-1; -- using natural type
	type REG_ARRAY is array(REG_ADDR) of std_logic_vector(NBITREG-1 downto 0);
	signal REGISTERS : REG_ARRAY; -- physical registers

    signal CWP, SWP : std_logic_vector(f_log2(F*2*N)-1 downto 0) := (OTHERS => '0');
    signal cansave, canrestore : std_logic_vector(f_log2(F)-1 downto 0) := (OTHERS => '0'); -- counters

    constant MAX_WADD : natural := f_log2(3*N); -- # of bits used for addressing the local registers
    constant MAX_ADD : natural := f_log2(2**MAX_WADD + M); -- # of bits used for addressing all the registers
	constant FIRST_GLOBAL : natural := 2**MAX_WADD; -- first global register address

    signal zero_check_wadd : std_logic_vector(MAX_ADD-1 downto MAX_WADD) := (OTHERS => '0'); -- used to check when accessing to local registers or global ones 
    signal zero_check_cansaverestore : std_logic_vector(f_log2(F)-1 downto 0) := (OTHERS => '0'); -- used for checking when to spill/fill
    
    signal cnt_mem_ops : unsigned(f_log2(3*N)-1 downto 0) := (OTHERS => '0'); -- counter for the memory operations ( spill/fill one registers at each clock cycle)  
    
    signal mem_op : std_logic_vector(1 downto 0) := (OTHERS => '0'); -- last operation (see cnt_mem_ops)
	
begin

    zero_check_wadd <= (OTHERS => '0');
    zero_check_cansaverestore(f_log2(F)-1 downto 1) <= (OTHERS => '0');
    zero_check_cansaverestore(0) <= '1';
    
    process(clk)
        variable cwp_temp, cnt_mem_ops_ext : unsigned(f_log2(F*2*N)-1 downto 0);
    begin
        if(clk='1' and clk'event) then
            if(reset='0') then
                REGISTERS <= (OTHERS => (OTHERS => '0'));
                CWP <= (OTHERS => '0');
                SWP <= (OTHERS => '0');
                cansave <= (OTHERS => '1'); -- all 1s because F*2*N is a power of two
                canrestore <= (OTHERS => '0');
                canrestore(0) <= '1';
                cnt_mem_ops <= (OTHERS => '0');
                mem_op <= (OTHERS => '0');
            elsif(ENABLE = '1') then
				
				-- current window register operations
				if(RD1 = '1') then -- read operation on port one
                    if(ADD_RD1(MAX_ADD-1 downto MAX_WADD) = zero_check_wadd) then -- check if addressing local registers ( checking the most significant part of the address at zero) or global ones 
                        cwp_temp := unsigned(ADD_RD1(MAX_WADD-1 downto 0))+unsigned(CWP); -- computing the "Physical" address of the addressed register
                        OUT1 <= REGISTERS(to_integer(cwp_temp));
                    else
                        OUT1 <= REGISTERS(to_integer(unsigned(ADD_RD1))-FIRST_GLOBAL+(2*F*N)); -- computing the "physical" address of the first global  ( might be "hardwired" for smaller area design )
                    end if;
                end if;
                if(RD2 = '1') then --  read operation on port two (see port one) 
                    if(ADD_RD2(MAX_ADD-1 downto MAX_WADD) = zero_check_wadd) then
                        cwp_temp := unsigned(ADD_RD2(MAX_WADD-1 downto 0))+unsigned(CWP);
                        OUT2 <= REGISTERS(to_integer(cwp_temp));
                    else
                        OUT2 <= REGISTERS(to_integer(unsigned(ADD_RD2))-FIRST_GLOBAL+(2*F*N));
                    end if;
                end if;
                if(WR = '1') then -- write operation ( see port one )
                    if(ADD_WR(MAX_ADD-1 downto MAX_WADD) = zero_check_wadd) then
                        cwp_temp := unsigned(ADD_WR(MAX_WADD-1 downto 0))+unsigned(CWP);
                        REGISTERS(to_integer(cwp_temp)) <= DATAIN;
                    else
                        REGISTERS(to_integer(unsigned(ADD_WR))-FIRST_GLOBAL+(2*F*N)) <= DATAIN;
                    end if;
                end if;


				-- windows handling operation
		        cnt_mem_ops_ext := (OTHERS => '0'); 
		        cnt_mem_ops_ext(f_log2(3*N-1)-1 downto 0) := cnt_mem_ops;
		        if(SUB_CALL = '1' or mem_op = "01") then -- if there is a call to a subroutine or there is still a spill memory operation to conclude
		            READY <= '1';
		            if(cansave = zero_check_cansaverestore) then 
		                -- SPILL operation must be performed
		                cwp_temp := unsigned(CWP) + 4*N + cnt_mem_ops_ext; -- compute the address of the current register to spill 
		                mem_op <= "01"; -- save the spill operation 
		                if(cnt_mem_ops /= (3*N)) then -- last register to spill in memory (need to keep spill high for the last clockk cycles)
		                	DATA_MEM_OUT <= REGISTERS(to_integer(cwp_temp));
						end if;
		                SPILL <= '1';
		                cnt_mem_ops <= cnt_mem_ops + 1; -- increase already spilled register counter
		                if(cnt_mem_ops = (3*N)) then -- spill is finished 
		                    SPILL <= '0';
							-- update pointers 
		                    SWP <= std_logic_vector(unsigned(SWP) + 2*N);
			                CWP <= std_logic_vector(unsigned(CWP) + 2*N);
		                    cnt_mem_ops <= (OTHERS => '0');
		                    mem_op <= "00"; --no need to spill anymore 
		                else
		                    READY <= '0'; -- still spilling 
		                end if;
		            else 
						-- still some free windows avialable ( no need to spill ) 
		                cansave <= std_logic_vector(unsigned(cansave) - 1);
		                canrestore <= std_logic_vector(unsigned(canrestore) + 1);
		                CWP <= std_logic_vector(unsigned(CWP) + 2*N);
		            end if;
		        elsif(SUB_RET = '1' or mem_op = "10") then -- if there is a ret to a subroutine or there is still a fill memory operation to conclude
		        	-- see above changing spill with fill and call with ret  
					READY <= '1';
		            if(canrestore = zero_check_cansaverestore) then
		                -- FILL
		                cwp_temp := unsigned(CWP) - 2*N + cnt_mem_ops_ext;
		                mem_op <= "10";
		                FILL <= '1';
		                if(cnt_mem_ops /= (3*N)) then
			                REGISTERS(to_integer(cwp_temp)) <= DATA_MEM_IN;
  		                end if;
		                cnt_mem_ops <= cnt_mem_ops + 1;
		                if(cnt_mem_ops = (3*N)) then
		                    FILL <= '0';
		                    SWP <= std_logic_vector(unsigned(SWP) - 2*N);
			                CWP <= std_logic_vector(unsigned(CWP) - 2*N);
		                    cnt_mem_ops <= (OTHERS => '0');
		                    mem_op <= "00";
		                else
		                    READY <= '0';
		                end if;
		            else
		                cansave <= std_logic_vector(unsigned(cansave) + 1);
		                canrestore <= std_logic_vector(unsigned(canrestore) - 1);
		                CWP <= std_logic_vector(unsigned(CWP) - 2*N);
		            end if;
		        end if;
		    end if;
		end if;
    end process;

end beh;


configuration CFG_WRF_BEH of wrf is
  for beh
  end for;
end configuration;
