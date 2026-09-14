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
	@ REL addend accounts for the ARM PC bias across the C section.
	ldr r1, [pc, #-8]
	.reloc .-4, R_ARM_LDR_PC_G0, .LIntrVector
	@ Cross-section ADR; the REL immediate includes the ARM PC bias.
	sub r0, pc, #8
	.reloc .-4, R_ARM_ALU_PC_G0_NC, IrqMain
	str r0, [r1]

	@ Jump to main
	@ REL addend accounts for the ARM PC bias across the C section.
	ldr r1, [pc, #-8]
	.reloc .-4, R_ARM_LDR_PC_G0, .LMain
	mov lr, pc
	bx r1
	b crt0

___sp_usr:	.word __sp_usr
___sp_irq:	.word __sp_irq

.section .text.irq_save_frame,"ax",%progbits
.global IrqSaveFrame
IrqSaveFrame:
	mrs r0, spsr
	push {r0, r1, r3, lr}

.section .rodata.irq_startup_pointers,"a",%progbits
.LIntrVector: .word INTR_VECTOR
.LMain: .word AgbMain
