.data
space: .asciiz " "

.text
.globl main


main:
    li $v0, 5
    syscall
    
    move $t0, $v0
    
    loop:
        move $a0, $t0
        li $v0, 1
        syscall

        la $a0, space
        li $v0, 4
        syscall

        addi $t0, $t0, -1

        bne $t0, $zero, loop
