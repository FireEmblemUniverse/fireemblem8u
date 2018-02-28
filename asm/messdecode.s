	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START FilterSomeTextFromStandardBuffer
FilterSomeTextFromStandardBuffer: @ 0x0800A3B8
	push {r4, r5, lr}
	ldr r5, _0800A3D0  @ gUnknown_0202B4AC
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _0800A3D4  @ 0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl CopyString
	b _0800A416
	.align 2, 0
_0800A3D0: .4byte gUnknown_0202B4AC
_0800A3D4: .4byte 0xFFFFF200
_0800A3D8:
	adds r1, r0, #0
	cmp r1, #0x1f
	bls _0800A3F0
	cmp r1, #0x80
	bne _0800A3F0
	adds r5, #1
	ldrb r0, [r5]
	cmp r0, #0x20
	beq _0800A3F8
	strb r1, [r4]
	adds r4, #1
	ldrb r0, [r5]
_0800A3F0:
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	b _0800A416
_0800A3F8:
	bl GetTacticianNameStringPtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0800A414
_0800A40C:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800A40C
_0800A414:
	adds r5, r1, #0
_0800A416:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A3D8
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800A428  @ gUnknown_0202B5AC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800A428: .4byte gUnknown_0202B5AC
