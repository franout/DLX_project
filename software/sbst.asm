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
nop
addi r4,r1,#1
nop
nop
lw r4,50(r0)
lw r5,54(r0)
nop
;; test -->and!
and r6,r4,r5
nop
;; test -->andi!
andi r7,r4,#256
nop
;; test -->or!
or r6,r4,r5
;; test -->ori!
ori r7,r4,#10
nop
nop
lw r12,30(r7)
lw r13,40(r6)
nop
;; test -->sub!
sub r11,r12,r13
nop
;; test -->subi!
nop
sw 40(r3),r11
nop
lw r15,0(r0)
lw r16,4(r0)
nop
nop
subi r14,r12,#13
;; test -->xor!
nop
xor r17,r15,r16
;; test -->xori!
nop
xor r18,r15,#11
;; test integer mul
; data already placed in memory 
lw r20,128(0) ; dram.txt line 32
lw r21,132(0) ; dram.txt line 33
nop
nop
;imul r22,r21,r22
nop
nop
sw 40(r3),r22
;; add loop of addition for checking the result of mult
loop:
add r1,r21,r0
nop
subi r22,r22,#1
nop
bnez r22,loop

;; test -->j!
j forward
nop
nop
nop
nop
nop
forward:
;; test -->beqz!
beqz r0,true1
false1:
sw 40(r3),r22
true1:
;; test -->sge!
slei r1,r2,r5
nop
;; test -->sgei!
sgei r1,r2,#89
nop
;; test -->sle!
slei r1,r2,r9
nop
;; test -->slei!
slei r1,r2,#56
nop
;; test -->sne!
snei r4 ,r0 ,r0
;; test -->snei!
snei r6 ,r5 ,#89

sw 80(r3),r22
lw r3,128(0) ; dram.txt line 32
lw r2,132(0) ; dram.txt line 33
nop
;; test -->sll!
sll r1,r2,r3
nop
;; test -->slli!
slli r4,r2,#3
nop

;; test -->srl!
srl r5,r3,r2
;; test -->srli!
srli r6,r3,#15

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

