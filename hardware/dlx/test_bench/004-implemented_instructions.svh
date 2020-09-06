//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : implemented_instructions.svh
// Create : 2020-07-22 20:15:37
// Revise : 2020-07-22 20:15:37
// Editor : sublime text3, tab size (4)
// Description:  List of current implemented instruction in the CU of the DLX 
// -----------------------------------------------------------------------------
`ifndef __implemented_instructions__svh
`define __implemented_instructions__svh

`define IMPLEMENTED_INSTR 28

typedef bit[5:0] bit_instr;


typedef enum bit_instr {
   i_regtype=6'h00,
   i_addi= 6'h08,
   i_andi= 6'h0c,
   i_beqz= 6'h04,
   i_benz= 6'h05,
   i_j= 6'h02,
   i_jal= 6'h03,
   i_lw= 6'h23,
   i_nop=6'h15,
   i_sgei= 6'h1d,
   i_slei= 6'h1c,
   i_slli= 6'h14,
   i_snei= 6'h19,
   i_srli= 6'h16,
   i_subi=6'h0a,
   i_sw= 6'h2b,
   i_ori=6'h0d,
   i_xori=6'h0e
} instructions_opcode;

typedef enum bit_instr {
   i_add=6'h20,
   i_and=  6'h24,
   i_or= 6'h25,
   i_sll= 6'h04,
   i_srl= 6'h06,
   i_sub= 6'h22,
   i_xor= 6'h26,
   i_sne= 6'h29,
   i_sle= 6'h2c,
   i_sge= 6'h2d,
   i_mul=6'h3f
} instructions_regtype_opcode; // in the function field

/*for printing instruction name*/
virtual class enum_wrap_instruction#(type T);
  static function string name(T obj);
    return obj.name();
  endfunction
endclass



//General instructions
/*j j,0x02  jal j,0x03  beqz b,0x04  bnez b,0x05  bfpt b0,0x06 bfpf b0,0x07  addi i,0x08 
addui i,0x09  subi i,0x0a  subui i,0x0b  andi i,0x0c ori i,0x0d  xori i,0x0e 
lhi i1,0x0frfe n,0x10 trap t,0x11 jr jr,0x12 jalr jr,0x13slli i,0x14nop n,0x15srli i,0x16 srai i,0x17 seqi i,0x18 snei i,0x19 
slti i,0x1a sgti i,0x1b slei i,0x1c sgei i,0x1d lb l,0x20 lh l,0x21lw l,0x23lbu l,0x24lhu l,0x25
lf l,0x26ld l,0x27sb s,0x28sh s,0x29sw s,0x2bsf s,0x2esd s,0x2fitlb n,0x38sltui i,0x3a sgtui i,0x3b sleui i,0x3c sgeui i,0x3d
*/

// Register-register instructions 
/*sll r,0x04 srl r,0x06sra r,0x07 add r,0x20 addu r,0x21sub r,0x22subu r,0x23
and r,0x24 or r,0x25xor r,0x26 seq r,0x28 sne r,0x29 slt r,0x2a sgt r,0x2b sle r,0x2c sge r,0x2dmovi2s r2,0x30 movs2i r2,0x31 movf r2,0x32 
movd r2,0x33 movfp2i r2,0x34 movi2fp r2,0x35  movi2t r,0x36 movt2i r,0x37  sltu r,0x3a  sgtu r,0x3b  sleu r,0x3c  sgeu r,0x3d 
*/


//Floating-point instruction
/*addf f,0x00 subf f,0x01multf f,0x02divf f,0x03addd f,0x04subd f,0x05multd f,0x06divd f,0x07
cvtf2d fd,0x08cvtf2i fd,0x09cvtd2f fd,0x0acvtd2i fd,0x0bcvti2f fd,0x0ccvti2d fd,0x0dmult f,0x0e
div f,0x0f eqf f2,0x10 nef f2,0x11 ltf f2,0x12 gtf f2,0x13 lef f2,0x14 gef f2,0x15 multu f,0x16
divu f,0x17 eqd f2,0x18 ned f2,0x19 ltd f2,0x1a gtd f2,0x1b led f2,0x1c ged f2,0x1d
*/

`endif // __implemented_instructions__svh
