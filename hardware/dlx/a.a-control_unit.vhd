--------------------------------------------------------------------------------
-- Title       : DLX control unit 
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.a-control_unit.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Thu Jul 23 15:49:45 2020
-- Last update : Sun Aug 30 22:57:59 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: Control unit of DLX, design as an FSM
--------------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use work.globals.all;
use work.constants.all;
use work.global_components.all;

entity control_unit is
  generic (
    PC_SIZE : integer := 32;
    RF_REGS : integer := 32; -- number of register in register file
    IR_SIZE : integer := 32; -- Instruction Register Size    
    CW_SIZE : integer := 22  -- Control Word Size
  );
  port (
    clk : in std_logic;
    rst : in std_logic; -- active low
                        -- for fetch stage
    iram_enable_cu         : out std_logic;
    iram_ready_cu          : in  std_logic;
    curr_instruction_to_cu : in  std_logic_vector(IR_SIZE-1 downto 0);
    stall_pip              : out std_logic;
    -- for decode stage
    enable_rf  : out std_logic; -- used as enable for sign26 extention when equal to 0
    read_rf_p1 : out std_logic; -- if read_rf_p1/2 are both zero it is a jal instruction write address -> 31
    read_rf_p2 : out std_logic;

    rtype_itypen : out std_logic;
    compute_sext : out std_logic;
    jump_sext    : out std_logic;
    -- for execute stage
    alu_op_type      : out std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
    sel_val_a        : out std_logic_vector(0 downto 0 );
    sel_val_b        : out std_logic_vector(0 downto 0 );
    signed_notsigned : out std_logic;
    alu_cin          : out std_logic;
    evaluate_branch  : out std_logic_vector(1 downto 0); -- msb for evaluate branch negated(!=0) lsb for evaluate branch (==0)
                                                         -- from execute stage
    alu_overflow : in std_logic;
    -- exception control logic for multiplication 
    zero_mul_detect : in std_logic;
    mul_exeception  : in std_logic;
    -- for memory stage
    dram_enable_cu   : out std_logic;
    dram_r_nw_cu     : out std_logic;
    dram_ready_cu    : in  std_logic;
    update_pc_branch : out std_logic;
    -- for write back stage  
    write_rf  : out std_logic;
    select_wb : out std_logic_vector(0 downto 0)
    -- simulation debug signals
    --synopsys translate_off
    ;
    STATE_CU : out std_logic_vector(f_log2(tot_state)-1 downto 0);
    csr      : out std_logic_vector(7 downto 0)
    --synopsys translate_on

  );
end entity control_unit;


architecture behavioural of control_unit is

  type state_t is (hang_error,fetch, decode);

  signal curr_state,next_state : state_t;

  signal rstn                : std_logic;
  signal cmd_word            : std_logic_vector( CW_SIZE-1-4 downto 0); -- full control word 
  signal cmd_word_to_reg     : std_logic_vector(CW_SIZE-1 downto 0);
  signal cw1_i,cw2_i,cw3_i   : std_logic_vector(CW_SIZE-1 downto 0); -- signals for handling the proper input signal to the various pipeline stages during stall 
  signal cw1,cw2,cw3,cw4,cw5 : std_logic_vector(CW_SIZE-1 downto 0); -- signal for delay control signal of cmd_word unuseful ones will be discarded by the synthesis process
  signal cmd_alu_op_type     : std_logic_vector(3 downto 0);         --- signal to be delayed for the alu

  signal ir_opcode                        : std_logic_vector(OP_CODE_SIZE-1 downto 0); -- OpCode part of IR
  signal ir_func                          : std_logic_vector(OP_CODE_SIZE-1 downto 0); -- Func part of IR when Rtype
  signal force_write_back                 : std_logic;
  signal counter_mul,next_val_counter_mul : std_logic_vector(3 downto 0); -- 3 bit coutner for stall in mul instruction 
                                                                          -- a status register for possible overflow or write to forbidden registers
  signal csr_reg,next_value_csr : std_logic_vector(7 downto 0);
  signal stall ,next_stall      : std_logic := '0';
  -- constant signal assignement
  constant fetch_cmd : std_logic_vector(CW_SIZE-4-1 downto 0) := '1'&x"0000"&'0';
  constant ireg_cmd  : std_logic_vector(CW_SIZE-4-1 downto 0) := '1'&x"f013"&'0';
  constant imm_cmd   : std_logic_vector(CW_SIZE-4-1 downto 0) := '1'&x"c913"&'0';

