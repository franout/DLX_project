;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; software based self test for verifying the functionality of dlx processor ;;;;;;
;;;;; Author: Angione Francesco s262620@studenti.polito.it 						;;;;;;
;;;;; 																			;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; ALU verificiation ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; test -->add! sequential fashion
add r1,r2,r3
nop
nop
nop
nop
nop
;; test -->addi! and pipeline withot dependancies
add r1,r2,r3
add r1,r2,r3
addi r4,r5,4
nop
nop
nop
;; test -->and!
and r6,r4,r4 
;; test -->andi!
andi r7,r4,#256

;; test -->or!
or r8,r9,r10
;; test -->ori!
ori r8,r9,#10
;; test -->sub!
sub r11,r12,r13
;; test -->subi!
sub r11,r12,#13
;; test -->xor!
xor r14,r15,r16
;; test -->xori!
xor r14,r15,#11
;; test integer mul
imul r17,r18,r19

;; add loop of addition for checking the result of mult


sub ; subtract the two resuls
bne  ,equal
nop
equal:

;; test -->j!
j forward
nop
forward:
;; test -->beqz!
beqz r1,true1
false1:
true1:
;; test -->bnez!
bnez r1,true
false:
true:
;; test -->jal!
jal there
there:
;; test -->lw!
lw r5,0(r4)
;; test -->sge!
slei r1,r2,r5
;; test -->sgei!
slei r1,r2,#89
;; test -->sle!
slei r1,r2,r9
;; test -->slei!
slei r1,r2,#56
;; test -->sll!
sll r1,r2,r3
;; test -->slli!
sll r1,r2,#12
;; test -->sne!
snei r4 ,r5 ,r7
;; test -->snei!
snei r4 ,r5 ,#89
;; test -->srl!
srl r4,r5,r6
;; test -->srli!
srli r8,r9,#10
;; test -->sw!
;sw r4,60(r3)

end: j end ; infinite loop


