# Phase 2
# Ekin Nalbantoglu - Kaan Akcay

	.data

X: .half 0xBBAA
A: .half 0xCCCC
B: .half 0xDDDD
C1: .half 0x1111

#K: .half 0x2301, 0x6745, 0xAB89, 0xEFCD, 0xDCFE, 0x98BA, 0x5476, 0x1032
#IV: .half 0x3412, 0x7856, 0xBC9A, 0xF0DE
#R: .space 16  # Allocate 16 bytes for 8 half-word elements
K:  .half  0x2301, 0x6745, 0xAB89, 0xEFCD, 0xDCFE, 0x98BA, 0x5476, 0x1032
IV:  .half  0x3412, 0x7856, 0xBC9A, 0xF0DE
R:  .half  0x8957, 0x112b, 0xed92, 0x2637, 0xe39e, 0x18c7, 0x96dc, 0x42fa
Plain:  .space 16
C:  .half  0x926a, 0xf9f8, 0x5bc5, 0xb575, 0x9707, 0x06a0, 0x3407, 0x33f2
T:  .space 16

Perm: .word 0,1,6,2,4,3,7,5	
inv_Perm: .word 1,5,0,3,2,4,6,7
LongTableInv_0: .byte 0xCA,0xC7,0xC6,0xC9,0xC1,0xC2,0xCC,0xC5,0xC3,0xC4,0xC8,0xCF,0xCD,0xCE,0xCB,0xC0,0x3A,0x37,0x36,0x39,0x31,0x32,0x3C,0x35,0x33,0x34,0x38,0x3F,0x3D,0x3E,0x3B,0x30,0x0A,0x07,0x06,0x09,0x01,0x02,0x0C,0x05,0x03,0x04,0x08,0x0F,0x0D,0x0E,0x0B,0x00,0xAA,0xA7,0xA6,0xA9,0xA1,0xA2,0xAC,0xA5,0xA3,0xA4,0xA8,0xAF,0xAD,0xAE,0xAB,0xA0,0xBA,0xB7,0xB6,0xB9,0xB1,0xB2,0xBC,0xB5,0xB3,0xB4,0xB8,0xBF,0xBD,0xBE,0xBB,0xB0,0x4A,0x47,0x46,0x49,0x41,0x42,0x4C,0x45,0x43,0x44,0x48,0x4F,0x4D,0x4E,0x4B,0x40,0x5A,0x57,0x56,0x59,0x51,0x52,0x5C,0x55,0x53,0x54,0x58,0x5F,0x5D,0x5E,0x5B,0x50,0xFA,0xF7,0xF6,0xF9,0xF1,0xF2,0xFC,0xF5,0xF3,0xF4,0xF8,0xFF,0xFD,0xFE,0xFB,0xF0,0x9A,0x97,0x96,0x99,0x91,0x92,0x9C,0x95,0x93,0x94,0x98,0x9F,0x9D,0x9E,0x9B,0x90,0xEA,0xE7,0xE6,0xE9,0xE1,0xE2,0xEC,0xE5,0xE3,0xE4,0xE8,0xEF,0xED,0xEE,0xEB,0xE0,0x6A,0x67,0x66,0x69,0x61,0x62,0x6C,0x65,0x63,0x64,0x68,0x6F,0x6D,0x6E,0x6B,0x60,0xDA,0xD7,0xD6,0xD9,0xD1,0xD2,0xDC,0xD5,0xD3,0xD4,0xD8,0xDF,0xDD,0xDE,0xDB,0xD0,0x2A,0x27,0x26,0x29,0x21,0x22,0x2C,0x25,0x23,0x24,0x28,0x2F,0x2D,0x2E,0x2B,0x20,0x7A,0x77,0x76,0x79,0x71,0x72,0x7C,0x75,0x73,0x74,0x78,0x7F,0x7D,0x7E,0x7B,0x70,0x8A,0x87,0x86,0x89,0x81,0x82,0x8C,0x85,0x83,0x84,0x88,0x8F,0x8D,0x8E,0x8B,0x80,0x1A,0x17,0x16,0x19,0x11,0x12,0x1C,0x15,0x13,0x14,0x18,0x1F,0x1D,0x1E,0x1B,0x10
LongTableInv_1: .byte 0x9B,0x95,0x94,0x9F,0x9C,0x96,0x99,0x90,0x9D,0x93,0x9E,0x98,0x91,0x9A,0x92,0x97,0x2B,0x25,0x24,0x2F,0x2C,0x26,0x29,0x20,0x2D,0x23,0x2E,0x28,0x21,0x2A,0x22,0x27,0xFB,0xF5,0xF4,0xFF,0xFC,0xF6,0xF9,0xF0,0xFD,0xF3,0xFE,0xF8,0xF1,0xFA,0xF2,0xF7,0x8B,0x85,0x84,0x8F,0x8C,0x86,0x89,0x80,0x8D,0x83,0x8E,0x88,0x81,0x8A,0x82,0x87,0x0B,0x05,0x04,0x0F,0x0C,0x06,0x09,0x00,0x0D,0x03,0x0E,0x08,0x01,0x0A,0x02,0x07,0xCB,0xC5,0xC4,0xCF,0xCC,0xC6,0xC9,0xC0,0xCD,0xC3,0xCE,0xC8,0xC1,0xCA,0xC2,0xC7,0x3B,0x35,0x34,0x3F,0x3C,0x36,0x39,0x30,0x3D,0x33,0x3E,0x38,0x31,0x3A,0x32,0x37,0x6B,0x65,0x64,0x6F,0x6C,0x66,0x69,0x60,0x6D,0x63,0x6E,0x68,0x61,0x6A,0x62,0x67,0x4B,0x45,0x44,0x4F,0x4C,0x46,0x49,0x40,0x4D,0x43,0x4E,0x48,0x41,0x4A,0x42,0x47,0xDB,0xD5,0xD4,0xDF,0xDC,0xD6,0xD9,0xD0,0xDD,0xD3,0xDE,0xD8,0xD1,0xDA,0xD2,0xD7,0x1B,0x15,0x14,0x1F,0x1C,0x16,0x19,0x10,0x1D,0x13,0x1E,0x18,0x11,0x1A,0x12,0x17,0xEB,0xE5,0xE4,0xEF,0xEC,0xE6,0xE9,0xE0,0xED,0xE3,0xEE,0xE8,0xE1,0xEA,0xE2,0xE7,0x7B,0x75,0x74,0x7F,0x7C,0x76,0x79,0x70,0x7D,0x73,0x7E,0x78,0x71,0x7A,0x72,0x77,0xBB,0xB5,0xB4,0xBF,0xBC,0xB6,0xB9,0xB0,0xBD,0xB3,0xBE,0xB8,0xB1,0xBA,0xB2,0xB7,0xAB,0xA5,0xA4,0xAF,0xAC,0xA6,0xA9,0xA0,0xAD,0xA3,0xAE,0xA8,0xA1,0xAA,0xA2,0xA7,0x5B,0x55,0x54,0x5F,0x5C,0x56,0x59,0x50,0x5D,0x53,0x5E,0x58,0x51,0x5A,0x52,0x57	
LongTable_0: .byte 0x2F,0x24,0x25,0x28,0x29,0x27,0x22,0x21,0x2A,0x23,0x20,0x2E,0x26,0x2C,0x2D,0x2B,0xFF,0xF4,0xF5,0xF8,0xF9,0xF7,0xF2,0xF1,0xFA,0xF3,0xF0,0xFE,0xF6,0xFC,0xFD,0xFB,0xCF,0xC4,0xC5,0xC8,0xC9,0xC7,0xC2,0xC1,0xCA,0xC3,0xC0,0xCE,0xC6,0xCC,0xCD,0xCB,0x1F,0x14,0x15,0x18,0x19,0x17,0x12,0x11,0x1A,0x13,0x10,0x1E,0x16,0x1C,0x1D,0x1B,0x5F,0x54,0x55,0x58,0x59,0x57,0x52,0x51,0x5A,0x53,0x50,0x5E,0x56,0x5C,0x5D,0x5B,0x6F,0x64,0x65,0x68,0x69,0x67,0x62,0x61,0x6A,0x63,0x60,0x6E,0x66,0x6C,0x6D,0x6B,0xAF,0xA4,0xA5,0xA8,0xA9,0xA7,0xA2,0xA1,0xAA,0xA3,0xA0,0xAE,0xA6,0xAC,0xAD,0xAB,0xDF,0xD4,0xD5,0xD8,0xD9,0xD7,0xD2,0xD1,0xDA,0xD3,0xD0,0xDE,0xD6,0xDC,0xDD,0xDB,0xEF,0xE4,0xE5,0xE8,0xE9,0xE7,0xE2,0xE1,0xEA,0xE3,0xE0,0xEE,0xE6,0xEC,0xED,0xEB,0x8F,0x84,0x85,0x88,0x89,0x87,0x82,0x81,0x8A,0x83,0x80,0x8E,0x86,0x8C,0x8D,0x8B,0x3F,0x34,0x35,0x38,0x39,0x37,0x32,0x31,0x3A,0x33,0x30,0x3E,0x36,0x3C,0x3D,0x3B,0x4F,0x44,0x45,0x48,0x49,0x47,0x42,0x41,0x4A,0x43,0x40,0x4E,0x46,0x4C,0x4D,0x4B,0x0F,0x04,0x05,0x08,0x09,0x07,0x02,0x01,0x0A,0x03,0x00,0x0E,0x06,0x0C,0x0D,0x0B,0xBF,0xB4,0xB5,0xB8,0xB9,0xB7,0xB2,0xB1,0xBA,0xB3,0xB0,0xBE,0xB6,0xBC,0xBD,0xBB,0x9F,0x94,0x95,0x98,0x99,0x97,0x92,0x91,0x9A,0x93,0x90,0x9E,0x96,0x9C,0x9D,0x9B,0x7F,0x74,0x75,0x78,0x79,0x77,0x72,0x71,0x7A,0x73,0x70,0x7E,0x76,0x7C,0x7D,0x7B    
LongTable_1: .byte 0x47,0x4C,0x4E,0x49,0x42,0x41,0x45,0x4F,0x4B,0x46,0x4D,0x40,0x44,0x48,0x4A,0x43,0xA7,0xAC,0xAE,0xA9,0xA2,0xA1,0xA5,0xAF,0xAB,0xA6,0xAD,0xA0,0xA4,0xA8,0xAA,0xA3,0x17,0x1C,0x1E,0x19,0x12,0x11,0x15,0x1F,0x1B,0x16,0x1D,0x10,0x14,0x18,0x1A,0x13,0x67,0x6C,0x6E,0x69,0x62,0x61,0x65,0x6F,0x6B,0x66,0x6D,0x60,0x64,0x68,0x6A,0x63,0x87,0x8C,0x8E,0x89,0x82,0x81,0x85,0x8F,0x8B,0x86,0x8D,0x80,0x84,0x88,0x8A,0x83,0xF7,0xFC,0xFE,0xF9,0xF2,0xF1,0xF5,0xFF,0xFB,0xF6,0xFD,0xF0,0xF4,0xF8,0xFA,0xF3,0x77,0x7C,0x7E,0x79,0x72,0x71,0x75,0x7F,0x7B,0x76,0x7D,0x70,0x74,0x78,0x7A,0x73,0xC7,0xCC,0xCE,0xC9,0xC2,0xC1,0xC5,0xCF,0xCB,0xC6,0xCD,0xC0,0xC4,0xC8,0xCA,0xC3,0x37,0x3C,0x3E,0x39,0x32,0x31,0x35,0x3F,0x3B,0x36,0x3D,0x30,0x34,0x38,0x3A,0x33,0x07,0x0C,0x0E,0x09,0x02,0x01,0x05,0x0F,0x0B,0x06,0x0D,0x00,0x04,0x08,0x0A,0x03,0xE7,0xEC,0xEE,0xE9,0xE2,0xE1,0xE5,0xEF,0xEB,0xE6,0xED,0xE0,0xE4,0xE8,0xEA,0xE3,0xD7,0xDC,0xDE,0xD9,0xD2,0xD1,0xD5,0xDF,0xDB,0xD6,0xDD,0xD0,0xD4,0xD8,0xDA,0xD3,0x57,0x5C,0x5E,0x59,0x52,0x51,0x55,0x5F,0x5B,0x56,0x5D,0x50,0x54,0x58,0x5A,0x53,0x97,0x9C,0x9E,0x99,0x92,0x91,0x95,0x9F,0x9B,0x96,0x9D,0x90,0x94,0x98,0x9A,0x93,0xB7,0xBC,0xBE,0xB9,0xB2,0xB1,0xB5,0xBF,0xBB,0xB6,0xBD,0xB0,0xB4,0xB8,0xBA,0xB3,0x27,0x2C,0x2E,0x29,0x22,0x21,0x25,0x2F,0x2B,0x26,0x2D,0x20,0x24,0x28,0x2A,0x23  


