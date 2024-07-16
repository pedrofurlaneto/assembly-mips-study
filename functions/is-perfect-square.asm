.data

.text
.globl main

main:
    li $v0, 5
    syscall

    move $a0, $v0
    jal is_perfect_square
    
    move $a0, $v0
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall

.text
is_perfect_square:
    li $t0, 1

    loop:
        mult $t0, $t0
        mflo $t1

	bgt $t1, $a0, return_false

        beq $t1, $a0, return_true

        add $t0, $t0, 1

        j loop

    return_false:
        li $v0, 0
        jr $ra

    return_true:
        li $v0, 1
        jr $ra
