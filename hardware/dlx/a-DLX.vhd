--------------------------------------------------------------------------------
-- Title       : DLX top
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a-DLX.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 22:58:15 2020
-- Last update : Fri Aug 21 19:51:31 2020
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
    IRAM_DATA    : in  std_logic_vector(instr_length-1 downto 0);
    -- Data memory Interface
    DRAM_ADDRESS      : out   std_logic_vector(dram_address_size-1 downto 0);
    DRAM_ENABLE       : out   std_logic;
    DRAM_READNOTWRITE : out   std_logic;
    DRAM_READY        : in    std_logic;
    DRAM_DATA         : inout std_logic_vector(data_size-1 downto 0);
    ----------------------------------------------------------------------------
    -- cpu status signals in case of exception or hang --------------------------
    ----------------------------------------------------------------------------
    cpu_status : out std_logic_vector(1 downto 0)
    -- simulation debug signals and verification purposes
    --synthesis_translate off
    ;
    STATE_CU : out std_logic_vector(f_log2(tot_state)-1 downto 0);
    csr      : out std_logic_vector(7 downto 0);
    -- all the control unit signals
    -- used for system verilog verification 
    DEBUG_iram_ready_cu    : out std_logic;
    DEBUG_iram_enable_cu   : out std_logic;
    DEBUG_signed_notsigned : out std_logic;
    DEBUG_compute_sext     : out std_logic;
    DEBUG_write_rf         : out std_logic;
    DEBUG_evaluate_branch  : out std_logic_vector(1 downto 0);
    DEBUG_alu_cin          : out std_logic;
    DEBUG_alu_overflow     : out std_logic;
    DEBUG_zero_mul_detect  : out std_logic;
    DEBUG_mul_exeception   : out std_logic;
    DEBUG_dram_ready_cu    : out std_logic;
    DEBUG_dram_r_nw_cu     : out std_logic;
    DEBUG_rstn             : out std_logic;
    DEBUG_enable_rf        : out std_logic;
    DEBUG_read_rf_p1       : out std_logic;
    DEBUG_read_rf_p2       : out std_logic;
    DEBUG_rtype_itypen     : out std_logic;
    DEBUG_dram_enable_cu   : out std_logic
  --synthesis_translate on
  );
end DLX;


architecture dlx_rtl of DLX is

  -- control unit
  component control_unit is
    generic (
      PC_SIZE      : integer := 32;
      RF_REGS      : integer := 32; -- number of register in register file
      IR_SIZE      : integer := 32; -- Instruction Register Size    
      CW_SIZE      : integer := 15  -- Control Word Size
    );
    port (
      clk : in std_logic;
      rst : in std_logic; -- active low
                          -- for fetch stage
      iram_enable_cu         : out std_logic;
      iram_ready_cu          : in  std_logic;
      curr_instruction_to_cu : in  std_logic_vector(IR_SIZE-1 downto 0);
      -- for decode stage
      enable_rf  : out std_logic; -- used as enable for sign26 extention when equal to 0
      read_rf_p1 : out std_logic; -- if read_rf_p1/2 are both zero it is a jal instruction write address -> 31
      read_rf_p2 : out std_logic;

      rtype_itypen : out std_logic;
      compute_sext : out std_logic;
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
      dram_enable_cu : out std_logic;
      dram_r_nw_cu   : out std_logic;
      dram_ready_cu  : in  std_logic;
      -- for write back stage  
      write_rf  : out std_logic;
      select_wb : out std_logic_vector(0 downto 0)
      -- simulation debug signals
      --synthesis_translate off
      ;
      STATE_CU : out std_logic_vector(f_log2(tot_state)-1 downto 0);
      csr      : out std_logic_vector(7 downto 0)
    --synthesis_translate on
    );
  end component control_unit;

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
      enable_rf    : in std_logic;
      read_rf_p1   : in std_logic;
      read_rf_p2   : in std_logic;
      write_rf     : in std_logic;
      rtype_itypen : in std_logic; -- =='1' rtype instrucion =='0' itype instructnions
      compute_sext : in std_logic;
      -- for execute stage
      alu_op_type      : in std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
      sel_val_a        : in std_logic_vector(0 downto 0 );
      sel_val_b        : in std_logic_vector(0 downto 0 );
      alu_cin          : in std_logic;
      signed_notsigned : in std_logic;
      evaluate_branch  : in std_logic_vector(1 downto 0);
      -- from execute stage
      alu_overflow : out std_logic;
      -- exception control logic for multiplication 
      zero_mul_detect : out std_logic;
      mul_exeception  : out std_logic;
      -- for memory stage
      dram_enable_cu : in  std_logic;
      dram_r_nw_cu   : in  std_logic;
      dram_ready_cu  : out std_logic;
      -- for write back stage   
      select_wb : in std_logic_vector(0 downto 0)

    );
  end component DATAPATH;


  ----------------------------------------------------------------
  -- Internconnection Signals Declaration
  ----------------------------------------------------------------
  signal iram_ready_cu_i,iram_enable_cu_i,signed_notsigned_i,
  compute_sext_i,write_rf_i,alu_cin_i,
  alu_overflow_i,zero_mul_detect_i,mul_exeception_i,
  dram_ready_cu_i,dram_r_nw_cu_i,rstn,enable_rf_i,read_rf_p1_i,read_rf_p2_i,rtype_itypen_i,
  dram_enable_cu_i                            : std_logic;
  signal evaluate_branch_i                    : std_logic_vector(1 downto 0);
  signal curr_instruction_to_cu_i             : std_logic_vector(PC_SIZE-1 downto 0);
  signal sel_val_a_i,sel_val_b_i ,select_wb_i : std_logic_vector(0 downto 0);
  signal alu_op_type_i                        : std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv




