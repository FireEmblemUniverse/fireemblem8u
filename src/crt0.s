.syntax unified
.arm

.include "gba.inc"

.global crt0
crt0:
	@ Switch to IRQ Mode
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, ___sp_irq

	@ Switch to System Mode
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, ___sp_usr

	@ Setup IRQ
	ldr r1, =INTR_VECTOR
	adr r0, IrqMain
	str r0, [r1]

	@ Jump to main
	ldr r1, =AgbMain
	mov lr, pc
	bx r1
	b crt0

___sp_usr:	.word __sp_usr
___sp_irq:	.word __sp_irq

.global IrqMain
IrqMain:
	@ Reserve IE & spsr
	mov r3, REG_BASE
	add r3, r3, REG_OFFSET_IE
	ldr r2, [r3]
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	mrs r0, spsr
	push {r0, r1, r3, lr}

irq_search:
	and r1, r2, r2, lsr #16
	ands r0, r1, INTR_FLAG_GAMEPAK

@ when the cart is removed from the GBA.
panic_gamepak:
	bne panic_gamepak

	mov r2, #0
	ands r0, r1, INTR_FLAG_VBLANK
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_HBLANK
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_VCOUNT
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_TIMER0
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_TIMER1
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_TIMER2
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_TIMER3
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_SERIAL
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_DMA0
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_DMA1
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_DMA2
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_DMA3
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_KEYPAD
	bne handle_normal_irq
	add r2, r2, #4
	ands r0, r1, INTR_FLAG_GAMEPAK

@ when the cart is removed from the GBA.
panic_gamepak2:
	bne panic_gamepak2

handle_normal_irq:
	strh r0, [r3, #2]

	@ Switch to System Mode
	mrs r3, cpsr
	bic r3, r3, #0xdf
	orr r3, r3, #0x1f
	msr cpsr_fc, r3

	@ jump to irq-handler
	ldr r1, =gIRQHandlers
	add r1, r1, r2
	ldr r0, [r1]
	stmdb sp!, {lr}
	add lr, pc, #0	@ post_irq
	bx r0
post_irq:
	ldmia sp!, {lr}

	@ Reset to IRQ Mode, also disable irq interrupt
	mrs r3, cpsr_fc
	bic r3, r3, 0xDF
	orr r3, r3, 0x92
	msr cpsr_fc, r3

	@ Restore original spsr & IE
	pop {r0, r1, r3, lr}
	strh r1, [r3]
	msr spsr_fc, r0
	bx lr
