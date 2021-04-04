#Main file
main:
	addi $t0, $0, 0x0F # $t0 = 0x0F
	addi $t1, $0, 1    # $t1 = 1
	addi $t6, $0, 1    # Setting the Loop bit
	sll $t4, $t1, 4    # $t4 = $t1 << 4
fact:
	lw $t2, 0x0900($0) # read switches
	and $t3, $t2, $t0  # get input data n
	sw $t3, 0x0800($0) # write input data n
	sw $t1, 0x0804($0) # write control Go bit
	addi $s0, $0, 0    # dummy instruction to replace with iack
waiting:
	beq $t1, $t6, waiting
done:
	j fact
Factorial_Handler:     # The factorial handler will read the status bits, 
	lw $t5, 0x0808($0) # read status bits
	srl $t5, $t5, 1    # $t5 = $t5 >> 1
	and $t5, $t5, $t1  # get status Error bit
	and $t3, $t2, $t4  # get display Select
	or $t3, $t3, $t5   # combine Sel and Err
	lw $t5, 0x080C($0) # read result data nf
	sw $t3, 0x0908($0) # display Done and Err
	sw $t5, 0x090C($0) # display result nf
	addi $t6, $0, 0    # Setting this bit acknowledges the interrupt from the factorial 
	addi $s0, $0, 0    #dummy instruction to replace with rfe
Accelerator1_Handler:
	addi $t6, $0, 0    # Setting this bit acknowledges the interrupt from the factorial 
	addi $s0, $0, 0    #dummy instruction to replace with rfe
Accelerator2_Handler:
	addi $t6, $0, 0    # Setting this bit acknowledges the interrupt from the factorial 
	addi $s0, $0, 0    #dummy instruction to replace with rfe
Accelerator3_Handler:
	addi $t6, $0, 0    # Setting this bit acknowledges the interrupt from the factorial 
	addi $s0, $0, 0    #dummy instruction to replace with rfe

	
	

	
