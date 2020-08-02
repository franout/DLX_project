--------------------------------------------------------------------------------
-- Title       : DLX top
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a-DLX.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:58:15 2020
-- Last update : Sun Aug  2 16:30:55 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: top level entity of dlx without memories 
--------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

use work.globals.all;
use work.constants.all;


entity DLX is
  generic (
    IR_SIZE : integer := 32; -- Instruction Register Size
    PC_SIZE : integer := 32  -- Program Counter Size
  );
  port (
    -- Inputs
    CLK : in std_logic; -- Clock
    RST : in std_logic; -- Reset:Active-low
                        -- Instruction memory interface
    IRAM_ADDRESS : out std_logic_vector( iram_address_size- 1 downto 0);
    IRAM_ENABLE  : out std_logic;
    IRAM_READY   : in  std_logic;
    IRAM_DATA    : in  std_logic_vector(instruction_size-1 downto 0);
    -- Data memory Interface
    DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
    DRAM_ENABLE       : out   std_logic;
    DRAM_READNOTWRITE : out   std_logic;
    DRAM_READY        : in    std_logic;
    DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0)
    -- simulation debug signals
    --synthesis_translate off
    ;
    STATE_CU : out std_logic_vector(f_log2(tot_state)-1 downto 0)
  --synthesis_translate on
  );
end DLX;


