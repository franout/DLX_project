--------------------------------------------------------------------------------
-- Title       : DLX control unit 
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.a-control_unit.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Thu Jul 23 15:49:45 2020
-- Last update : Wed Aug 19 23:43:15 2020
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
    PC_SIZE      : integer := 32;
    RF_REGS      : integer := 32; -- number of register in register file
    FUNC_SIZE    : integer := 11; -- Func Field Size for R-Type Ops
    OP_CODE_SIZE : integer := 6;  -- Op Code Size
    IR_SIZE      : integer := 32; -- Instruction Register Size    
    CW_SIZE      : integer := 19  -- Control Word Size
  );
  port (
    clk : in std_logic;
    rst : in std_logic; -- active low
    -- for fetch stage
    iram_enable_cu         : out std_logic;
    iram_ready_cu          : in  std_logic;
    curr_instruction_to_cu : in  std_logic_vector(IR_SIZE-1 downto 0);
    -- for decode stage
    enable_rf      : out std_logic;
    read_rf_p1     : out std_logic;
    read_rf_p2     : out std_logic;
    write_rf       : out std_logic;
    rtype_itypen : out std_logic;
    compute_sext   : out std_logic;
    -- for execute stage
    alu_op_type : out std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
    sel_val_a   : out std_logic_vector(0 downto 0 );
    sel_val_b   : out std_logic_vector(0 downto 0 );
    signed_notsigned: out std_logic;
    alu_cin         : out std_logic;
    evaluate_branch : out std_logic;
    -- from execute stage
    alu_overflow    : in  std_logic;
    -- exception control logic for multiplication 
    zero_mul_detect  : in std_logic;
    mul_exeception   : in std_logic;
    -- for memory stage
    dram_enable_cu : out std_logic;
    dram_r_nw_cu   : out std_logic;
    dram_ready_cu  : in  std_logic;
    -- for write back stage   
    select_wb : out std_logic_vector(0 downto 0)
    -- simulation debug signals
    --synthesis_translate off
    ;
    STATE_CU : out std_logic_vector(f_log2(tot_state)-1 downto 0)
    --synthesis_translate on

  );
end entity control_unit;


architecture behavioural of control_unit is

  type state_t is (hang_error,idle,fetch, decode);

  signal curr_state,next_state : state_t;

  signal rstn: std_logic;
  signal cmd_word: std_logic_vector( CW_SIZE-1-4 downto 0); -- full control word 
  signal cmd_word_to_reg: std_logic_vector(CW_SIZE-1 downto 0);
  signal cw1,cw2,cw3,cw4,cw5: std_logic_vector(CW_SIZE-1 downto 0); -- signal for delay control signal of cmd_word unuseful ones will be discarded by the synthesis process


  signal ir_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0); -- OpCode part of IR
  signal ir_func   : std_logic_vector(FUNC_SIZE-1 downto 0);       -- Func part of IR when Rtype

  signal enable_alu_generation_function: std_logic;

  -- add a status register for possible overflow or write to forbidden registers