cr: .asciiz "\n"
input3: .byte 0xBB # D6 => 4F, B1 => 9C
    .text
main:
	# Your decryption function should return the plaintext P[8], given the ciphertext C[8].
	la $a0, C
	la $a1, Plain
	jal decrypt
	
   	lhu $t0, Plain
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+2
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+4
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+6
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+8
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+10
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+12
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    lhu $t0, Plain+14
    move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
    li $v0,4
    syscall
    # exit call
    li $v0,10
    syscall	
decrypt: # a0: address of the ciphertext 
		 # a1: address of the plaintext ( for writing )
		 
	addi $sp, $sp, -32
	sw $s0, 0($sp)   # used as "t0" in the algorithm 3
	sw $s1, 4($sp)   # used as "t1" in the algorithm 3
	sw $s2, 8($sp)   # used as "t2" in the algorithm 3
	
	sw $s3, 12($sp)
	li $s3, 0 # s3 is the loop index
	
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	move $s4, $a0  # s4 has the address of the ciphertext
	move $s5, $a1  # s5 has the address of the plaintext(currently empty)
	
	sw $s6, 24($sp) # s6 and s7 are used as a temporary regs
	sw $s7, 28($sp)
	move $s7, $ra
decrypt_loop:
	bge $s3, 16, end_decrypt_loop
	# line 1
	# W^-1, arg B computation:
	lhu $t0, K+14
	lhu $t1, R+14
	xor $a0, $t0, $t1
	jal L
	move $s6, $v0   # s6-lower has the B argument of W^-1
	
	# W^-1, arg A computation:
	lhu $t0, K+12
	lhu $t1, R+12
	xor $a0, $t0, $t1
	jal L
	sll $v0, $v0, 16
	add $s6, $s6, $v0   # s6-upper has the A argument of W^-1
	
	# W^-1, arg X computation:
	add $t0, $s4, $s3  # Calculate addr = base + offset(loop index in this case)
	lhu $t0, 0($t0)
	lhu $t1, R
	sub $t1, $0, $t1  # t1 = 0 - t1 => basically (-R)
	move $a0, $t0	# Getting ready for modSum jump
	move $a1, $t1
	jal modSum
	move $a0, $v0	# a0 has the X argument
	
	# Call W^-1
	srl $a1, $s6, 16   # dirty shift s6 to extract A argument
	andi $a2, $s6, 0xFFFF  # Extract lower s6 for B argument
	jal inv_W
	move $a0, $v0
	lhu $t0, R+6
	sub $a1, $0, $t0   # a1 = -R3
	jal modSum
	move $s2, $v0
	
	# line 2
	# W^-1, arg B computation:
	lhu $t0, K+10
	lhu $t1, R+10
	xor $a0, $t0, $t1
	jal L
	move $s6, $v0   # s6-lower has the B argument of W^-1
	
	# W^-1, arg A computation:
	lhu $t0, K+8
	lhu $t1, R+8
	xor $a0, $t0, $t1
	jal L
	sll $v0, $v0, 16
	add $s6, $s6, $v0   # s6-upper has the A argument of W^-1
	
	# W^-1, arg C computation:
	move $a0, $s2
	
	# Compute W^-1
	srl $a1, $s6, 16   # dirty shift s6 to extract A argument
	andi $a2, $s6, 0xFFFF  # Extract lower s6 for B argument
	jal inv_W
	move $a0, $v0
	lhu $t0, R+4
	sub $a1, $0, $t0   # a1 = -R3
	jal modSum
	move $s1, $v0
	
	# line 3 computation:
	# W^-1, arg B computation:
	lhu $t0, K+6
	lhu $t1, R+6
	xor $a0, $t0, $t1
	jal L
	move $s6, $v0   # s6-lower has the B argument of W^-1
	
	# W^-1, arg A computation:
	lhu $t0, K+4
	lhu $t1, R+4
	xor $a0, $t0, $t1
	jal L
	sll $v0, $v0, 16
	add $s6, $s6, $v0   # s6-upper has the A argument of W^-1
	
	# W^-1, arg C computation:
	move $a0, $s1
	
	# Compute W^-1
	srl $a1, $s6, 16   # dirty shift s6 to extract A argument
	andi $a2, $s6, 0xFFFF  # Extract lower s6 for B argument
	jal inv_W
	move $a0, $v0
	lhu $t0, R+2
	sub $a1, $0, $t0   # a1 = -R1
	jal modSum
	move $s0, $v0
	
	# line 4 computation:
	# W^-1, arg B computation:
	lhu $t0, K+2
	lhu $t1, R+2
	xor $a0, $t0, $t1
	jal L
	move $s6, $v0   # s6-lower has the B argument of W^-1
	
	# W^-1, arg A computation:
	lhu $t0, K
	lhu $t1, R
	xor $a0, $t0, $t1
	jal L
	sll $v0, $v0, 16
	add $s6, $s6, $v0   # s6-upper has the A argument of W^-1
	
	# W^-1, arg X computation:
	move $a0, $s0
	
	# Compute W^-1
	srl $a1, $s6, 16   # dirty shift s6 to extract A argument
	andi $a2, $s6, 0xFFFF  # Extract lower s6 for B argument
	jal inv_W
	move $a0, $v0
	lhu $t0, R
	sub $a1, $0, $t0   # a1 = -R3
	jal modSum
	add $t0, $s5, $s3  # Calculate addr = base + offset(loop index in this case)
	sh $v0, 0($t0)     # Store plaintext at the provided address
	
	# line 5-12:
	lhu $a0, R
	move $a1, $s2
	jal modSum
	sh $v0, T
	
	lhu $a0, R+2
	move $a1, $s0
	jal modSum
	sh $v0, T+2
	
	lhu $a0, R+4
	move $a1, $s1
	jal modSum
	sh $v0, T+4
	
	lhu $a0, R+6
	add $a0, $a0, $s2
	lhu $a1, R
	add $a1, $a1, $s0
	jal modSum
	sh $v0, T+6
	
	lhu $t0, R+8
	xor $t0, $t0, $v0
	sh $t0, T+8
	
	lhu $a0, R+2
	move $a1, $s0
	jal modSum
	lhu $t0, R+10
	xor $t0, $t0, $v0
	sh $t0, T+10
	
	lhu $a0, R+4
	move $a1, $s1
	jal modSum
	lhu $t0, R+12
	xor $t0, $t0, $v0
	sh $t0, T+12
	
	lhu $a0, R
	move $a1, $s2
	jal modSum
	lhu $t0, R+14
	xor $t0, $t0, $v0
	sh $t0, T+14
	
	lhu $t0, T
	sh $t0, R
	lhu $t0, T+2
	sh $t0, R+2
	lhu $t0, T+4
	sh $t0, R+4
	lhu $t0, T+6
	sh $t0, R+6
	lhu $t0, T+8
	sh $t0, R+8
	lhu $t0, T+10
	sh $t0, R+10
	lhu $t0, T+12
	sh $t0, R+12
	lhu $t0, T+14
	sh $t0, R+14
	
	# increment by 2(the index)    
	addi $s3, $s3, 2  # index is also the offset for both plaintext and ciphertext memory accesses
	j decrypt_loop
	
