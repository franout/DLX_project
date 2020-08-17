--------------------------------------------------------------------------------
-- Title       : bootmultiplier pipeline
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c.c-boothmul_pipelined.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Fri Aug 14 15:51:09 2020
-- Last update : Mon Aug 17 13:14:35 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: Pipelined version of booth's (algorithm) multiplier from labs
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.constants.ALL;
use work.global_components.all;

-- top level entity of the booth multiplier
ENTITY boothmul_pipelined IS
    GENERIC(N    :    integer := 32);
    PORT(clk,rst : in std_logic;
        multiplier, multiplicand : IN  std_logic_vector(N-1 DOWNTO 0);
        result                   : OUT std_logic_vector(2*N-1 DOWNTO 0));
END ENTITY boothmul_pipelined;


ARCHITECTURE struc OF boothmul_pipelined IS

    COMPONENT encoder IS
        PORT (y : IN std_logic_vector(2 DOWNTO 0);
            sel : OUT std_logic_vector(2 DOWNTO 0));
    END COMPONENT encoder;

    COMPONENT mux_zbit_nbit IS
        Generic ( N : integer := NUMBIT;
            Z : integer := 3
        );
        Port ( inputs : In std_logic_vector(0 TO ((2**Z)*(N))-1 );
            SEL : In  std_logic_vector(Z-1 downto 0);
            Y   : Out std_logic_vector(N-1 downto 0));
    END COMPONENT mux_zbit_nbit;



    COMPONENT complement2 IS
        GENERIC ( N    :    integer := 8);
        PORT( value_in : IN std_logic_vector(N-1 DOWNTO 0);
            value_out : OUT std_logic_vector(N-1 DOWNTO 0));
    END COMPONENT complement2;

    COMPONENT adder IS
        GENERIC ( NBIT :    integer := 8 ); -- number of bits for the adder
        PORT( a,b      : IN std_logic_vector(NBIT -1 DOWNTO 0 );
            cin : IN  std_logic;
            s   : OUT std_logic_vector(NBIT DOWNTO 0));
    END COMPONENT adder;


    -- definition of constants and types 
    constant numMux : integer := (N)/2;
    type in_mux_comple_stages_t is array(0 TO numMux-1 ) OF std_logic_vector((2*N)-1 DOWNTO 0);
    type t_muxes_in is array(0 to numMux-1) of std_logic_vector(0 to (8*((2*N) - 1)));
    type t_encoder_out is array(0 to numMux-1) of std_logic_vector(2 downto 0);
    type t_mux_out is array(0 to numMux-1) of std_logic_vector((2*N)-1 downto 0);
    type t_sum_out is array(1 to numMux) of std_logic_vector((2*N)-1 downto 0);

    -- interconnection signals 
    signal in_mux_compleaA,in_mux_complea2A : in_mux_comple_stages_t             := (OTHERS => (OTHERS => '0'));
    signal muxes_in,muxes_in_pip                         : t_muxes_in                         := (OTHERS => (OTHERS => '0'));
    signal encoder_out                      : t_encoder_out                      := (OTHERS => (OTHERS => '0'));
    signal mux_out                          : t_mux_out                          := (OTHERS => ( OTHERS => '0'));
    signal sum_out,sum_out_pip, sum_B_in    : t_sum_out                          := (OTHERS => ( OTHERS => '0'));
    signal compl2_in_A, compl2_in_2A        : t_mux_out                          := (OTHERS => (OTHERS => '0'));
    signal mux0_sel_in                      : std_logic_vector(2 downto 0)       := "000";
    signal sig0                             : std_logic_vector((2*N)-1 downto 0) := (OTHERS => '0');

    -- for pipeline
    type multiplicand_pip_t is array(0 to numMux-1) of std_logic_vector(N-1 downto 0);
    signal multiplicand_pip : multiplicand_pip_t;


