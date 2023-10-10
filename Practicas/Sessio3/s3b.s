	# Sessio 3

	.data 
mat1: 	.space 120
mat4: 	.align 2
	.word 2, 3, 1, 2, 4, 3
col:	.word 2

	.text 
	.globl main
main:
	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	la $s0, mat1
	la $s1, mat4
	move $a0, $s1
	lw $a1, 8($s1)
	la $a2, col
	lw $a2, 0($a2)
	jal subr
	sw $v0, 108($s0)
	move $a0, $s1
	li $a1, 1
	li $a2, 1
	jal subr
	sw $v0, 0($s0)
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra


subr:
	li $t0, 12
	mult $t0, $a1
	mflo $t0
	addu $t0, $t0, $a0
	sll $t1, $a2, 2
	addu $t0, $t0, $t1
	la $t1, mat1
	li $t2, 24
	mult $t2, $a2
	mflo $t2
	addu $t1, $t1, $t2
	lw $t0, 0($t0)
	sw $t0, 20($t1)
	move $v0, $a1
	jr $ra