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
// Description: util global definisiton (mirror of 000-globals.vhd)
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

typedef enum  bit [3:0]{ADD, SUB, MULT, BITAND, BITOR, BITXOR, FUNCLSL, FUNCLSR, FUNCRL, FUNCRR} TYPE_OP_ALU_sv ; // error in importing the enum from vhdl


// uncomment using vivado simulator 'cause some sv system call are not supported from vivavo simulator
`define VIVADO_SIM 1 // comment using questa sim simulator

`endif // __GLOBAL_DEFS__SVH