end_decrypt_loop:
	move $ra, $s7
	lw $s0, 0($sp)  
	lw $s1, 4($sp)   
	lw $s2, 8($sp)   
	lw $s3, 12($sp)	
	lw $s4, 16($sp)
	lw $s5, 20($sp)
	lw $s6, 24($sp)
	lw $s7, 28($sp)
	addi $sp, $sp, 32
	jr $ra
	
	
inv_W: # W^−1(X,A,B) = F^−1(F^−1(X) ⊕ B) ⊕ A
# a0 = X
# a1 = A
# a2 = B

	addi $sp, $sp, -12
	sw $ra, 8($sp)
	move $t1, $a1
	sw $t1, 4($sp)
	move $t2, $a2
	sw $t2, 0($sp)
	jal inv_F
	lw $t2, 0($sp)
	xor $a0, $v0, $t2
	jal inv_F
	lw $t1, 4($sp)
	xor $v0, $v0, $t1
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra
    
init_SV:	
	# Initialize R - first cycle, unrolled loop
	lhu $t6, IV
	sh $t6,  R
	sh $t6,  R+8
	lhu $t6, IV+2
	sh $t6,  R+2
	sh $t6,  R+10
	lhu $t6, IV+4
	sh $t6,  R+4
	sh $t6,  R+12
	lhu $t6, IV+6
	sh $t6,  R+6
	sh $t6,  R+14

	addi $sp, $sp, -4
	sw $s6, 0($sp)
	li $s6, 0              # Initialize loop index to 0
