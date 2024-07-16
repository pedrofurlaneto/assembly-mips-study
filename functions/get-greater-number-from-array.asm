.data
array: .word 0:6

.text
.globl main


main:
    li $a0, 6
    jal set_array_numbers
    jal get_greater_number_from_array

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

.text
set_array_numbers:
    la $t0, array
    li $t1, 0

    set_loop:
        beq $t1, $a0, end_set_loop
        
        li $v0, 5
        syscall

        sll $t2, $t1, 2
        add $t2, $t2, $t0
        sw $v0, 0($t2)

        addi $t1, $t1, 1

        j set_loop

    end_set_loop:
        jr $ra

.text
get_greater_number_from_array:
    la $t0, array
    li $t1, 0
    li $v0, 0

    get_loop:
        beq $t1, $a0, end_get_loop

        sll $t2, $t1, 2
        add $t2, $t2, $t0
        lw $t3, 0($t2) 

        if_greater:
            blt $t3, $v0, else
            then:
                move $v0, $t3
                addi $t1, $t1, 1
                
                j get_loop
                
             else:
        	addi $t1, $t1, 1
        	j get_loop
        
    end_get_loop:
        jr $ra