begin


  -- simulation debug signals
  --synopsys translate_off
  STATE_CU <= std_logic_vector(to_unsigned(state_t'POS(curr_state),f_log2(tot_state) )); -- cast for being compliant with sv
  csr      <= csr_reg;
  --synopsys translate_on

  -- signal for stalling the ir 
  stall_pip <= stall;

  rstn <= not(rst); -- for command delayer register
  reg_state : process( clk,rst )
  begin
    if (rst='0') then-- active low
      curr_state  <= fetch;
      csr_reg     <= (OTHERS => '0');
      counter_mul <= (OTHERS => '0');
      stall       <= '0';
    elsif (rising_edge(clk)) then
      curr_state  <= next_state;
      csr_reg     <= next_value_csr;
      counter_mul <= next_val_counter_mul;
      stall       <= next_stall;
    end if;
  end process reg_state;


  cl : process(curr_state ,curr_instruction_to_cu,ir_opcode,ir_func,counter_mul,stall,csr_reg)
  begin
    ir_opcode <= curr_instruction_to_cu(IR_SIZE-1 downto IR_SIZE-OP_CODE_SIZE);
    ir_func   <= curr_instruction_to_cu(OP_CODE_SIZE - 1 downto 0) ;

    force_write_back <= '0';
    ------------------------------------------------------------------------------
    -- default signals assignment
    cmd_word <= (OTHERS => '0');
    --cmd_alu_op_type      <= (OTHERS => '0');
    next_value_csr (7 downto 3) <= (OTHERS => '0');
    if(stall='0') then
      next_val_counter_mul <= (OTHERS => '0');
    end if;
    ---------------------------------------------------------------------------------
    case (curr_state) is
      when fetch => next_state <= decode;
        cmd_word <= fetch_cmd;
      when decode =>

        next_state <= decode;
        case (ir_opcode) is
          when i_regtype =>
            cmd_word <= ireg_cmd;

            -- alu function generator
            case (ir_func) is -- upper bits are unused in this configuration
                              -- see encoding in execute stage
              when i_sub => cmd_alu_op_type <= x"1";
                cmd_word <= '1'&x"f093"&'0'; --set carry iN to one 
              when i_mul =>
                cmd_alu_op_type <= x"2";
                next_state      <= decode;
                -- stall of 8 cc and a check in case of zero counter goes to 6 since the other 2 cc are include in the pipeline
                if(unsigned(counter_mul)<10) then
                  cmd_word <= '0'&x"f010"&'0';                                               -- it can actually stay active for only the first cycle                     
                                                                                             -- check if there are some exception in the mul
                  if( (csr_reg(1)='1'or csr_reg(2)='1') and (unsigned(counter_mul)<2) ) then --
                                                                                             -- execptio or zero mul stop stall
                    next_val_counter_mul <= (OTHERS => '0');
                    next_stall           <= '0';
                  else -- otherwise do not fetch 

                    next_val_counter_mul <= std_logic_vector(unsigned(counter_mul)+"01");
                    if(unsigned(counter_mul)=9) then
                      cmd_word   <= '1'&x"0000"&'0'; -- start to fetch we need onyl to write back the result in the rf
                      next_stall <= '0';
                    elsif(stall='0') then
                      next_stall <= '1';
                    end if;

                  end if;
                else
                  next_val_counter_mul <= std_logic_vector(unsigned(counter_mul)+"01");
                  cmd_word             <= '1'&x"0000"&'0';
                  force_write_back     <= '1';
                end if;
              when i_and => cmd_alu_op_type <= x"3";
              when i_or  => cmd_alu_op_type <= x"4";
              when i_xor => cmd_alu_op_type <= x"5";
              when i_sll => cmd_alu_op_type <= x"6";
              when i_srl => cmd_alu_op_type <= x"7";
              when i_sge => cmd_alu_op_type <= x"8"; -- >=
              when i_sle => cmd_alu_op_type <= x"9"; -- <=
              when i_sne => cmd_alu_op_type <= x"a";
              -- addition i_add
              when others =>
                cmd_alu_op_type <= (OTHERS => '0');
            end case;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(15 downto 11))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_beqz =>
            cmd_alu_op_type <= x"0";            -- addition of pc +4 + immediate16
            cmd_word        <= '1'&x"cb30"&'1'; --==0
          when i_benz =>
            cmd_alu_op_type <= x"0";            -- addition of pc +4 + immediate16
            cmd_word        <= '1'&x"cb50"&'1'; --!=0
          when i_j =>
            cmd_alu_op_type <= x"0"; -- addition of pc +4 + immediate26
            cmd_word        <= '1'&x"0f30"&'1';
          when i_jal =>
            -- R31 <-- PC + 4; PC <-- PC + imm26 + 4
            cmd_alu_op_type <= x"0"; -- addition of pc + immediate26+4
            cmd_word        <= '1'&x"0f33"&'1';
          when i_lw =>
            cmd_alu_op_type <= x"0"; -- addition of rs1 + imeediate16
            cmd_word        <= '1'&x"c91d"&'0';
          when i_sw =>
            cmd_alu_op_type <= x"0";
            cmd_word        <= '1'&x"e918"&'0'; -- write to memory
          when i_nop =>
            cmd_word <= '1'&x"0000"&'0';
          when i_addi =>
            cmd_alu_op_type <= (OTHERS => '0');
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_andi =>
            cmd_alu_op_type <= x"3";
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_ori =>
            cmd_alu_op_type <= x"4";
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_sgei =>
            cmd_alu_op_type <= x"8"; -- >=
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_slei =>
            cmd_alu_op_type <= x"9"; -- <=
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_snei =>
            cmd_alu_op_type <= x"a"; -- !=
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_slli =>
            cmd_alu_op_type <= x"6";
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_srli =>
            cmd_alu_op_type <= x"7";
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_subi =>
            cmd_alu_op_type <= x"1";
            cmd_word        <= '1' &x"c993"&'0'; -- set carry in to 1
                                                 -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when i_xori =>
            cmd_alu_op_type <= x"5";
            cmd_word        <= imm_cmd;
            -- check if r0 is a dest address 
            if(unsigned(curr_instruction_to_cu(20 downto 16))=0) then
              next_state                 <= hang_error;
              next_value_csr(7 downto 3) <= (OTHERS => '1');
            end if;
          when others =>
            next_state <= decode;
            -- do a nop
            if(stall='0')then
              cmd_word <= '1'&x"0000"&'0';
            else
              cmd_word <= (OTHERS => '0');
            end if;
        end case;
      when hang_error => next_state <= curr_state;
      when others     => cmd_word   <= (OTHERS => '0');
        next_state <= fetch;
    end case;
  end process cl;





  --   check logic for multiplication
  mul_exception : process (cw4(3 downto 0), zero_mul_detect,mul_exeception,stall)
  begin
    if(cw4=x"2" and stall='1') then -- only in the multiplication 
      next_value_csr(2 downto 1) <= zero_mul_detect & mul_exeception;
    else
      next_value_csr(2 downto 1) <= "00";
    end if;
  end process mul_exception;
  --update overflow
  next_value_csr(0) <= alu_overflow;


  cmd_word_to_reg <= cmd_word & cmd_alu_op_type;

  --------------------------------------------------------------------------------
  -- command word distribution signals 
  -- for fetch stage
  iram_enable_cu <= cmd_word_to_reg(CW_SIZE -1) when stall='0' else '0'; -- do not fetch instruction in stall
                                                                         -- for decode stage
  enable_rf    <= cmd_word_to_reg(CW_SIZE-2) ;
  read_rf_p1   <= cmd_word_to_reg(CW_SIZE-3);
  read_rf_p2   <= cmd_word_to_reg(CW_SIZE-4);
  rtype_itypen <= cmd_word_to_reg(CW_SIZE-5);
  compute_sext <= cmd_word_to_reg(CW_SIZE-6);
  jump_sext    <= cmd_word_to_reg(CW_SIZE-7);
  -- for execute stage
  sel_val_a (0)      <= cw1 (CW_SIZE-8) when stall='0' else cmd_word_to_reg(CW_SIZE-8);
  sel_val_b (0)      <= cw1 (CW_SIZE-9) when stall='0' else cmd_word_to_reg(CW_SIZE-9);
  alu_cin            <= cw1(CW_SIZE-10) when stall='0' else cmd_word_to_reg(CW_SIZE-10);
  evaluate_branch(1) <= cw1(CW_SIZE-11) when stall='0' else cmd_word_to_reg(CW_SIZE-11); --!=0
  evaluate_branch(0) <= cw1(CW_SIZE-12) when stall='0' else cmd_word_to_reg(CW_SIZE-12); -- ==0
  signed_notsigned   <= cw1(CW_SIZE-13) when stall='0' else cmd_word_to_reg(CW_SIZE-13);
  alu_op_type        <= cw1(3 downto 0) when stall='0' else cmd_word_to_reg(3 downto 0); -- it is better to cancatenate it at the end
                                                                                         -- for memory stage
  dram_enable_cu   <= cw2(CW_SIZE-14) when stall='0' else cmd_word_to_reg(CW_SIZE-14);
  dram_r_nw_cu     <= cw2(CW_SIZE-15) when stall='0' else cmd_word_to_reg(CW_SIZE-15);
  update_pc_branch <= cw2(CW_SIZE -18)when stall='0' else cmd_word_to_reg(CW_SIZE-18);
  -- for write back stage   
  select_wb(0) <= cw3(CW_SIZE-16) or force_write_back; -- it comes from a stall in the alu
  write_rf     <= cw3(CW_SIZE-17) or force_write_back;

    -- delay register for command word
    e_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cmd_word_to_reg,
      Q     => cw1
    );

  -- for handling the stall 
  cw1_i <= cw1 when stall='0' else cw2;

    m_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cw1_i,
      Q     => cw2
    );

  cw2_i <= cw2 when stall='0' else cw3;


    wb_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cw2_i,
      Q     => cw3
    );

  cw3_i <= cw3 when stall='0' else cw4;

  --    m_reg : reg_nbit generic map (
  --      N => CW_SIZE
  --    )
  --    port map (
  --      clk   => clk,
  --      reset => rstn, -- reset is active high internally to the register
  --      d     => cw3,
  --      Q     => cw4
  --    );

  --    wb_reg : reg_nbit generic map (
  --      N => CW_SIZE
  --  )
  -- port map (
  --      clk   => clk,
  --     reset => rstn, -- reset is active high internally to the register
  ---      d     => cw4,
  --      Q     => cw5
  --    );


end architecture behavioural;


