--------------------------------------------------------------------------------
-- Title       : DLX control unit 
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.a-dlx_cu.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Thu Jul 23 15:49:45 2020
-- Last update : Thu Jul 23 19:00:20 2020
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

entity dlx_cu  is
  generic (
    MICROCODE_MEM_SIZE :     integer := 10;  -- Microcode Memory Size
    FUNC_SIZE          :     integer := 11;  -- Func Field Size for R-Type Ops
    OP_CODE_SIZE       :     integer := 6;  -- Op Code Size
    -- ALU_OPC_SIZE       :     integer := 6;  -- ALU Op Code Word Size
    IR_SIZE            :     integer := 32;  -- Instruction Register Size    
    CW_SIZE            :     integer := 15);  -- Control Word Size
  port (
    Clk                : in  std_logic;  -- Clock
    Rst                : in  std_logic;  -- Reset:Active-Low
    -- Instruction Register
    IR_IN              : in  std_logic_vector(IR_SIZE - 1 downto 0);
    
    -- IF Control Signal
    IR_LATCH_EN        : out std_logic;  -- Instruction Register Latch Enable
    NPC_LATCH_EN       : out std_logic;
                                        -- NextProgramCounter Register Latch Enable
    -- ID Control Signals
    RegA_LATCH_EN      : out std_logic;  -- Register A Latch Enable
    RegB_LATCH_EN      : out std_logic;  -- Register B Latch Enable
    RegIMM_LATCH_EN    : out std_logic;  -- Immediate Register Latch Enable

    -- EX Control Signals
    MUXA_SEL           : out std_logic;  -- MUX-A Sel
    MUXB_SEL           : out std_logic;  -- MUX-B Sel
    ALU_OUTREG_EN      : out std_logic;  -- ALU Output Register Enable
    EQ_COND            : out std_logic;  -- Branch if (not) Equal to Zero
    -- ALU Operation Code
    ALU_OPCODE         : out aluOp; -- choose between implicit or exlicit coding, like std_logic_vector(ALU_OPC_SIZE -1 downto 0);
    
    -- MEM Control Signals
    DRAM_WE            : out std_logic;  -- Data RAM Write Enable
    LMD_LATCH_EN       : out std_logic;  -- LMD Register Latch Enable
    JUMP_EN            : out std_logic;  -- JUMP Enable Signal for PC input MUX
    PC_LATCH_EN        : out std_logic;  -- Program Counte Latch Enable

    -- WB Control signals
    WB_MUX_SEL         : out std_logic;  -- Write Back MUX Sel
    RF_WE              : out std_logic);  -- Register File Write Enable

end entity ; -- dlx_cu 

architecture arch of dlx_cu  is

type state_t is (idle);

begin


fsm : process( clk,Rst )
if (Rst=='0') then 

elsif (rising_edge(clk)) then

end if;
end process ; -- fsm


-- alu function generator process


end architecture ; -- arch




--------------------------------------------------------------------------------
--microcontrolled
entity dlx_cu is
  generic (
    INSTRUCTIONS_EXECUTION_CYCLES : integer := 5;  -- Instructions Execution
                                                   -- Clock Cycles
    MICROCODE_MEM_SIZE            : integer := 164;  -- Microcode Memory Size
    RELOC_MEM_SIZE                : integer := 64;  -- Microcode Relocation
                                                   -- Memory Size
    OP_CODE_SIZE : integer := 6;        -- Op Code Size
    ALU_OPC_SIZE : integer := 2;        -- ALU Op Code Word Size
    IR_SIZE      : integer := 32;       -- Instruction Register Size
    FUNC_SIZE    : integer := 11;       -- Func Field Size for R-Type Ops
    CW_SIZE      : integer := 15);      -- Control Word Size
  port (
    Clk             : in  std_logic;    -- Clock
    Rst             : in  std_logic;    -- Reset:Active-Low
    -- Instruction Register
    IR_IN           : in std_logic_vector(IR_SIZE - 1 downto 0);
    -- IF Control Signal
    IR_LATCH_EN     : out std_logic;    -- Instruction Register Latch Enable
    NPC_LATCH_EN    : out std_logic;
                                        -- NextProgramCounter Register Latch Enable
    -- ID Control Signals
    RegA_LATCH_EN   : out std_logic;    -- Register A Latch Enable
    RegB_LATCH_EN   : out std_logic;    -- Register B Latch Enable
    RegIMM_LATCH_EN : out std_logic;    -- Immediate Register Latch Enable
    -- EX Control Signal
    EQ_COND         : out std_logic;    -- Branch if (not) Equal to Zero
    JUMP_EN         : out std_logic;    -- JUMP Enable Signal for PC input MUX
    ALU_OPCODE      : out std_logic_vector(ALU_OPC_SIZE -1 downto 0); -- CHANGE IN DLX TOP the component declaration!
                                        -- ALU Operation Code
    MUXA_SEL        : out std_logic;    -- MUX-A Sel
    MUXB_SEL        : out std_logic;    -- MUX-B Sel
    ALU_OUTREG_EN   : out std_logic;    -- ALU Output Register Enable
    -- MEM Control Signals
    DRAM_WE         : out std_logic;    -- Data RAM Write Enable
    LMD_LATCH_EN    : out std_logic;    -- LMD Register Latch Enable
    PC_LATCH_EN     : out std_logic;    -- Program Counte Latch Enable
    WB_MUX_SEL      : out std_logic;    -- Write Back MUX Sel
    RF_WE           : out std_logic);   -- Register File Write Enable

