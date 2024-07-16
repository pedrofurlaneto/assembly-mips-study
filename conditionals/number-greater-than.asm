.data
greater_number: .word 0

.text
.globl main


main:
    addi $s0, $zero, 0

    loop:
        beq $s0, 4, end_loop
        addi $s0, $s0, 1
        
        li $v0, 5
        syscall

        lw $t0, greater_number
        slt $t1, $t0, $v0
        beq $t1, $zero, loop 

        sw $v0, greater_number
        j loop

    end_loop:
        lw $a0, greater_number
        li $v0, 1
        syscall