begin -- DLX

  rstn <= not(rst);
  -- Control Unit Instantiation
  cu_i : control_unit
    generic map (
      PC_SIZE      => PC_SIZE,
      RF_REGS      => register_in_rf,
      IR_SIZE      => instr_length,
      CW_SIZE      => tot_cu_sign
    )
    port map (
      clk                    => clk,
      rst                    => rstn,
      iram_enable_cu         => iram_enable_cu_i,
      iram_ready_cu          => iram_ready_cu_i,
      curr_instruction_to_cu => curr_instruction_to_cu_i,
      -- for decode stage
      enable_rf    => enable_rf_i,
      read_rf_p1   => read_rf_p1_i,
      read_rf_p2   => read_rf_p2_i,
      write_rf     => write_rf_i,
      rtype_itypen => rtype_itypen_i,
      compute_sext => compute_sext_i,
      -- for execute stage
      alu_op_type      => alu_op_type_i ,
      sel_val_a        => sel_val_a_i ,
      sel_val_b        => sel_val_b_i ,
      evaluate_branch  => evaluate_branch_i,
      signed_notsigned => signed_notsigned_i,
      -- from execute stage
      alu_cin      => alu_cin_i,
      alu_overflow => alu_overflow_i,
      zero_mul_detect  =>  zero_mul_detect_i,
      mul_exeception    =>  mul_exeception_i,
      -- for memory stage
      dram_enable_cu => dram_enable_cu_i,
      dram_r_nw_cu   => dram_r_nw_cu_i,
      dram_ready_cu  => dram_ready_cu_i,
      -- for write back stage   
      select_wb  => select_wb_i
      -- simulation debug signals
      --synthesis_translate off
      ,
      STATE_CU => STATE_CU,
      csr      => csr
      --synthesis_translate on

    );

    -- Datapath instantiation 
    datapath_i : DATAPATH generic map (
      N       => data_size,
      RF_REGS => register_in_rf, -- number of registers in register file component
      IR_SIZE => IR_SIZE,        -- Instruction register size
      PC_SIZE => PC_SIZE         -- Program Counter Size
    )
    port map (
      clk => clk,
      rst => rst,
      -- iram interface
      IRAM_ADDRESS => IRAM_ADDRESS,
      IRAM_ENABLE  => IRAM_ENABLE ,
      IRAM_READY   => IRAM_READY ,
      IRAM_DATA    => IRAM_DATA ,
      -- dram interface
      DRAM_ADDRESS      => DRAM_ADDRESS ,
      DRAM_ENABLE       => DRAM_ENABLE ,
      DRAM_READNOTWRITE => DRAM_READNOTWRITE ,
      DRAM_READY        => DRAM_READY ,
      DRAM_DATA         => DRAM_DATA ,
      -- control unit interface, signals from/to control unit 
      -- for fetch stage
      iram_enable_cu         => iram_enable_cu_i,
      iram_ready_cu          => iram_ready_cu_i,
      curr_instruction_to_cu => curr_instruction_to_cu_i,
      -- for decode stage
      enable_rf    => enable_rf_i,
      read_rf_p1   => read_rf_p1_i,
      read_rf_p2   => read_rf_p2_i,
      write_rf     => write_rf_i,
      rtype_itypen => rtype_itypen_i,
      compute_sext => compute_sext_i,
      -- for execute stage
      alu_op_type      => alu_op_type_i ,
      sel_val_a        => sel_val_a_i ,
      sel_val_b        => sel_val_b_i ,
      evaluate_branch  => evaluate_branch_i,
      signed_notsigned => signed_notsigned_i,
      -- from execute stage
      alu_cin         => alu_cin_i,
      alu_overflow    => alu_overflow_i,
      zero_mul_detect => zero_mul_detect_i,
      mul_exeception  => mul_exeception_i,
      -- for memory stage
      dram_enable_cu => dram_enable_cu_i,
      dram_r_nw_cu   => dram_r_nw_cu_i,
      dram_ready_cu  => dram_ready_cu_i,
      -- for write back stage   
      select_wb => select_wb_i
    );

  --synthesis_translate off
  DEBUG_iram_ready_cu    <= iram_ready_cu_i;
  DEBUG_iram_enable_cu   <= iram_enable_cu_i;
  DEBUG_signed_notsigned <= signed_notsigned_i;
  DEBUG_compute_sext     <= compute_sext_i;
  DEBUG_write_rf         <= write_rf_i;
  DEBUG_evaluate_branch  <= evaluate_branch_i;
  DEBUG_alu_cin          <= alu_cin_i;
  DEBUG_alu_overflow     <= alu_overflow_i;
  DEBUG_zero_mul_detect  <= zero_mul_detect_i;
  DEBUG_mul_exeception   <= mul_exeception_i;
  DEBUG_dram_ready_cu    <= dram_ready_cu_i;
  DEBUG_dram_r_nw_cu     <= dram_r_nw_cu_i;
  DEBUG_rstn             <= rstn;
  DEBUG_enable_rf        <= enable_rf_i;
  DEBUG_read_rf_p1       <= read_rf_p1_i;
  DEBUG_read_rf_p2       <= read_rf_p2_i;
  DEBUG_rtype_itypen     <= rtype_itypen_i;
  DEBUG_dram_enable_cu   <= dram_enable_cu_i;

  --synthesis_translate on

end dlx_rtl;
