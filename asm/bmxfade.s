	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Tile Fading (for tile changes and such)

	THUMB_FUNC_START DoesBMXFADEExist
DoesBMXFADEExist: @ 0x0801DE18
	push {lr}
	ldr r0, _0801DE2C  @ gUnknown_0859ADC8
	bl Proc_Find
	cmp r0, #0
	beq _0801DE26
	movs r0, #1
_0801DE26:
	pop {r1}
	bx r1
	.align 2, 0
_0801DE2C: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END DoesBMXFADEExist

.align 2, 0 @ align with 0