architecture dlx_rtl of DLX is

  -- Control Unit
  component dlx_cu
    generic (
      MICROCODE_MEM_SIZE : integer := 10; -- Microcode Memory Size
      FUNC_SIZE          : integer := 11; -- Func Field Size for R-Type Ops
      OP_CODE_SIZE       : integer := 6;  -- Op Code Size
                                          --ALU_OPC_SIZE       :     integer := 6;  -- ALU Op Code Word Size
      IR_SIZE : integer := 32;            -- Instruction Register Size    
      CW_SIZE : integer := 15);           -- Control Word Size
    port (
      Clk : in std_logic; -- Clock
      Rst : in std_logic; -- Reset:Active-Low
                          -- Instruction Register
      IR_IN : in std_logic_vector(IR_SIZE - 1 downto 0);
      -- IF Control Signal
      IR_LATCH_EN  : out std_logic; -- Instruction Register Latch Enable
      NPC_LATCH_EN : out std_logic;
      -- ID Control Signals
      RegA_LATCH_EN   : out std_logic; -- Register A Latch Enable
      RegB_LATCH_EN   : out std_logic; -- Register B Latch Enable
      RegIMM_LATCH_EN : out std_logic; -- Immediate Register Latch Enable
                                       -- EX Control Signals
      MUXA_SEL      : out std_logic;   -- MUX-A Sel
      MUXB_SEL      : out std_logic;   -- MUX-B Sel
      ALU_OUTREG_EN : out std_logic;   -- ALU Output Register Enable
      EQ_COND       : out std_logic;   -- Branch if (not) Equal to Zero
                                       -- ALU Operation Code
      ALU_OPCODE : out aluOp;          -- choose between implicit or exlicit coding, like std_logic_vector(ALU_OPC_SIZE -1 downto 0);
                                       -- MEM Control Signals
      DRAM_WE      : out std_logic;    -- Data RAM Write Enable
      LMD_LATCH_EN : out std_logic;    -- LMD Register Latch Enable
      JUMP_EN      : out std_logic;    -- JUMP Enable Signal for PC input MUX
      PC_LATCH_EN  : out std_logic;    -- Program Counte Latch Enable
                                       -- WB Control signals
      WB_MUX_SEL : out std_logic;      -- Write Back MUX Sel
      RF_WE      : out std_logic);     -- Register File Write Enable
                                       -- TODO add state output 
  end component;



  -- Datapath 

  component DATAPATH is
    generic (
      N       : integer := 32;
      RF_REGS : integer := 32; -- number of registers in register file component
      IR_SIZE : integer := 32; -- Instruction register size
      PC_SIZE : integer := 32  -- Program Counter Size
    );
    port (
      clk : in std_logic;
      rst : in std_logic;
      -- iram interface
      IRAM_ADDRESS : out std_logic_vector( iram_address_size- 1 downto 0);
      IRAM_ENABLE  : out std_logic;
      IRAM_READY   : in  std_logic;
      IRAM_DATA    : in  std_logic_vector(IR_SIZE-1 downto 0);
      -- dram interface
      DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
      DRAM_ENABLE       : out   std_logic;
      DRAM_READNOTWRITE : out   std_logic;
      DRAM_READY        : in    std_logic;
      DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0);
      -- control unit interface, signals from/to control unit 
      -- for fetch stage
      iram_enable_cu         : in  std_logic;
      iram_ready_cu          : out std_logic;
      curr_instruction_to_cu : out std_logic_vector(PC_SIZE-1 downto 0);
      -- for decode stage
      enable_rf        : in std_logic;
      read_rf_p1       : in std_logic;
      read_rf_p2       : in std_logic;
      write_rf         : in std_logic;
      address_rf_write : in std_logic_vector(f_log2(RF_REGS)-1 downto 0);
      compute_sext     : in std_logic;
      -- for execute stage
      alu_op_type     : in std_logic_vector(2 downto 0); -- todo
      sel_val_a       : in std_logic_vector(0 downto 0 );
      sel_val_b       : in std_logic_vector(0 downto 0 );
      evaluate_branch : in std_logic;
      -- for memory stage
      dram_enable_cu : in  std_logic;
      dram_r_nw_cu   : in  std_logic;
      dram_ready_cu  : out std_logic;
      -- for write back stage   
      select_wb : in std_logic_vector(0 downto 0)

    );
  end component DATAPATH;


  ----------------------------------------------------------------
  -- Signals Declaration
  ----------------------------------------------------------------

  -- Instruction Register (IR) and Program Counter (PC) declaration
  signal IR : std_logic_vector(IR_SIZE - 1 downto 0);
  signal PC : std_logic_vector(PC_SIZE - 1 downto 0);

  -- Instruction Ram Bus signals
  signal IRam_DOut : std_logic_vector(IR_SIZE - 1 downto 0);

  -- Datapath Bus signals
  signal PC_BUS : std_logic_vector(PC_SIZE -1 downto 0);

  -- Control Unit Bus signals
  signal IR_LATCH_EN_i     : std_logic;
  signal NPC_LATCH_EN_i    : std_logic;
  signal RegA_LATCH_EN_i   : std_logic;
  signal RegB_LATCH_EN_i   : std_logic;
  signal RegIMM_LATCH_EN_i : std_logic;
  signal EQ_COND_i         : std_logic;
  signal JUMP_EN_i         : std_logic;
  signal ALU_OPCODE_i      : aluOp;
  signal MUXA_SEL_i        : std_logic;
  signal MUXB_SEL_i        : std_logic;
  signal ALU_OUTREG_EN_i   : std_logic;
  signal DRAM_WE_i         : std_logic;
  signal LMD_LATCH_EN_i    : std_logic;
  signal PC_LATCH_EN_i     : std_logic;
  signal WB_MUX_SEL_i      : std_logic;
  signal RF_WE_i           : std_logic;


  -- Data Ram Bus signals


