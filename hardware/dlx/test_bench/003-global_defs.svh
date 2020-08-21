//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : global_defs.svh
// Create : 2020-07-27 17:47:25
// Revise : 2020-07-27 17:47:25
// Editor : sublime text3, tab size (4)
// Description: util global definition (mirror of 000-globals.vhd)
// -----------------------------------------------------------------------------
`ifndef  __GLOBAL_DEFS__SVH
`define  __GLOBAL_DEFS__SVH

`define  NUMBIT 32 // number of bits for the architecture
`define  RF_REGS 32 // number of regisster in the register file
`define  IRAM_WORD_SIZE 32
`define  IRAM_SIZE 2**16-1
`define  IRAM_ADDRESS_SIZE 16
`define  DRAM_WORD_SIZE 32
`define  DRAM_SIZE 2**16-1
`define  DRAM_ADDRESS_SIZE 16

`define CU_STATES 4

`define  ENDIANESS                      "big"; // for memory access
`define  OPCODE_LENGTH                  6  // length in the instruction 
`define  REGISTER_ADDRESS_FIELD_LENGTH  5  // length in the instruction 
`define  IMMEDIATE_LENGTH               16 //  for I-type instructions
`define  ALU_FUNCTION_LENGTH            11 // for R-type instructions
`define  JUMP_ADDRESS_LENGTH            26 // for J-type instruction  
`define  OP_CODE_SIZE  6  // OPCODE field size
`define  FUNC_SIZE      11 // FUNC field size
`define  TOT_CU_SIGN  19  // number of total signoal (I/O) of control unit

typedef enum bit[$clog2(`CU_STATES)-1:0]{hang_error,idle,fetch, decode } cu_state_t;

typedef enum  bit [3:0]{ADD, SUB, MULT, BITAND, BITOR, BITXOR, FUNCLSL, FUNCLSR, GE,LE,NE} TYPE_OP_ALU_sv ; // error in importing the enum from vhdl


// uncomment using vivado simulator 'cause some sv system call are not supported from vivavo simulator
//`define VIVADO_SIM 1 // comment using questa sim simulator

`endif // __GLOBAL_DEFS__SVH



