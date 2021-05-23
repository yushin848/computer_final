.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:
    add s1, a0, x0
    add s2, a1, x0
    lw s3, 0(a0)
    li t0,0
    # Prologue


loop_start:
    beq t0, s2, loop_end
    slli s4 t0, 2
    add t1, s1, s4
    lw t2, 0(t1) 
    blt s3, t2, loop_continue
    addi t0, t0, 1 
    j loop_start






loop_continue:
    add s3, t2, x0
    add t3, t0, x0
    add a0, t3, x0
    j loop_start



loop_end:
    

    # Epilogue


    ret