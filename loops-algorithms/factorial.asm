.data

.text
.globl main


main:
    li $v0, 5
    syscall

    move $s0, $v0
    li $t0, 1

    factorial_loop:
        beq $v0, $t0, end_loop

        mul $s0, $s0, $t0
        
        addi $t0, $t0, 1

        j factorial_loop

    end_loop:
        move $a0, $s0
        li $v0, 1
        syscall