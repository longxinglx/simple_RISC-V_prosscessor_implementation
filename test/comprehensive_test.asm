.macro NumberToAsciiAndSave(%r)
	# a0 store the number which will save to memory
	addi a0, %r, 48
	addi sp, sp, -4
	sw a0, 0(sp)
	# save Space
	addi a0, zero, 32
	addi sp, sp, -4
	sw a0, 0(sp)
.end_macro

.macro Newline
	addi a0, zero, 10, 
	addi sp, sp, -4
	sw a0, 0(sp)
.end_macro

.text
# malloc 1024Byte
addi sp, sp, -1024

j main

forwarding_test:
	addi t0, zero, 1
	addi t1, t0, 2
	addi t2, t0, 3
	# output 3
	NumberToAsciiAndSave(t1)
	# output 4
	NumberToAsciiAndSave(t2)
	
	addi t0, zero, 1
	addi t0, t0, 2
	addi t0, t0, 3
	# output 6
	NumberToAsciiAndSave(t0)

forwarding_test_return:
	Newline
	jr ra
	
	
load_use_hazards_test:
	addi t0, zero, 1
	addi sp, sp, -4
	sw t0, 0(sp)
	lw t0, 0(sp)
	addi t1, t0, 1
	# output 2
	NumberToAsciiAndSave(t1)

load_use_hazards_test_return:
	Newline
	jr ra
	

branch_hazards_test:
	# t0 is i
	addi t0, zero, 0
	# t1 is loop length
	addi t1, zero, 10

	# output 0 1 2 3 4 5 6 7 8 9
	for_loop:
		NumberToAsciiAndSave(t0)
		addi t0, t0, 1
		blt t0, t1, for_loop

	# output e
	addi t2, zero, 53
	NumberToAsciiAndSave(t2)
	
branch_hazards_test_return:
	Newline
	jr ra


main:
	
	jal ra, forwarding_test
	
	jal ra, load_use_hazards_test

	jal ra, branch_hazards_test
	

