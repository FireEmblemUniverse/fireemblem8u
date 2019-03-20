.syntax unified
.arm
Init:
	b crt0
	.include "asm/rom_header.inc"
	
.global crt0
crt0:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, IRQStackBottom
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, unk_3007E00
	ldr r1, =0x03007FFC
	adr r0, GlobalIRQHandler
	str r0, [r1]
	ldr r1, =0x08000A20+1
	mov lr, pc
	bx r1 @AgbMain
	b crt0
unk_3007E00: 
	.4byte gUnknown_03007E00 @ pool
IRQStackBottom: 
	.4byte gUnknown_03007FA0 @ pool

.global GlobalIRQHandler
GlobalIRQHandler:
	mov r3, #0x4000000
	add r3, r3, #0x200
	ldr r2, [r3]
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	mrs r0, spsr
	push {r0, r1, r3, lr}
	and r1, r2, r2, lsr #16
	ands r0, r1, #0x2000
	loop:
	bne loop
	mov r2, #0
	ands r0, r1, #1
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #2
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #4
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #8
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x10
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x20
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x40
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x80
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x100
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x200
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x400
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x800
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x1000
	bne foundInterrupt
	add r2, r2, #4
	ands r0, r1, #0x2000
	loop1:
	bne loop1
foundInterrupt:
	strh r0, [r3, #2]
	mrs r3, cpsr
	bic r3, r3, #0xdf
	orr r3, r3, #0x1f
	msr cpsr_fc, r3
	ldr r1, =0x030030F0
	add r1, r1, r2
	ldr r0, [r1]
	stmdb sp!, {lr}
	add lr, pc, #0
	bx r0
	.byte 0x00, 0x40, 0xBD, 0xE8, 0x00, 0x30, 0x0F, 0xE1
	.byte 0xDF, 0x30, 0xC3, 0xE3, 0x92, 0x30, 0x83, 0xE3, 0x03, 0xF0, 0x29, 0xE1, 0x0B, 0x40, 0xBD, 0xE8
	.byte 0xB0, 0x10, 0xC3, 0xE1, 0x00, 0xF0, 0x69, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1
.pool