iter_loop:
    bgt $s6, 3, end_iter_loop  # Check if loop index exceeds 3, if so, jump to end_iter_loop
	
	lhu $a0,  R       # arg0 for mod sum0
	move $a1, $s6	   # arg1 for mod sum0
	jal modSum
	move $a0, $v0      # Immediately after modSum, call W, a0 is the 1st argument of W
	lhu $a1,  K+2      # put K1 to 2nd argument of W call
	lhu $a2,  K+6      # put K3 to 3rd argument of W call
	jal W
	move $t0, $v0      # line 5 of the algorithm is now completed
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	
	lhu $a0,  R+2       # arg0 for mod sum1
	move $a1, $t0	   # arg1 for mod sum1
	jal modSum
	move $a0, $v0      # Immediately after modSum, call W, a0 is the 1st argument of W
	lhu $a1,  K+10      # put K5 to 2nd argument of W call
	lhu $a2,  K+14      # put K7 to 3rd argument of W call
	jal W
	move $t1, $v0      # line 6 of the algorithm is now completed
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	
	lhu $a0,  R+4       # arg0 for mod sum2
	move $a1, $t1	   # arg1 for mod sum2
	jal modSum
	move $a0, $v0      # Immediately after modSum, call W, a0 is the 1st argument of W
	lhu $a1,  K      # put K0 to 2nd argument of W call
	lhu $a2,  K+4      # put K2 to 3rd argument of W call
	jal W
	move $t2, $v0      # line 7 of the algorithm is now completed
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	
	lhu $a0,  R+6       # arg0 for mod sum3	
	move $a1, $t2	   # arg1 for mod sum3
	jal modSum
	move $a0, $v0      # Immediately after modSum, call W, a0 is the 1st argument of W
	lhu $a1,  K+8      # put K4 to 2nd argument of W call
	lhu $a2,  K+12      # put K6 to 3rd argument of W call
	jal W
	move $t3, $v0      # line 8 of the algorithm is now completed	
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	
	# Lines 5,6,7,8 done 
	
	# line 9
	lhu $a0,  R  # Preparing for modSum
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	move $a1, $t3
	jal modSum
	
	rol $t4, $v0, 7   # Start circular rotate
	andi $t5, $t4, 0xFFFF0000 # t5 has the upper half of t4
	srl $t5, $t5, 16
	andi $t4, $t4, 0x0000FFFF # t4 has the lower half
	add $t4, $t4, $t5 # rotation completed
	sh $t4,  R
	
	# line 10
	lhu $a0,  R+2  # Preparing for modSum
	lw $t0, 8($sp)
	addi $sp, $sp, 4
	move $a1, $t0
	jal modSum
	
	ror $t4, $v0, 4   # Start circular rotate
	andi $t5, $t4, 0xFFFF0000 # t5 has the upper half of t4
	srl $t5, $t5, 16
	andi $t4, $t4, 0x0000FFFF # t4 has the lower half
	add $t4, $t4, $t5 # rotation completed
	sh $t4,  R+2
	
	# line 11
	lhu $a0,  R+4  # Preparing for modSum
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	move $a1, $t1
	jal modSum
	
	rol $t4, $v0, 2   # Start circular rotate
	andi $t5, $t4, 0xFFFF0000 # t5 has the upper half of t4
	srl $t5, $t5, 16
	andi $t4, $t4, 0x0000FFFF # t4 has the lower half
	add $t4, $t4, $t5 # rotation completed
	sh $t4,  R+4
	
	# line 12
	lhu $a0,  R+6  # Preparing for modSum
	lw $t2, -8($sp)
	addi $sp, $sp, 4
	move $a1, $t2
	jal modSum
	
	ror $t4, $v0, 9   # Start circular rotate
	andi $t5, $t4, 0xFFFF0000 # t5 has the upper half of t4
	srl $t5, $t5, 16
	andi $t4, $t4, 0x0000FFFF # t4 has the lower half
	add $t4, $t4, $t5 # rotation completed
	sh $t4,  R+6
	
	# Lines 9,10,11,12 are done
	
	# Line 13
	lhu $t4,  R+6 
	lhu $t5,  R+8
	xor $t4, $t4, $t5
	sh $t4,  R+8
	
	# Line 14
	lhu $t4,  R+10 
	lhu $t5,  R+2
	xor $t4, $t4, $t5
	sh $t4,  R+10
	
	# Line 15
	lhu $t4,  R+12 
	lhu $t5,  R+4
	xor $t4, $t4, $t5
	sh $t4,  R+12
	
	# Line 16
	lhu $t4,  R+14 
	lhu $t5,  R
	xor $t4, $t4, $t5
	sh $t4,  R+14
	
	# Lines 13,14,15,16 done
	
    addi $s6, $s6, 1        # Increment loop index
    j iter_loop             # Jump back to the start of the loop

