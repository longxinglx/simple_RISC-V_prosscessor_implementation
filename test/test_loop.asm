.text
# malloc 40Byte
addi sp, sp, -40
# t0 is i
addi t0, zero, 0
# t1 is loop length
addi t1, zero, 10

for_loop:
	# number to aicii
	addi t2, t0, 48
	sw t2, 0(sp)
	addi t0, t0, 1
	addi sp, sp, 4
	blt t0, t1, for_loop
	