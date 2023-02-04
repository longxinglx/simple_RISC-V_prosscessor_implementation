.text
addi t1, zero, 1
addi t2, zero, 3

for_loop:
	addi t1, t1, 1
	addi zero, zero, 0
	blt t1, t2, for_loop
	
for_loop_return:
addi t4, zero, 15

addi zero, zero, 0