end_iter_loop:
	
	# Deallocate s6
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	
	# Last loop at lines 18-20 is not required, R is already at its final form
	lhu $a0, R
	j print_R_vector


modSum: # v0 = (a0 + a1)%2^16
	add $t6, $a0, $a1
	andi $v0, $t6, 0xFFFF
	jr $ra
	
print_R_vector:
	lhu $t0,  R
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+2
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+4
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+6
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+8
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+10
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+12
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	lhu $t0,  R+14
	move $a0, $t0
    li $v0, 34  # System call code for print hex
    syscall
    la $a0,cr
	li $v0,4
	syscall
	# exit call
	li $v0,10
	syscall		
W:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	#lhu $t0, X    
	#lhu $t1, A
	move $t0, $a0
	move $t1, $a1
	xor $t0, $t0, $t1
	
	# Prepare for F function call for F(X ⊕ A)
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	sw $t0, 4($sp)
	move $a0, $t0
	jal F               # First Call
	
	
	#lhu $a0, B
	move $a0, $a2
	xor $a0, $a0, $v0
	
	
	
	jal F			   # Second Call
	
	
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	addi $sp, $sp, 8
	# End of F function calls
	
	#printing the result
    #move $a0, $v0
    #li $v0, 34  # System call code for print hex
    #syscall
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    # exit call
    #li $v0,10
    #syscall
	# W Function ENDS
	
