    .INCLUDE "macro.inc"
    .INCLUDE "gba.inc"
    .SYNTAX unified

.section .text.ArcTan2,"ax",%progbits
	THUMB_FUNC_START ArcTan2
ArcTan2: @ 0x080D166C
	swi #0xa
	bx lr

	THUMB_FUNC_END ArcTan2
    .align 2, 0

.section .text.DivRem,"ax",%progbits
	THUMB_FUNC_START DivRem
DivRem: @ 0x080D1684
	swi #6
	adds r0, r1, #0
	bx lr

	THUMB_FUNC_END DivRem
    .align 2, 0

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

.section .text.Sqrt,"ax",%progbits
	THUMB_FUNC_START Sqrt
Sqrt: @ 0x080D16D8
	swi #8
	bx lr

	THUMB_FUNC_END Sqrt
    .align 2, 0
