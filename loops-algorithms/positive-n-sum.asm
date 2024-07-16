.data

.text
.globl main

main:
    verif_loop:
        li $v0, 5
        syscall

        sle $t0, $zero, $v0
        beq $t0, $zero, verif_loop

    move $s0, $v0
    li $t0, 0
    li $t1, 1
    
    sum_loop:
        add $t0, $t0, $t1
        
        addi $t1, $t1, 1

        slt $t2, $s0, $t1
        beq $t2, $zero, sum_loop

    move $a0, $t0
    li $v0, 1
    syscall