F:
	#lhu $t0, input2
	addi $sp, $sp, -4
	sw $ra, 0($sp)
    move $t0, $a0
    li $t1, 0xFF     # Mask to isolate x2x3
    and $t1, $t0, $t1 # t1 has x2x3
    sll $t1, $t1, 8   # t1 is x2.x3.(8bits of 0), after P(x0.x1) is done, result will be summed to t1, that's why there is this 8 bits of space
    srl $t2, $t0, 8   # t2 is now x0x1
    
    # Prepare for P call on x0.x1 aka $t2
    addi $sp, $sp, -12
    sw $t0, 8($sp)
    sw $t1, 4($sp)
    sw $t2, 0($sp)
    move $a0, $t2
    jal P
    lw $t2, 0($sp)
    lw $t1, 4($sp)
    lw $t0, 8($sp)
    addi $sp, $sp, 12
    move $t2, $v0     # t2 has P(x0.x1)'s result
    # End of P call
    
    add $t1, $t1, $t2              #    t1 => x2.x3.0.0      (in hexadecimal)
    							      #    t2 =>  0. 0.P(x0.x1)    (in hexadecimal)
    								  #  +______________________ 
                                   #    t1 => x2.x3.P(x0.x1)
                                   
    # Prepare for the first S call on t1
    addi $sp, $sp, -12
    sw $t0, 8($sp)
    sw $t1, 4($sp)
    sw $t2, 0($sp)
    move $a0, $t1
    li $a1, 1
    jal S_large
    lw $t2, 0($sp)
    lw $t1, 4($sp)
    lw $t0, 8($sp)
    addi $sp, $sp, 12
    # End of first S call
    sll $t2, $v0, 8  	   # 2 calls will be made to the function and the ultimate result will be formed in $t7 by addition
    add $t0, $0, $t2        # 1st and 2nd hexadecimal digits of the result are completed with this
    
    
    # Prepare for the second S call on t1
    addi $sp, $sp, -12
    sw $t0, 8($sp)
    sw $t1, 4($sp)
    sw $t2, 0($sp)
    move $a0, $t1
    li $a1, 2
    jal S_large
    lw $t2, 0($sp)
    lw $t1, 4($sp)
    lw $t0, 8($sp)
    addi $sp, $sp, 12
    
    add $t0, $t0, $v0       # no shifting necessary, just add the returned value
	# End of S calls
	
	# Prepare for L call on t0
	addi $sp, $sp, -12
    sw $t0, 8($sp)
    sw $t1, 4($sp)
    sw $t2, 0($sp)
    move $a0, $t0
    jal L
    lw $t2, 0($sp)
    lw $t1, 4($sp)
    lw $t0, 8($sp)
    addi $sp, $sp, 12
    # End of L call
    
    #printing the result
    #move $a0, $v0
    #li $v0, 34  # System call code for print hex
    #syscall
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    # exit call
    #li $v0,10
    #syscall
	# F Function ENDS                            