end dlx_cu;

architecture dlx_cu_pu of dlx_cu is
  -- R-Type OpCode: 0x00
  --    ADD func Code: 0x20
  --    SUB func Code: 0x22
  -- I-Type OpCode
  --    LW : 0x23
  --    SW : 0x2b
  -- J-Type OpCode
  --    J    : 0x02
  --    BEQZ : 0x04

  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
  type reloc_mem_array is array (0 to RELOC_MEM_SIZE - 1) of unsigned(OP_CODE_SIZE +1 downto 0);

  signal reloc_mem : reloc_mem_array := (X"00",  -- All R-Type Instructions are not Relocated                                               
                                         X"00",
                                         X"02",  -- J(0x02) -> 0x02
                                         X"00",
                                         X"08",  -- BEQZ(0x04) -> 0x08
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00", 
                                         X"00",
                                         X"00", 
                                         X"29",  -- LW(0x23) -> 0x29
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"36",  -- SW(0x2b) -> 0x36
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00",
                                         X"00");

  signal microcode : mem_array := ("000000000000000",  -- RESET
                                   "110000000000000",  -- (IF)
                                   "001010110000000",  -- (ID) 'J' (0x02)
                                   "000000111000100",  -- (EX)
                                   "000000000000101",  -- (MEM)
                                   "000000000000000",  -- (WB)
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",  -- (ID) 'BEQZ' (0x04)
                                   "000000000000000",  -- (EX)
                                   "000000000000000",  -- (MEM)
                                   "000000000000000",  -- (WB)
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000", 
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",  
                                   "000000000000000",
                                   "000000000000000",  
                                   "000000000000000",  
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",  -- (ID) 'LW' (0x23)
                                   "000000000000000",
                                   "000000000000000",  
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",  -- (ID) 'SW' (0x2b)
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",  -- (ID) 'ADD' (0x00,0x20)
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",  -- (ID) 'SUB' (0x00,0x22)
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000",
                                   "000000000000000");

  signal cw : std_logic_vector(CW_SIZE - 1 downto 0);

  signal uPC : integer range 0 to 131072;
  signal ICount : integer range 0 to INSTRUCTIONS_EXECUTION_CYCLES;
  signal OpCode : unsigned(OP_CODE_SIZE -1 downto 0);
  signal OpCode_Reloc : unsigned(OP_CODE_SIZE + 1 downto 0);
  
  constant R_OPCODE : unsigned(OP_CODE_SIZE -1 downto 0) := "000000";
                                                        
  signal func : unsigned(FUNC_SIZE - 1 downto 0);
  
  
  

