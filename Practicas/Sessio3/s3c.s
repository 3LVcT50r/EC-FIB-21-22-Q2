	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0
result:	.word 0

	.text 
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, mat
	jal suma_col
	la $t0, result
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra	

suma_col:
	li $t0, 0
	li $t1, 0
	move $t2, $a0
	addiu $t2, $t2, 8
for:	sltiu $t3, $t1, 4
	beq $t3, $zero, fi_for
	lw $t4, 0($t2)
	addu $t0, $t0, $t4
	addiu $t2, $t2, 24
	addiu $t1, $t1, 1
	b for
fi_for:	move $v0, $t0
	jr $ra



