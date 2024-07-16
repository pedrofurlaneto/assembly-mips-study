.data

.text
.globl main


main:
    li $v0, 5
    syscall

    move $a0, $v0

    li $v0, 5
    syscall

    move $a1, $v0

    jal sum_interval

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

sum_interval:
    li $v0, 0
    move $t0, $a0

    loop:
        bgt $t0, $a1, end_loop

        add $v0, $v0, $t0

        addi $t0, $t0, 1

        j loop

    end_loop:
        jr $ra