BEGIN


    sig0 <= (OTHERS => '0'); -- for preventign synthesis warning 

    stage_i : for i in 0 to numMux-1 generate
        stage_1 : if(i=0) generate -- generating first stage of the multiplier 
                                   -- generate mux inputs
            compl2_in_A(0)(N downto 0) <= multiplier(N-1) & multiplier;
                minusA : complement2 GENERIC MAP(N => N+1) PORT MAP( value_in => compl2_in_A(0)(N downto 0), value_out => in_mux_compleaA(i)(N downto 0) );
            muxes_in(0)(0 to (8*N)+7) <= sig0(N downto 0) & multiplier(N-1) & multiplier & (multiplier(N-1 downto 0) & "0") & sig0(N downto 0) & sig0(N downto 0) & sig0(N downto 0) & in_mux_compleaA(i)(N-1 downto 0) & '0' & in_mux_compleaA(i)(N downto 0);
            muxes_in_pip(0)<=muxes_in(0);
            -- generate encoder
            mux0_sel_in <= multiplicand_pip(0)(1 downto 0)&'0';
                ENC0 : encoder port map (y => mux0_sel_in, sel => encoder_out(0));
                -- generate mux
                MUX0 : mux_zbit_nbit generic map(N => N+1, Z => 3) port map (inputs => muxes_in(0)(0 to (8*N)+7), SEL => encoder_out(0), y => mux_out(i)(N downto 0));
        end generate stage_1;

        middle_stages : if(i/=0 ) generate

            -- generate encoder
                ENCi : encoder port map (y => multiplicand_pip(i)((i*2)+1 downto (i*2)-1), sel => encoder_out(i));
            -- generate mux inputs delayers
            no_delay_mux : if (i<2) generate
                muxes_in_pip(i)<=muxes_in(i); -- no delay for first two stages
            end generate no_delay_mux;
            reg_delay_mux_in : if (i>=2) generate
                pip_del_reg_muxi : reg_nbit generic map ( N => 8*((2*N)-1)+1 ) port map (clk => clk,reset => rst,d => muxes_in(i),Q => muxes_in_pip(i) );
            end generate reg_delay_mux_in;
            -- generate mux input
            muxes_in(i)(0 to 8*(N+1+(i*2)) - 1) <= sig0(N+(i*2) downto 0) & (muxes_in_pip(i-1)((N+1+((i-1)*2)) to (2*(N+1+((i-1)*2)))-1) & "00") & (muxes_in_pip(i-1)((2*(N+1+((i-1)*2))) to (3*(N+1+((i-1)*2)))-1) & "00") & sig0(N+(i*2) downto 0) & sig0(N+(i*2) downto 0) & sig0(N+(i*2) downto 0) & muxes_in_pip(i-1)(6*(N+1+((i-1)*2)) to 7*(N+1+((i-1)*2))-1) & "00" & muxes_in_pip(i-1)(7*(N+1+((i-1)*2)) to 8*(N+1+((i-1)*2))-1) & "00";
            
            -- generate mux
            MUXi : mux_zbit_nbit generic map(N => N+1+(i*2), Z => 3) port map (inputs => muxes_in(i)(0 to 8*(N+1+(i*2)) - 1), SEL => encoder_out(i), y => mux_out(i)(N+(2*i) downto 0));
            -- generate add 
            -- no pip register on input
            gen_add_1 : if (i = 1) generate
                sum_B_in(1)(N+2 downto 0) <= mux_out(0)(N) & mux_out(0)(N) & mux_out(0)(N downto 0);
                    ADD1             : adder generic map(NBIT   => (N+3) ) port map (A => mux_out(1)(N+2 downto 0), B => sum_B_in(1)(N+2 downto 0), Cin => '0', S => sum_out(1)(N+3 downto 0));
                    pip_del_reg_add1 : reg_nbit generic map ( N => 2*N ) port map (clk => clk,reset => rst,d => sum_out(i),Q => sum_out_pip(i) );
            end generate gen_add_1;
            gen_adds : if ( i /= 1) generate
                sum_B_in(i)(N+(2*i) downto 0) <= sum_out_pip(i-1)(N+(2*(i-1))) & sum_out_pip(i-1)(N+(2*(i-1))) & sum_out_pip(i-1)(N+(2*(i-1)) downto 0);
                addi_gen : if (i /= numMux-1) generate
                        -- pipelined regs from global_components package 
                        ADDi             : adder generic map(NBIT   => (N+1+(2*i))) port map ( A => mux_out(i)(N+(2*i) downto 0), B => sum_B_in(i)(N+(2*i) downto 0), Cin => '0', S => sum_out(i)(N+1+(2*i) downto 0));
                        pip_del_reg_addi : reg_nbit generic map ( N => 2*N ) port map (clk => clk,reset => rst,d => sum_out(i),Q => sum_out_pip(i) );

                end generate addi_gen;
                last_add : if (i = numMux-1) generate
                    -- consider carry out
                    -- pipelined regs from global_components package 
                    --pip_del_reg_i: reg_nbit generic map ( N =>   ) port map (clk  => clk,rst => rst,d  => ,Q => );
                    --no pip register on output
                    sum_B_in(i)(N+(2*i) downto 0) <= sum_out_pip(i-1)(N+(2*(i-1))) & sum_out_pip(i-1)(N+(2*(i-1))) & sum_out_pip(i-1)(N+(2*(i-1)) downto 0);
                        ADDn : adder generic map(NBIT => (N+1+(2*i))) port map ( A => mux_out(i)(N+(2*i) downto 0), B => sum_B_in(i)(N+(2*i) downto 0), Cin => '0', S => sum_out(i)(N+1+(2*i) downto 0));
                end generate last_add;
            end generate gen_adds;

        end generate middle_stages;
    end generate stage_i;

    ---------------------------------------------------------------------------- 
    -- delay registers for second operand for encoder ---------------------------
    ----------------------------------------------------------------------------
    multiplicand_delay_reg_p : for i in 0 to numMux-1 generate
        -- pipeline registers only from encoder #2 since the first two encoder are already driven by a (outside this enityt) register
        delay_reg_p_i : if (i > 1) generate
                pip_del_reg_i : reg_nbit generic map ( N => N ) port map (clk => clk,reset => rst,d => multiplicand_pip(i-1),Q => multiplicand_pip(i) );
        end generate delay_reg_p_i;
        no_delay : if (i <= 1) generate
            multiplicand_pip(i) <= multiplicand;
        end generate no_delay;
    end generate multiplicand_delay_reg_p;

    ----------------------------------------------------------------------------
    -- delay registers for first operand of adder ------------------------------    
    ----------------------------------------------------------------------------
    multipliers_delay_reg_p : for i in 0 to numMux-1 generate

        
    end generate multipliers_delay_reg_p;

    -- result from the final stage to the output of the entity 
    result <= sum_out(numMux-1);

END struc;






CONFIGURATION CFG_BOOTHMUL_pip_struc OF boothmul_pipelined IS
    for struc
    end for;
END CFG_BOOTHMUL_pip_struc;
