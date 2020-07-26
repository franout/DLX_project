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



enum byte {
	nop
} instructions;


//General instructions
/*j j,0x02 
jal j,0x03 
beqz b,0x04 
bnez b,0x05 
bfpt b0,0x06
bfpf b0,0x07 
addi i,0x08 
addui i,0x09
subi i,0x0a 
subui i,0x0b 
andi i,0x0c 
ori i,0x0d 
xori i,0x0e 
lhi i1,0x0f
rfe n,0x10 
trap t,0x11 
jr jr,0x12 
jalr jr,0x13
slli i,0x14
nop n,0x15
srli i,0x16 
srai i,0x17 
seqi i,0x18 
snei i,0x19 
slti i,0x1a 
sgti i,0x1b 
slei i,0x1c 
sgei i,0x1d 
lb l,0x20 
lh l,0x21
lw l,0x23
lbu l,0x24
lhu l,0x25
lf l,0x26
ld l,0x27
sb s,0x28
sh s,0x29
sw s,0x2b
sf s,0x2e
sd s,0x2f
itlb n,0x38
sltui i,0x3a
sgtui i,0x3b
sleui i,0x3c
sgeui i,0x3d
*/

// Register-register instructions 
/*sll r,0x04 
srl r,0x06
sra r,0x07 
add r,0x20 
addu r,0x21
sub r,0x22
subu r,0x23
and r,0x24 
or r,0x25
xor r,0x26 
seq r,0x28 
sne r,0x29 
slt r,0x2a 
sgt r,0x2b 
sle r,0x2c 
sge r,0x2d
movi2s r2,0x30 
movs2i r2,0x31 
movf r2,0x32 
movd r2,0x33
movfp2i r2,0x34
movi2fp r2,0x35 
movi2t r,0x36
movt2i r,0x37 
sltu r,0x3a 
sgtu r,0x3b 
sleu r,0x3c 
sgeu r,0x3d 
*/


//Floating-point instruction
/*addf f,0x00
subf f,0x01
multf f,0x02
divf f,0x03
addd f,0x04
subd f,0x05
multd f,0x06
divd f,0x07
cvtf2d fd,0x08
cvtf2i fd,0x09
cvtd2f fd,0x0a
cvtd2i fd,0x0b
cvti2f fd,0x0c
cvti2d fd,0x0d
mult f,0x0e
div f,0x0f
eqf f2,0x10
nef f2,0x11
ltf f2,0x12
gtf f2,0x13
lef f2,0x14
gef f2,0x15
multu f,0x16
divu f,0x17
eqd f2,0x18
ned f2,0x19
ltd f2,0x1a
gtd f2,0x1b
led f2,0x1c
ged f2,0x1d
*/

`endif // __implemented_instructions__svh