inv_F:   # F(X) = Y
		#  Z = S^−1( L^−1(Y) )
		#  F^−1(Y) = P^−1( z2||z3 ) || z0 || z1                                

#X = 0xbbaa -> F(X) = 0xa9e8
#X = 0x1111 -> F(X) = 0x1516
	#move $t0, $a0
	addi $sp, $sp, -4
	sw $s5, 0($sp)
	move $s5, $ra
	#li $a0, 0x1516
	jal inv_L
	move $a0, $v0 # L^-1(Y) is stored at a0
	li $a1, 1
	jal inv_S_large
	sll $t0, $v0, 8
	addi $a1, $a1, 1
	jal inv_S_large
	add $t0, $t0, $v0
	andi $a0, $t0, 0xFF
	jal inv_P
	sll $a0, $v0, 8
	srl $t0, $t0, 8    # dirty shift
	add $a0, $a0, $t0
	#printing the result
    
    #li $v0, 34  # System call code for print hex
    #syscall
    move $ra, $s5
    lw $s5, 0($sp)
    addi $sp, $sp, 4
    
    move $v0, $a0
    jr $ra
    # exit call
    #li $v0,10
    #syscall
	# inv_F Function ENDS   


###

###
	
P:
	move $t1, $a0
	li $t2, 0     # loop index = 0
	li $t6, 1     # init mask value that will be doubled every iteration
	li $t5, 0     # init result reg
	li $t7, 7
loop_P:
	beq $t2, 8, end_loop_P
	and $t3, $t1, $t6   # Extract the i'th bit of the input
	srlv $t3, $t3, $t2  # Right shift the extracted bit until its at the LSB 
	mul $t4, $t2, 4     # Calculate the offset for upcoming lw
	lw $t4, Perm($t4)   
	sub $t4, $t7, $t4   # t4 now holds the index number the extracted value will be written  
	sllv $t4, $t3, $t4  # left shift the value until its at the correct final position
    add $t5, $t5, $t4   # (t5 is the result register in this case)
          
	mul $t6, $t6, 2     # adjust the mask for the next iteration
	addi $t2, $t2, 1    # i++
	j loop_P
end_loop_P:
	move $v0, $t5
	jr $ra	
	
inv_P:
	move $t1, $a0
	li $t2, 0     # loop index = 0
	li $t6, 1     # init mask value that will be doubled every iteration
	li $t5, 0     # init result reg
	li $t7, 7
