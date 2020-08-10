--------------------------------------------------------------------------------
-- Title       : DLX control unit 
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.a-control_unit.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Thu Jul 23 15:49:45 2020
-- Last update : Tue Aug 11 00:02:18 2020
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

entity control_unit is
  generic (
    PC_SIZE      : integer := 32;
    RF_REGS      : integer := 32; -- number of register in register file
    FUNC_SIZE    : integer := 11; -- Func Field Size for R-Type Ops
    OP_CODE_SIZE : integer := 6;  -- Op Code Size
    IR_SIZE      : integer := 32; -- Instruction Register Size    
    CW_SIZE      : integer := 15  -- Control Word Size
  );
  port (
    clk : in std_logic;
    rst : in std_logic; -- active low
    -- for fetch stage
    iram_enable_cu         : out std_logic;
    iram_ready_cu          : in  std_logic;
    curr_instruction_to_cu : in  std_logic_vector(PC_SIZE-1 downto 0);
    -- for decode stage
    enable_rf        : out std_logic;
    read_rf_p1       : out std_logic;
    read_rf_p2       : out std_logic;
    write_rf         : out std_logic;
    rtype_itypen_i : out std_logic;
    compute_sext     : out std_logic;
    -- for execute stage
    alu_op_type : out std_logic_vector(3 downto 0); --TYPE_OP_ALU ; for compatibility with sv
    sel_val_a   : out std_logic_vector(0 downto 0 );
    sel_val_b   : out std_logic_vector(0 downto 0 );
    -- from execute stage
    alu_cin         : out  std_logic;
    alu_overflow    : in  std_logic;
    evaluate_branch : out std_logic;
    -- for memory stage
    dram_enable_cu : out std_logic;
    dram_r_nw_cu   : out std_logic;
    dram_ready_cu  : in  std_logic;
    -- for write back stage   
    select_wb : out std_logic_vector(0 downto 0);
    -- simulation debug signals
    --synthesis_translate off
    ;
    STATE_CU : out std_logic_vector(f_log2(tot_state)-1 downto 0)
    --synthesis_translate on

  );
end entity control_unit;



architecture behavioural of dlx_cu is

  type state_t is (power_up,idle);

  signal curr_state,next_state: state_t;

begin


  reg_state : process( clk,Rst )
  begin
    if (rst=='0') then
      curr_state<=power_up;
    elsif (rising_edge(clk)) then
      curr_state<=next_state;
    end if;
  end process reg_state;


  cl: process()
  begin 


  end process cl;

  -- alu function generator process



  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
  signal cw_mem : mem_array := ("111100010000111", -- R type: IS IT CORRECT?
      "000000000000000",
      "111011111001100", -- J (0X02) instruction encoding corresponds to the address to this ROM
      "000000000000000", -- JAL to be filled
      "000000000000000", -- BEQZ to be filled
      "000000000000000", -- BNEZ
      "000000000000000", -- 
      "000000000000000",
      "000000000000000",  -- ADD i (0X08): FILL IT!!!
      "000000000000000"); -- to be completed (enlarged and filled)


  signal IR_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0); -- OpCode part of IR
  signal IR_func   : std_logic_vector(FUNC_SIZE downto 0);       -- Func part of IR when Rtype
  signal cw        : std_logic_vector(CW_SIZE - 1 downto 0);     -- full control word read from cw_mem


  signal aluOpcode_i : aluOp := NOP; -- ALUOP defined in package
  signal aluOpcode1  : aluOp := NOP;
  signal aluOpcode2  : aluOp := NOP;
  signal aluOpcode3  : aluOp := NOP;

  -- declarations for FSM implementation (to be completed whith alla states!)
  type TYPE_STATE is (
      reset, fetch,
      dec1 .........
      ... to be completed!
    );
  signal CURRENT_STATE : TYPE_STATE := reset;
  signal NEXT_STATE    : TYPE_STATE := fetch;




begin -- dlx_cu_rtl

  IR_opcode(5 downto 0) <= IR_IN(31 downto 26);
  IR_func(10 downto 0)  <= IR_IN(FUNC_SIZE - 1 downto 0);

  cw <= cw_mem(conv_integer(IR_opcode));


  -- stage one control signals
  IR_LATCH_EN  <= cw1(CW_SIZE - 1);
  NPC_LATCH_EN <= cw1(CW_SIZE - 2);

  -- stage two control signals
  RegA_LATCH_EN   <= cw2(CW_SIZE - 3);
  RegB_LATCH_EN   <= cw2(CW_SIZE - 4);
  RegIMM_LATCH_EN <= cw2(CW_SIZE - 5);

  -- stage three control signals
  MUXA_SEL      <= cw3(CW_SIZE - 6);
  MUXB_SEL      <= cw3(CW_SIZE - 7);
  ALU_OUTREG_EN <= cw3(CW_SIZE - 8);
  EQ_COND       <= cw3(CW_SIZE - 9);

  -- stage four control signals
  DRAM_WE      <= cw4(CW_SIZE - 10);
  LMD_LATCH_EN <= cw4(CW_SIZE - 11);
  JUMP_EN      <= cw4(CW_SIZE - 12);
  PC_LATCH_EN  <= cw4(CW_SIZE - 13);

  -- stage five control signals
  WB_MUX_SEL <= cw5(CW_SIZE - 14);
  RF_WE      <= cw5(CW_SIZE - 15);


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


  -----------------------------------------------------
  -- FSM
  -- This is a very simplified starting point for a fsm
  -- up to you to complete it and to improve it
  -----------------------------------------------------


  P_OPC : process(Clk, Rst)
  begin
    if Rst='0' then
      CURRENT_STATE <= reset;
    elsif (Clk ='1' and Clk'EVENT) then
      CURRENT_STATE <= NEXT_STATE;
    end if;
  end process P_OPC;

  P_NEXT_STATE : process(CURRENT_STATE, OpCode)
  begin
    --NEXT_STATE <= CURRENT_STATE;
    case CURRENT_STATE is
      when reset =>
        NEXT_STATE <= fetch;
      when fetch =>
        if OpCode = TO BE COMPLETED!!! then
          NEXT_STATE <= dec1;
        elsif
        ----
        ----
        ----
        end if;
      when dec1 =>

        --- TO BE COMPLETED

    end case;
  end process P_NEXT_STATE;

  P_OUTPUTS : process(CURRENT_STATE)
  begin
    --O <= '0';
    case CURRENT_STATE is
      when reset  => cw <= "000000000000000";
      when fetch  => cw <= "110000000000000";
      when dec101 => cw <= TO BE COMPLETED
      -- TO BE COMPLETED
      --
      --
      --
      when others => cw <= "000000000000000"; -- error        
    end case;
  end process P_OUTPUTS;


end architecture ; -- arch


