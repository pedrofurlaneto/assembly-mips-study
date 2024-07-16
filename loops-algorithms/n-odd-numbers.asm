.data
space: .asciiz " "

.text
.globl main


main:
    li $s0, 2
    
    li $v0, 5
    syscall
    
    move $t0, $v0
    li $t1, 1
    li $t2, 0
    
    loop:
        div $t1, $s0
        mfhi $t3

        if_is_odd:
            beq $t3, $zero, else
            
            then:
                move $a0, $t1
                li $v0, 1
                syscall

                la $a0, space
                li $v0, 4
                syscall

                addi $t1, $t1, 1
                addi $t2, $t2, 1
        
                bne $t2, $t0, loop

                li $v0, 10
                syscall
        
            else:
                addi $t1, $t1, 1

                bne $t2, $t0, loop

                li $v0, 10
                syscall
