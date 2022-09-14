	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Tile Fading (for tile changes and such)

	THUMB_FUNC_START MakeNew6CBMXFADE2
MakeNew6CBMXFADE2: @ 0x0801DDF0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801DE14  @ gUnknown_0859ADC8
	bl Proc_StartBlocking
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801DE0E
	bl AddSkipThread2
_0801DE0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DE14: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END MakeNew6CBMXFADE2

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
