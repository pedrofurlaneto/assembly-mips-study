.text
.globl main

.data
array: .word 0:10
lenght: .word 0

main:
    li $v0, 5
    syscall
    sw $v0, lenght

    lw $a0, lenght
    jal set_array_values

    li $v0, 10
    syscall


.data
.text
.set_array_values:
    la $t1, array

    addi $t0, $zero, 0

    loop:
        li $v0, 5
        syscall

        sll $t2, $t1, 2
        
        add $t2, $t2, $t1
        sw $v0, 0($t2)
        
        addi $t0, $t0, 1
        bne $t0, $a0, loop
    end_loop:

    jr $ra


.data
.text
.sort_array:
    la $t1, 0

    li $t0, 1

    sort_loop:
        li $t1, 0

        sort_loop2:
            sll $t2, $t1, 2
            add $t2, $t2, $v0
            
            lw $s1, 0($t2)
            lw $s1, 4($t2)

            slt $t3, $s1, $s0
            if: beq $t3, $zero, end_id

        end_sort_loop2:
    
    end_sort_loop2:

    jr $ra