inv_loop_P:
	beq $t2, 8, end_inv_loop_P
	and $t3, $t1, $t6   # Extract the i'th bit of the input
	srlv $t3, $t3, $t2  # Right shift the extracted bit until its at the LSB 
	mul $t4, $t2, 4     # Calculate the offset for upcoming lw
	lw $t4, inv_Perm($t4)   
	sub $t4, $t7, $t4   # t4 now holds the index number the extracted value will be written  
	sllv $t4, $t3, $t4  # left shift the value until its at the correct final position
    add $t5, $t5, $t4   # (t5 is the result register in this case)
          
	mul $t6, $t6, 2     # adjust the mask for the next iteration
	addi $t2, $t2, 1    # i++
	j inv_loop_P
end_inv_loop_P:
	move $v0, $t5
	jr $ra	
	
	

inv_S_large:
	andi $t1, $a1, 0x1     # if a1 = 2, t1 is 0 ; elseif a1=1, t1 is 1
	mul $t2, $t1, 8
	li $t3, 0xFF
	sllv $t3, $t3, $t2  # shift the mask into its place
	and $t3, $t3, $a0   # perform the extraction
	
	srlv $t2, $t3, $t2  # extracted part is now at the LSB position
	not $t3, $t1        # LSB of t3 = (t1==1) ? 0 : 1
	andi $t3, $t3, 0x1  # apply mask for the LSB extraction
	sll $t3, $t3, 8     # t3 is 256 if t3 is 1, else 0 
	add $t3, $t2, $t3   # calculate the offset
	lbu $t3, LongTableInv_0($t3)    # load the mapped value
	
	move $v0, $t3
	jr $ra

S_large:
	andi $t1, $a1, 0x1     # if a1 = 2, t1 is 0 ; elseif a1=1, t1 is 1
	mul $t2, $t1, 8
	li $t3, 0xFF
	sllv $t3, $t3, $t2  # shift the mask into its place
	and $t3, $t3, $a0   # perform the extraction
	
	srlv $t2, $t3, $t2  # extracted part is now at the LSB position
	not $t3, $t1        # LSB of t3 = (t1==1) ? 0 : 1
	andi $t3, $t3, 0x1  # apply mask for the LSB extraction
	sll $t3, $t3, 8     # t3 is 256 if t3 is 1, else 0 
	add $t3, $t2, $t3   # calculate the offset
	lbu $t3, LongTable_0($t3)    # load the mapped value
	
	move $v0, $t3
	jr $ra
    
 	
L: # a0: input
	move $t1, $a0
	rol $t3, $t1, 6
	andi $t2, $t3, 0xFFFF0000 # t2 has the upper half of t3
	srl $t2, $t2, 16
	andi $t3, $t3, 0x0000FFFF # t3 has the lower half
	add $t3, $t3, $t2 # rotation completed
	
	ror $t2, $t1, 6
	andi $t4, $t2, 0xFFFF0000 # t4 has the upper half of t2
	srl $t4, $t4, 16
	andi $t2, $t2, 0x0000FFFF # t2 has the lower half
	add $t2, $t4, $t2 # rotation completed
	
	xor $t2, $t2, $t3
	xor $t2, $t1, $t2
	move $v0, $t2
	jr $ra
	
inv_L:
	#Z = Y ⊕ (Y<<<10) ⊕ (Y>>>10)
	#Z ⊕ (Z<<<4) ⊕ (Z>>>4)
	
	move $t1, $a0
	rol $t3, $t1, 10
	andi $t2, $t3, 0xFFFF0000 # t2 has the upper half of t3
	srl $t2, $t2, 16
	andi $t3, $t3, 0x0000FFFF # t3 has the lower half
	add $t3, $t3, $t2 # rotation completed
	
	ror $t2, $t1, 10
	andi $t4, $t2, 0xFFFF0000 # t4 has the upper half of t2
	srl $t4, $t4, 16
	andi $t2, $t2, 0x0000FFFF # t2 has the lower half
	add $t2, $t4, $t2 # rotation completed
	
	xor $t2, $t2, $t3
	xor $t2, $t1, $t2
	move $t1, $t2
	#done 0.5
	
	rol $t3, $t1, 4
	andi $t2, $t3, 0xFFFF0000 # t2 has the upper half of t3
	srl $t2, $t2, 16
	andi $t3, $t3, 0x0000FFFF # t3 has the lower half
	add $t3, $t3, $t2 # rotation completed
	
	ror $t2, $t1, 4
	andi $t4, $t2, 0xFFFF0000 # t4 has the upper half of t2
	srl $t4, $t4, 16
	andi $t2, $t2, 0x0000FFFF # t2 has the lower half
	add $t2, $t4, $t2 # rotation completed
	
	xor $t2, $t2, $t3
	xor $t2, $t1, $t2
	move $v0, $t2
	jr $ra
	
