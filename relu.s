.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array 
#	a1 is the # of elements in the array 
# Returns:
#	None
# ==============================================================================
relu:
   add t0 a0 x0 
   add t1 a1 x0
   li t2 0

loop_start:
	slli t3 t2 2 
	add t3 t3 t0 
	lw t4 0(t3)
	ble t4 x0 loop_continue
	addi t2 t2 1 
	beq t2 t1 loop_end
	j loop_start

loop_continue:
	sw x0 0(t3)
	addi t2 t2 1
	beq t2 t1 loop_end
	j loop_start
	
loop_end:


    # Epilogue

    
	ret