begin -- DLX

  -- This is the input to program counter: currently zero 
  -- so no uptade of PC happens
  -- TO BE REMOVED AS SOON AS THE DATAPATH IS INSERTED!!!!!
  -- a proper connection must be made here if more than one
  -- instruction must be executed
  PC_BUS <= (others => '0');


  -- purpose: Instruction Register Process
  -- type   : sequential
  -- inputs : Clk, Rst, IRam_DOut, IR_LATCH_EN_i
  -- outputs: IR_IN_i
  IR_P : process (Clk, Rst)
  begin               -- process IR_P
    if Rst = '0' then -- asynchronous reset (active low)
      IR <= (others => '0');
    elsif Clk'event and Clk = '1' then -- rising clock edge
      if (IR_LATCH_EN_i = '1') then
        IR <= IRam_DOut;
      end if;
    end if;
  end process IR_P;

  -- COMPLETE WITH CACHE TO CONNECT IRAM and DRAM in the testbench...


  -- purpose: Program Counter Process
  -- type   : sequential
  -- inputs : Clk, Rst, PC_BUS
  -- outputs: IRam_Addr
  PC_P : process (Clk, Rst)
  begin               -- process PC_P
    if Rst = '0' then -- asynchronous reset (active low)
      PC <= (others => '0');
    elsif Clk'event and Clk = '1' then -- rising clock edge
      if (PC_LATCH_EN_i = '1') then
        PC <= PC_BUS;
      end if;
    end if;
  end process PC_P;

  -- Control Unit Instantiation
  CU_I : dlx_cu
    port map (
      Clk             => Clk,
      Rst             => Rst,
      IR_IN           => IR,
      IR_LATCH_EN     => IR_LATCH_EN_i,
      NPC_LATCH_EN    => NPC_LATCH_EN_i,
      RegA_LATCH_EN   => RegA_LATCH_EN_i,
      RegB_LATCH_EN   => RegB_LATCH_EN_i,
      RegIMM_LATCH_EN => RegIMM_LATCH_EN_i,
      MUXA_SEL        => MUXA_SEL_i,
      MUXB_SEL        => MUXB_SEL_i,
      ALU_OUTREG_EN   => ALU_OUTREG_EN_i,
      EQ_COND         => EQ_COND_i,
      ALU_OPCODE      => ALU_OPCODE_i,
      DRAM_WE         => DRAM_WE_i,
      LMD_LATCH_EN    => LMD_LATCH_EN_i,
      JUMP_EN         => JUMP_EN_i,
      PC_LATCH_EN     => PC_LATCH_EN_i,
      WB_MUX_SEL      => WB_MUX_SEL_i,
      RF_WE           => RF_WE_i);

    -- Datapath instantiation 
    datapath_i : DATAPATH generic map (
      N       : integer := 32;
      RF_REGS : integer := 32; -- number of registers in register file component
      IR_SIZE : integer := 32; -- Instruction register size
      PC_SIZE : integer := 32  -- Program Counter Size
      )
        port map (
          clk : in std_logic;
          rst : in std_logic;
          -- iram interface
          IRAM_ADDRESS : out std_logic_vector( iram_address_size- 1 downto 0);
          IRAM_ENABLE  : out std_logic;
          IRAM_READY   : in  std_logic;
          IRAM_DATA    : in  std_logic_vector(IR_SIZE-1 downto 0);
          -- dram interface
          DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
          DRAM_ENABLE       : out   std_logic;
          DRAM_READNOTWRITE : out   std_logic;
          DRAM_READY        : in    std_logic;
          DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0);
          -- control unit interface, signals from/to control unit 
          -- for fetch stage
          iram_enable_cu         : in  std_logic;
          iram_ready_cu          : out std_logic;
          curr_instruction_to_cu : out std_logic_vector(PC_SIZE-1 downto 0);
          -- for decode stage
          enable_rf        : in std_logic;
          read_rf_p1       : in std_logic;
          read_rf_p2       : in std_logic;
          write_rf         : in std_logic;
          address_rf_write : in std_logic_vector(f_log2(RF_REGS)-1 downto 0);
          compute_sext     : in std_logic;
          -- for execute stage
          alu_op_type     : in std_logic_vector(2 downto 0); -- todo
          sel_val_a       : in std_logic_vector(0 downto 0 );
          sel_val_b       : in std_logic_vector(0 downto 0 );
          evaluate_branch : in std_logic;
          -- for memory stage
          dram_enable_cu : in  std_logic;
          dram_r_nw_cu   : in  std_logic;
          dram_ready_cu  : out std_logic;
          -- for write back stage   
          select_wb : in std_logic_vector(0 downto 0)

        );




      end dlx_rtl;