begin
  ir_opcode <= curr_instruction_to_cu(IR_SIZE-1 downto IR_SIZE-1-OP_CODE_SIZE);
  ir_func <= curr_instruction_to_cu(FUNC_SIZE - 1 downto 0);

    -- simulation debug signals
    --synthesis_translate off
    STATE_CU<= curr_state;
    --synthesis_translate on


  reg_state : process( clk,rst )
  begin
    if (rst='0') then-- active low
      curr_state <= idle;
    elsif (rising_edge(clk)) then
      curr_state <= next_state;
    end if;
  end process reg_state;




  cl : process(curr_state , iram_ready_cu ,curr_instruction_to_cu,dram_ready_cu,ir_opcode)
  begin
      ------------------------------------------------------------------------------
  -- default signals assignment
  cmd_word<=(OTHERS=>'0');
  enable_alu_generation_function<='0';
  ---------------------------------------------------------------------------------
  case (curr_state) is
    when idle => if (iram_ready_cu='1') then
                  next_state<=fetch;
                else
                  next_state<=curr_state;
                end if;
    when fetch => next_state<=decode;
                  cmd_word<=x"4000";
    when decode=>   
                  if(iram_ready_cu='1') then 
                    next_state<=decode;
                    case (ir_opcode) is
                    when i_add =>
                        cmd_word<=x"7c13"; 
                        --  control for not writing to r0 
                        if(curr_instruction_to_cu(15 downto 11)=(OTHERS=>'0')  )then -- check destination error
                         --rtype_itypen ='1' 
                          next_state<=hang_error;
                        end if;
                        enable_alu_generation_function<='1';
                    when i_addi=> 
                        enable_alu_generation_function<='1';
                         cmd_word<=x"7693";
                         if(curr_instruction_to_cu(20 downto 16)=(OTHERS=>'0') )then -- check destination error
                         --rtype_itypen ='0' 
                          next_state<=hang_error;
                        end if;
                    when i_and =>
                    when i_andi=>
                    when i_beqz=>
                    when i_benz=>
                    when i_j=>
                    when i_jal=>
                    when i_lw=>
                    when i_nop=>
                         cmd_word<=x"4000";  
                    when i_or=>
                    when i_ori=>
                    when i_sgl=>
                    when i_sgei=>
                    when i_sle=>
                    when i_slei=>
                    when i_sll=>
                    when i_slli=>
                    when i_sne=>
                    when i_snei=>
                    when i_srl=>
                    when i_srli=>
                    when i_sub=>
                    when i_subi=>
                    when i_sw=>
                    when i_xor=>
                    when i_xori=>
                    when i_imul=>
                    when others =>
                        -- unrecognized instruction 
                        next_state<=hang_error;
                        cmd_word<=(OTHERS=>'0');
                    end case;
                    
                  else -- iram not ready
                  next_state<=hang_error;
                  end if;
    when hang_error=> next_state<=curr_state;
    when others => cmd_word<=(OTHERS=>'0');
                 next_state<=idle;
  end case;
  end process cl;


  -- alu function generator process
  ALU_OP_CODE_P : process (enable_alu_generation_function, ir_func,ir_opcode)
  begin -- process ALU_OP_CODE_P
    if(enable_alu_generation_function='1')then
      -- for matching encoding in the execute stage
      case (ir_func) is
        when x"00a"=> -- sub 
                cmd_alu_op_type<=x"1";
        when x"012"=> -- mult
                cmd_alu_op_type<=x"2";
        when x"004" => -- and
                cmd_alu_op_type<=x"3";
        when x"009"=> -- or
                cmd_alu_op_type<=x"4";
        when x"00f"=> -- xor
              cmd_alu_op_type<=x"5";
        when x"002"=> -- shift left
              cmd_alu_op_type<=x"6";
        when x""=> -- shift right
              cmd_alu_op_type<=x"7";
              -- addition 
        when others =>
          cmd_alu_op_type<=(OTHERS=>'0');
      end case;
    else
      cmd_alu_op_type<=(OTHERS=>'0');
    end if;
  end process ALU_OP_CODE_P;

--   check logic
  alu_overflow    : in  std_logic;
    -- exception control logic for multiplication 
    zero_mul_detect  : in std_logic;
    mul_exeception   : in std_logic;


cmd_word_to_reg<=cmd_word & cmd_alu_op_type;

--------------------------------------------------------------------------------
-- command word distribution signals 
    -- for fetch stage
    iram_enable_cu <= cw1(CW_SIZE -1);
    -- for decode stage
    enable_rf      <= cw2(CW_SIZE-2);
    read_rf_p1     <= cw2(CW_SIZE-3);
    read_rf_p2     <= cw2(CW_SIZE-4);
    rtype_itypen_i <= cw2(CW_SIZE-5);
    compute_sext   <= cw2(CW_SIZE-6);
    -- for execute stage
    sel_val_a  (0) <= cw3 (CW_SIZE-7);
    sel_val_b  (0) <= cw3 (CW_SIZE-8);
    alu_cin         <= cw3(CW_SIZE-9);
    evaluate_branch <= cw3(CW_SIZE-10);
    signed_notsigned<=cw3(CW_SIZE-11);
    alu_op_type<=cw3(3 downto 0); -- it is better to cancatenate it at the end
    -- for memory stage
    dram_enable_cu <= cw4(CW_SIZE-12);
    dram_r_nw_cu   <= cw4(CW_SIZE-13);
    -- for write back stage   
    select_wb(0)<= cw5(CW_SIZE-14);
    write_rf <= cw5(CW_SIZE-15);

-- delay register for command word
    f_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rst, -- reset is active high internally to the register
      d     => cmd_word_to_reg,
      Q     => cw1
    );

d_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rst, -- reset is active high internally to the register
      d     => cw1,
      Q     => cw2
    );

e_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rst, -- reset is active high internally to the register
      d     => cw2,
      Q     => cw3
    );

m_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rst, -- reset is active high internally to the register
      d     => cw3,
      Q     => cw4
    );

wb_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
     clk   => clk,
      reset => rst, -- reset is active high internally to the register
      d     => cw4,
      Q     => cw5
    );


end architecture behavioural;


