.data
is_positive: .asciiz "positive"
is_negative: .asciiz "negative"

.text
.globl main


main:
    li $v0, 5
    syscall

    if:
        slt $t0, $zero, $v0
        beq $t0, $zero, end_if
        
        la $a0, is_positive
        li $v0, 4
        syscall

        li $v0, 10
        syscall


    end_if:
        la $a0, is_negative
        li $v0, 4
        syscall
