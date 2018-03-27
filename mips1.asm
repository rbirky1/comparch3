# Call a function based on an input number from 1...5
# If input == 1, call f1, if input == 2, call f2, etc.
.text
    .globl main
    main:
    #prompt for input
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $s0, $v0 
    subi $s0, $s0, 1 # array offset is in $s0 (not zero based)
    
    #Check input
    slt  $t0, $s0, $0
    sgt $t1, $s0, 4
    or $t0, $t0, $t1
    beqz $t0, validInput
    li $v0, 4
    la $a0, error
    syscall
    b callExit
    
    validInput:
    # Call the function at the correct array position by
	# calculating the array address, loading the value at
	# that address (which is the function pointer or address),
	# and doing a jalr to run the function and print the 
	# correct output.
	la $t1, funcArr 	# Load address of array
	mul $t2, $s0, 4 	# Calculate offset
	add $t1, $t1, $t2
	lw $t4, 0($t1)	# Load value at that address
	jalr $t4
	
    callExit:
    li $v0, 10
    syscall
 
 .data
     prompt: .asciiz "Enter a number from 1..5:  "
     error:  .asciiz "Number must be from 1...5"
     
     funcArr: 
         .word f1
         .word f2
         .word f3
         .word f4
         .word f5

.text
    .globl f1
    f1:  
      li $v0, 4
      la $a0, f1Output
      syscall
      jr $ra
.data
    f1Output: .asciiz "In f1"

.text
    .globl f2
    f2:  
      li $v0, 4
      la $a0, f2Output
      syscall
      jr $ra
.data
    f2Output: .asciiz "In f2"

.text
    .globl f3
    f3:  
      li $v0, 4
      la $a0, f3Output
      syscall
      jr $ra
.data
    f3Output: .asciiz "In f3"

.text
    .globl f4
    f4:  
      li $v0, 4
      la $a0, f4Output
      syscall
      jr $ra
.data
    f4Output: .asciiz "In f4"

.text
    .globl f5
    f5:  
      li $v0, 4
      la $a0, f5Output
      syscall
      jr $ra
.data
    f5Output: .asciiz "In f5"
