--------------------------------------------------------------------------------
-- Title       : DLX control unit 
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.a-control_unit.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Thu Jul 23 15:49:45 2020
-- Last update : Wed Aug 12 22:42:11 2020
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

entity control_unit is
  generic (
    PC_SIZE      : integer := 32;
    RF_REGS      : integer := 32; -- number of register in register file
    FUNC_SIZE    : integer := 11; -- Func Field Size for R-Type Ops
    OP_CODE_SIZE : integer := 6;  -- Op Code Size
    IR_SIZE      : integer := 32; -- Instruction Register Size    
    CW_SIZE      : integer := 13  -- Control Word Size
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
    rtype_itypen_i : out std_logic;
    compute_sext   : out std_logic;
    -- for execute stage
    alu_op_type : out std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
    sel_val_a   : out std_logic_vector(0 downto 0 );
    sel_val_b   : out std_logic_vector(0 downto 0 );
    -- from execute stage
    alu_cin         : out std_logic;
    alu_overflow    : in  std_logic;
    evaluate_branch : out std_logic;
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

  type state_t is (hang_error,idle,fetch, add);

  signal curr_state,next_state : state_t;

  signal rstn;
  signal cmd_word: std_logic_vector( CW_SIZE-1 downto 0); -- full control word 
  signal cw1,cw2,cw3,cw4,cw5: std_logic_vector(CW_SIZE-1 downto 0); -- signal for delay control signal of cmd_word unuseful ones will be discarded by the synthesis process


  signal ir_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0); -- OpCode part of IR
  signal ir_func   : std_logic_vector(FUNC_SIZE-1 downto 0);       -- Func part of IR when Rtype





  signal aluOpcode_i : aluOp := NOP; -- ALUOP defined in package
  signal aluOpcode1  : aluOp := NOP;
  signal aluOpcode2  : aluOp := NOP;
  signal aluOpcode3  : aluOp := NOP;



begin
  rstn<=not(rst);
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




  cl_next_state : process(curr_state , iram_ready_cu ,curr_instruction_to_cu,alu_overflow,dram_ready_cu)
  begin

  case (curr_state) is
    when idle => if (iram_ready_cu='1') then
                  next_state<=fetch;
                else
                  next_state<=curr_state;
                end if;
    when fetch => next_state<=decode;
    when decode=> case (ir_opcode) is
                  when <choice_1> =>
        
                  when others =>
                      null;
                  end case;

    when add => 
    when hang_error=> next_state<=curr_state;
    when others =>  next_state<=idle;
  end case;
  end process cl_next_state;

  cl_cmd_word:process(curr_state)
  begin
    ------------------------------------------------------------------------------
  -- default signals assignment
  cmd_word<=(OTHERS=>'0');
  ------------------------------------------------------------------------------
  case (curr_state) is
    when idle => cmd_word<=(OTHERS=>'0');
    when fetch=> cmd_word<=x"20000";
    when decode=> cmd_word<=
    when add=>
      
    when others =>
      null;
  end case;
  end process cl_cmd_word;


  -- alu function generator process
  -- purpose: Generation of ALU OpCode
  -- type   : combinational
  -- inputs : IR_i
  -- outputs: aluOpcode
  ALU_OP_CODE_P : process (IR_opcode, IR_func)
  begin -- process ALU_OP_CODE_P
    case conv_integer(unsigned(IR_opcode)) is
      -- case of R type requires analysis of FUNC
      when 0 =>
        case conv_integer(unsigned(IR_func)) is
          when 4 => aluOpcode_i <= LLS; -- sll according to instruction set coding
          when 6 => aluOpcode_i <= LRS; -- srl
                                        -- to be continued and filled with all the other instructions  
          when others => aluOpcode_i <= NOP;
        end case;
      when 2 => aluOpcode_i <= NOP;  -- j
      when 3 => aluOpcode_i <= NOP;  -- jal
      when 8 => aluOpcode_i <= ADDS; -- addi
                                     -- to be continued and filled with other cases
      when others => aluOpcode_i <= NOP;
    end case;
  end process ALU_OP_CODE_P;


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
    -- for memory stage
    dram_enable_cu <= cw4(CW_SIZE-11);
    dram_r_nw_cu   <= cw4(CW_SIZE-12);
    -- for write back stage   
    select_wb(0)<= cw5(CW_SIZE-13);
    write_rf <= cw5(CW_SIZE-14)

-- delay register for command word
    f_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cmd_word,
      Q     => cw1
    );

d_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cw1,
      Q     => cw2
    );

e_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cw2,
      Q     => cw3
    );

m_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
      clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cw3,
      Q     => cw4
    );

wb_reg : reg_nbit generic map (
      N => CW_SIZE
    )
    port map (
     clk   => clk,
      reset => rstn, -- reset is active high internally to the register
      d     => cw4,
      Q     => cw5
    );


end architecture behavioural;


