.data
equilatero: .asciiz "equilateral"
isosceles: .asciiz "isosceles"
escaleno: .asciiz "scaleno"

.text
.globl main


main:
    li $v0, 5
    syscall
    add $s0, $zero, $v0
    
    li $v0, 5
    syscall
    add $s1, $zero, $v0
    
    li $v0, 5
    syscall

    if_equilatero:
        bne $s0, $s1, then_equilatero_1
        bne $s0, $v0, then_equilatero_2
        bne $s1, $v0, then_equilatero_2
        
        la $a0, equilatero
        li $v0, 4
        syscall

        li $v0, 10
        syscall

        then_equilatero_1:
            bne $s0, $v0, then_equilatero_2

            la $a0, isosceles
            li $v0, 4
            syscall

            li $v0, 10
            syscall
        
        then_equilatero_2:
            la $a0, escaleno
            li $v0, 4
            syscall

            li $v0, 10
            syscall