begin  -- dlx_cu_rtl

  cw <= microcode(uPC);

  IR_LATCH_EN <= cw(CW_SIZE - 1);
  NPC_LATCH_EN <= cw(CW_SIZE - 2);

  RegA_LATCH_EN <= cw(CW_SIZE - 3);
  RegB_LATCH_EN <= cw(CW_SIZE - 4);
  RegIMM_LATCH_EN <= cw(CW_SIZE - 5);
  RF_WE <= cw(CW_SIZE - 6);

  MUXA_SEL <= cw(CW_SIZE - 7);
  MUXB_SEL <= cw(CW_SIZE - 8);
  ALU_OUTREG_EN <= cw(CW_SIZE - 9);
  EQ_COND <= cw(CW_SIZE - 10);

  DRAM_WE <= cw(CW_SIZE - 11);
  LMD_LATCH_EN <= cw(CW_SIZE - 12);
  JUMP_EN <= cw(CW_SIZE - 13);

  WB_MUX_SEL <= cw(CW_SIZE - 14);

  PC_LATCH_EN <= cw(CW_SIZE - 15);

  OpCode <= unsigned(IR_IN(IR_SIZE -1 downto 26));
  OpCode_Reloc <= reloc_mem(conv_integer(OpCode));
  func <= unsigned(IR_IN(FUNC_SIZE - 3 downto 0)) & "00";  -- Multiply func value by 4 (
                                                 -- Shift left)

  -- purpose: Generation of ALU OpCode
  -- type   : combinational
  -- inputs : OpCode,func
  -- outputs: ALU_OPCODE
  ALU_OP_CODE_P: process (OpCode,func)
  begin  -- process ALU_OP_CODE_P
    ALU_OPCODE <= (others => '0');
    if (OpCode = R_OPCODE) then         -- R-Type Instructions
      if (conv_integer(func) = 128) then -- ADD
        ALU_OPCODE <= "01";
      elsif (conv_integer(func) = 136) then
        ALU_OPCODE <= "10";              -- SUB
      end if;
    end if;
  end process ALU_OP_CODE_P;

  -- purpose: Update the uPC value depending on the instruction Op Code
  -- type   : sequential
  -- inputs : Clk, Rst, IR_IN
  -- outputs: CW Control Signals
  uPC_Proc: process (Clk, Rst)
  begin  -- process uPC_Proc
    if Rst = '0' then                   -- asynchronous reset (active low)
      uPC <= 0;
      ICount <= 0;
    elsif Clk'event and Clk = '1' then  -- rising clock edge
      if (ICount < 1) then
        uPC <= 1;
        ICount <= ICount + 1;
      elsif (ICount < 2) then
        if (OpCode = R_OPCODE) then
          uPC <= conv_integer(func);
        else
          uPC <= conv_integer(OpCode_Reloc);
        end if;
        ICount <= ICount + 1;
      elsif (ICount < INSTRUCTIONS_EXECUTION_CYCLES) then
        upc <= upc + 1;
        ICount <= ICount + 1;
      else
        ICount <= 1;
        uPC <= 1;
      end if;
      
    end if;
  end process uPC_Proc;
  

  

end dlx_cu_pu;



---------------------------------------------------------------------------------
-- hardwired


architecture dlx_cu_hw of dlx_cu is
  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
  signal cw_mem : mem_array := ("111100010000111", -- R type: IS IT CORRECT?
                                "000000000000000",
                                "111011111001100", -- J (0X02) instruction encoding corresponds to the address to this ROM
                                "000000000000000", -- JAL to be filled
                                "000000000000000", -- BEQZ to be filled
                                "000000000000000", -- BNEZ
                                "000000000000000", -- 
                                "000000000000000",
                                "000000000000000", -- ADD i (0X08): FILL IT!!!
                                "000000000000000");-- to be completed (enlarged and filled)
                                
                                
  signal IR_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0);  -- OpCode part of IR
  signal IR_func : std_logic_vector(FUNC_SIZE downto 0);   -- Func part of IR when Rtype
  signal cw   : std_logic_vector(CW_SIZE - 1 downto 0); -- full control word read from cw_mem


  -- control word is shifted to the correct stage
  signal cw1 : std_logic_vector(CW_SIZE -1 downto 0); -- first stage
  signal cw2 : std_logic_vector(CW_SIZE - 1 - 2 downto 0); -- second stage
  signal cw3 : std_logic_vector(CW_SIZE - 1 - 5 downto 0); -- third stage
  signal cw4 : std_logic_vector(CW_SIZE - 1 - 9 downto 0); -- fourth stage
  signal cw5 : std_logic_vector(CW_SIZE -1 - 13 downto 0); -- fifth stage

  signal aluOpcode_i: aluOp := NOP; -- ALUOP defined in package
  signal aluOpcode1: aluOp := NOP;
  signal aluOpcode2: aluOp := NOP;
  signal aluOpcode3: aluOp := NOP;


 
