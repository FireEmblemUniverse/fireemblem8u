    .INCLUDE "macro.inc"
    .INCLUDE "gba.inc"
    .SYNTAX unified

.section .text.SoftReset,"ax",%progbits
	THUMB_FUNC_START SoftReset
SoftReset: @ 0x080D16B0
	ldr r3, =REG_IME
	movs r2, #0
	strb r2, [r3]
	ldr r1, =0x03007F00
	mov sp, r1
	swi #1
	swi #0
	.POOL

	THUMB_FUNC_END SoftReset
    .align 2, 0
