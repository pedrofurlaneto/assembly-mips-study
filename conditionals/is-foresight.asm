.data
yes: .asciiz "yes"
no: .asciiz "no"

.text
.globl main

main:
    li $v0, 5
    syscall

    slti $t0, $v0, 65
    beq $t0, $zero, is_foresight

    add $s0, $zero, $v0

    li $v0, 5
    syscall

    slti $t0, $v0, 35
    beq $t0, $zero, is_foresight

    slti $t0, $s0, 60
    slti $t1, $v0, 30

    or $t2, $t0, $t1
    beq $t2, $zero, is_foresight

    la $a0, no
    li $v0, 4
    syscall

    li $v0, 10
    syscall

    is_foresight:
        la $a0, yes
        li $v0, 4
        syscall

        li $v0, 10
        syscall
