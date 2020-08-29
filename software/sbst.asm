;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; software based self test for verifying the functionality of dlx processor ;;;;;;
;;;;; Author: Angione Francesco s262620@studenti.polito.it 						;;;;;;
;;;;; 																			;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; ALU verificiation ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; test -->add! sequential fashion
lw r2,40(r0)
lw r3,40(r0)
nop
add r1,r2,r3
nop
sw 40(r0),r1
nop
nop
;; test -->addi! and pipeline withot dependancies
add r1,r0,r0
nop
sw 20(r0),r1
nop
addi r4,r1,#1
nop
sw 30(r0),r4
nop
lw r4,50(r0)
lw r5,54(r0)
nop
;; test -->and!
and r6,r4,r5
nop
sw 60(r0),r6
;; test -->andi!
andi r7,r4,#256
nop
sw 70(r0),r7
;; test -->or!
or r6,r4,r5
nop
sw 80(r0),r6
;; test -->ori!
ori r7,r4,#10
nop
sw 90(r0),r7
nop
lw r12,104(r1)
lw r13,100(r1)
nop
;; test -->sub!
sub r11,r12,r13
nop
nop
sw 40(r3),r11
;; test -->subi!
nop
lw r15,0(r0)
lw r16,4(r0)
nop
nop
subi r14,r12,#13
;; test -->xor!
nop
xor r17,r15,r16
nop
sw 150(r0);r17
;; test -->xori!
nop
xori r18,r15,#11
nop
sw 160(r0),r18
;; test integer mul
; data already placed in memory 
lw r20,124(r0) ; dram.txt line 32
nop
lw r21,128(r0) ; dram.txt line 33
nop
nop
nop
nop
nop
nop
imul r22,r21,r20
nop
nop
sw 40(r3),r22
add r1,r0,r0
;; add loop of addition for checking the result of mult
loop:
nop
nop
add r1,r21,r1
nop
nop
subi r20,r20,#1
bnez r20,loop
nop
nop
nop
nop
nop
nop
;; test -->j!
j forward
nop
nop
nop
nop
nop
forward:
nop
nop
nop
;; test -->beqz!
beqz r0,true1
false1:
nop
nop
nop
add r1,r0,r0
nop
nop
nop
sw 40(r3),r22
true1:
;; test -->sge!
slei r1,r2,r5
nop
sw 180(r0),r1
;; test -->sgei!
sgei r1,r2,#89
nop
sw 190(r0),r1
;; test -->sle!
slei r1,r2,r9
nop
sw 200(r0),r1
;; test -->slei!
slei r1,r2,#56
nop
sw 210(r0),r1
;; test -->sne!
snei r4 ,r0 ,r0
nop
sw 220(r0),r4
;; test -->snei!
snei r6 ,r5 ,#89
nop
sw 240(r0),r6
lw r3,128(0) ; dram.txt line 32
lw r2,132(0) ; dram.txt line 33
nop
;; test -->sll!
sll r1,r2,r3
nop
sw 250(r0),r1
;; test -->slli!
slli r4,r2,#3
nop
sw 260(r0),r4
;; test -->srl!
srl r5,r3,r2
nop
sw 260(r0),r5
;; test -->srli!
srli r6,r3,#15
nop
sw 270(r0),r6
;; test -->jal!
jal end
nop
nop
nop
nop
nop
nop
nop
end:
nop
nop
nop
nop
nop
nop

