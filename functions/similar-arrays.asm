.data
array_a: .word 0:4
array_b: .word 0:6
space: .asciiz " "

.text
.globl main

main:
    la $s0, array_a
    la $s1, array_b

    set_array_a:
        li $t0, 0

        loop_a:
            bge $t0, 4, set_array_b
            
            sll $t1, $t0, 2
            add $t1, $t1, $s0

            li $v0, 5
            syscall

            sw $v0, 0($t1)

            addi $t0, $t0, 1
            j loop_a

    set_array_b:
        li $t0, 0

        loop_b:
            bge $t0, 6, end_sets
            
            sll $t1, $t0, 2
            add $t1, $t1, $s1

            li $v0, 5
            syscall

            sw $v0, 0($t1)

            addi $t0, $t0, 1
            j loop_b

    end_sets:
        la $a0, array_a
        la $a1, array_b

        jal compare_arrays

        li $v0, 10
        syscall

.text
compare_arrays:
    move $s0, $a0
    move $s1, $a1

    array_a_for:
        li $t0, 0

        for_a:
            bge $t0, 4, end_compare 
            
            sll $t1, $t0, 2
            add $t1, $t1, $s0

            lw $t2, 0($t1)

            addi $t0, $t0, 1

            array_b_for:
                li $t3, 0
                
                for_b:
                    bge $t3, 6, for_a

                    sll $t4, $t3, 2
                    add $t4, $t4, $s1

                    lw $t5, 0($t4)
                    
                    addi $t3, $t3, 1
                    bne $t2, $t5, for_b

                    move $a0, $t5
                    li $v0, 1
                    syscall

                    la $a0, space
                    li $v0, 4
                    syscall

                    j for_b
                
    end_compare:
    	jr $ra