begin  -- dlx_cu_rtl

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


  -- process to pipeline control words
  CW_PIPE: process (Clk, Rst)
  begin  -- process Clk
    if Rst = '0' then                   -- asynchronous reset (active low)
      cw1 <= (others => '0');
      cw2 <= (others => '0');
      cw3 <= (others => '0');
      cw4 <= (others => '0');
      cw5 <= (others => '0');
      aluOpcode1 <= NOP;
      aluOpcode2 <= NOP;
      aluOpcode3 <= NOP;
    elsif Clk'event and Clk = '1' then  -- rising clock edge
      cw1 <= cw;
      cw2 <= cw1(CW_SIZE - 1 - 2 downto 0);
      cw3 <= cw2(CW_SIZE - 1 - 5 downto 0);
      cw4 <= cw3(CW_SIZE - 1 - 9 downto 0);
      cw5 <= cw4(CW_SIZE -1 - 13 downto 0);

      aluOpcode1 <= aluOpcode_i;
      aluOpcode2 <= aluOpcode1;
      aluOpcode3 <= aluOpcode2;
    end if;
  end process CW_PIPE;

  ALU_OPCODE <= aluOpcode3;

  -- purpose: Generation of ALU OpCode
  -- type   : combinational
  -- inputs : IR_i
  -- outputs: aluOpcode
   ALU_OP_CODE_P : process (IR_opcode, IR_func)
   begin  -- process ALU_OP_CODE_P
    case conv_integer(unsigned(IR_opcode)) is
            -- case of R type requires analysis of FUNC
        when 0 =>
            case conv_integer(unsigned(IR_func)) is
                when 4 => aluOpcode_i <= LLS; -- sll according to instruction set coding
                when 6 => aluOpcode_i <= LRS; -- srl
                -- to be continued and filled with all the other instructions  
                when others => aluOpcode_i <= NOP;
            end case;
        when 2 => aluOpcode_i <= NOP; -- j
        when 3 => aluOpcode_i <= NOP; -- jal
        when 8 => aluOpcode_i <= ADDS; -- addi
        -- to be continued and filled with other cases
        when others => aluOpcode_i <= NOP;
     end case;
    end process ALU_OP_CODE_P;


end dlx_cu_hw;

--------------------------------------------------------------------------------
-- fsm 



architecture dlx_cu_fsm of dlx_cu is
  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
  signal cw_mem : mem_array := ("111100010000111", -- R type: IS IT CORRECT?
                                "000000000000000",
                                "111011111001100", -- J (0X02) instruction encoding corresponds to the address to this ROM
                                "000000000000000", -- JAL to be filled
                                "000000000000000", -- BEQZ to be filled
                                "000000000000000", -- BNEZ
                                "000000000000000", -- 
                                "000000000000000",
                                "000000000000000", -- ADD i (0X08): FILL IT!!!
                                "000000000000000");-- to be completed (enlarged and filled)
                                
                                
  signal IR_opcode : std_logic_vector(OP_CODE_SIZE -1 downto 0);  -- OpCode part of IR
  signal IR_func : std_logic_vector(FUNC_SIZE downto 0);   -- Func part of IR when Rtype
  signal cw   : std_logic_vector(CW_SIZE - 1 downto 0); -- full control word read from cw_mem


  signal aluOpcode_i: aluOp := NOP; -- ALUOP defined in package
  signal aluOpcode1: aluOp := NOP;
  signal aluOpcode2: aluOp := NOP;
  signal aluOpcode3: aluOp := NOP;

  -- declarations for FSM implementation (to be completed whith alla states!)
    type TYPE_STATE is (
        reset, fetch,
        dec1 .........
        ... to be completed!
    );
    signal CURRENT_STATE : TYPE_STATE := reset;
    signal NEXT_STATE : TYPE_STATE := fetch;



 
begin  -- dlx_cu_rtl

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
   begin  -- process ALU_OP_CODE_P
    case conv_integer(unsigned(IR_opcode)) is
            -- case of R type requires analysis of FUNC
        when 0 =>
            case conv_integer(unsigned(IR_func)) is
                when 4 => aluOpcode_i <= LLS; -- sll according to instruction set coding
                when 6 => aluOpcode_i <= LRS; -- srl
                -- to be continued and filled with all the other instructions  
                when others => aluOpcode_i <= NOP;
            end case;
        when 2 => aluOpcode_i <= NOP; -- j
        when 3 => aluOpcode_i <= NOP; -- jal
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
    
    P_OUTPUTS: process(CURRENT_STATE)
    begin
        --O <= '0';
        case CURRENT_STATE is   
            when reset => cw <= "000000000000000";
            when fetch => cw <= "110000000000000";
            when dec101 => cw <=  TO BE COMPLETED
            -- TO BE COMPLETED
            --
            --
            --
            when others => cw <= "000000000000000"; -- error        
        end case;   
    end process P_OUTPUTS;



end dlx_cu_fsm;