library ieee;
use ieee.std_logic_1164.all;

package myTypes is

-- Control unit input sizes
    constant OP_CODE_SIZE : integer :=  6;                                              -- OPCODE field size
    constant FUNC_SIZE    : integer :=  11;                                             -- FUNC field size
    constant ADD_REG_SIZE : integer := 5;                                               -- # of bits used for addressing the registers for both an I-Type or R-Type instruction 
    constant instr_length : integer := 32;                                              -- number of bits for an instruction 


-- R-TYPE -> register to register operation 
-- I-TYPE -> register and an immediate of ALU operation or load/store memory operatins 


-- R-Type instruction -> FUNC field
    -- In  R-Type the func field it indicates the types of mathematical(this information is in the opcode) operation to execute
    constant RTYPE_ADD : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000001";    -- ADD RS1,RS2,RD
    constant RTYPE_SUB : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000010";    -- SUB RS1,RS2,RD
    constant RTYPE_AND : std_logic_vector(FUNC_SIZE - 1 downto 0):=  "00000000011";     -- AND RS1,RS2,RD
    constant RTYPE_OR : std_logic_vector(FUNC_SIZE - 1 downto 0):=  "00000000100";      -- OR  RS1,RS2,RD
    constant NOP : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000000";          -- do nothing 

-- R-Type instruction -> OPCODE field
-- it is used to notify that the cpu has to execute a mathematical operation 
    constant RTYPE : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000000";          -- for ADD, SUB, AND, OR register-to-register operation

-- I-Type instruction -> OPCODE field
    constant ITYPE_ADDI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000001";    -- ADDI1 RS1,RD,INP1
    constant ITYPE_SUBI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000010";    -- SUBI1 RS1,RD,INP1
    constant ITYPE_ANDI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000011";    -- ANDI1 RS1,RD,INP1
    constant ITYPE_ORI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=   "000100";    -- ORI1 RS1,RD,INP1 
    constant ITYPE_ADDI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000101";   -- ADDI2 RS1,RD,INP2
    constant ITYPE_SUBI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000110";    -- SUBI2 RS1,RD,INP2
    constant ITYPE_ANDI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000111";    -- ANDI2 RS1,RD,INP2
    constant ITYPE_ORI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=   "001000";    -- ORI2 RS1,RD,INP2
    constant ITYPE_MOV : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=    "001001";    -- MOV RS1,RD
    constant ITYPE_S_REG1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001010";    -- S_REG1  RD,INP1 r1 not used reg[RD]<= INP2 RD always r2
    constant ITYPE_S_REG2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001011";    -- S_REG2 RD,INP2 r2 not used  reg[RD]<= INP2 RD always r1
    constant ITYPE_S_MEM2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001100";    -- S_MEM2 RD,RS,INP1  mem[ [reg[RD]+inp1]<=reg[RS]
    constant ITYPE_L_MEM1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001101";    -- L_MEM1 RS,RD,INP1  reg[RS]<=mem[reg[RS]+INP1]
    constant ITYPE_L_MEM2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001110";    -- L_MEM2 RS1,RD,INP1 reg[RS]<=mem[reg[RS]+INP2]



-- Change the values of the instructions coding as you want, depending also on the type of control unit choosen

end myTypes;

