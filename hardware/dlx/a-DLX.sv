`timescale 1ns/1ps

`include "instructions.vh"

module DLX
#(paramenter IR_SIZE= 32, // Instruction Register Size
    PC_SIZE      = 32     // Program Counter Size
    );
	(
		input logic clk,
		input logic rst // active low 
		);






// This architecture is currently not complete
// it just includes:
// instruction register (complete)
// program counter (complete)
// instruction ram memory (complete)
// control unit (UNCOMPLETE)
//

  // Data Ram (MISSING!You must include it in your final project!)
  // Datapath (MISSING!You must include it in your final project!)
  
// signal declaration   
  // Instruction Register (IR) and Program Counter (PC) declaration
  signal IR : std_logic_vector(IR_SIZE - 1 downto 0);
  signal PC : std_logic_vector(PC_SIZE - 1 downto 0);

  // Instruction Ram Bus signals
  signal IRam_DOut : std_logic_vector(IR_SIZE - 1 downto 0);

  // Datapath Bus signals
  signal PC_BUS : std_logic_vector(PC_SIZE -1 downto 0);

  // Control Unit Bus signals
  signal IR_LATCH_EN_i : std_logic;
  signal NPC_LATCH_EN_i : std_logic;
  signal RegA_LATCH_EN_i : std_logic;
  signal RegB_LATCH_EN_i : std_logic;
  signal RegIMM_LATCH_EN_i : std_logic;
  signal EQ_COND_i : std_logic;
  signal JUMP_EN_i : std_logic;
  signal ALU_OPCODE_i : aluOp;
  signal MUXA_SEL_i : std_logic;
  signal MUXB_SEL_i : std_logic;
  signal ALU_OUTREG_EN_i : std_logic;
  signal DRAM_WE_i : std_logic;
  signal LMD_LATCH_EN_i : std_logic;
  signal PC_LATCH_EN_i : std_logic;
  signal WB_MUX_SEL_i : std_logic;
  signal RF_WE_i : std_logic;


  // Data Ram Bus signals


  //dlx

    // This is the input to program counter: currently zero 
    // so no uptade of PC happens
    // TO BE REMOVED AS SOON AS THE DATAPATH IS INSERTED!!!!!
    // a proper connection must be made here if more than one
    // instruction must be executed
    PC_BUS <= (others => '0'); 


    // purpose: Instruction Register Process
    // type   : sequential
    // inputs : Clk, Rst, IRam_DOut, IR_LATCH_EN_i
    // outputs: IR_IN_i
    IR_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        IR <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (IR_LATCH_EN_i = '1') then
          IR <= IRam_DOut;
        end if;
      end if;
    end process IR_P;


    // purpose: Program Counter Process
    // type   : sequential
    // inputs : Clk, Rst, PC_BUS
    // outputs: IRam_Addr
    PC_P: process (Clk, Rst)
    begin  -- process PC_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        PC <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (PC_LATCH_EN_i = '1') then
          PC <= PC_BUS;
        end if;
      end if;
    end process PC_P;

    // Control Unit Instantiation
    CU_I: dlx_cu
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

    // Instruction Ram Instantiation
    IRAM_I: IRAM
      port map (
          Rst  => Rst,
          Addr => PC,
          Dout => IRam_DOut);

    
    
end dlx_rtl;

endmodule : DLX