	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NextRN
NextRN: @ 0x08000B88
	push {r4, lr}
	ldr r3, _08000BC4  @ 0x03000000
	ldrh r2, [r3, #2]
	lsls r1, r2, #0xb
	ldrh r0, [r3]
	lsrs r0, r0, #5
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r3, #4]
	lsls r4, r0, #1
	strh r4, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08000BAE
	adds r0, r4, #1
	strh r0, [r3, #4]
_08000BAE:
	ldrh r0, [r3, #4]
	eors r1, r0
	ldrh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r3]
	strh r0, [r3, #2]
	strh r1, [r3]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08000BC4: .4byte 0x03000000

	THUMB_FUNC_START sub_8000BC8
sub_8000BC8: @ 0x08000BC8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _08000C2C  @ gUnknown_080D74F4
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	movs r4, #7
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r6, r0, #0
	ldr r1, _08000C30  @ 0x03000000
	ands r0, r4
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	adds r6, #1
	adds r0, r6, #0
	ands r0, r4
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r6, #1
	ands r6, r4
	lsls r0, r6, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #4]
	adds r0, r5, #0
	movs r1, #0x17
	bl __modsi3
	cmp r0, #0
	ble _08000C22
	adds r6, r0, #0
_08000C18:
	bl NextRN
	subs r6, #1
	cmp r6, #0
	bne _08000C18
_08000C22:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000C2C: .4byte gUnknown_080D74F4
_08000C30: .4byte 0x03000000

	THUMB_FUNC_START LoadRNState
LoadRNState: @ 0x08000C34
	ldr r2, _08000C48  @ 0x03000000
	ldrh r1, [r0]
	strh r1, [r2]
	adds r0, #2
	ldrh r1, [r0]
	strh r1, [r2, #2]
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	bx lr
	.align 2, 0
_08000C48: .4byte 0x03000000

	THUMB_FUNC_START StoreRNState
StoreRNState: @ 0x08000C4C
	ldr r2, _08000C60  @ 0x03000000
	ldrh r1, [r2]
	strh r1, [r0]
	adds r0, #2
	ldrh r1, [r2, #2]
	strh r1, [r0]
	ldrh r1, [r2, #4]
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_08000C60: .4byte 0x03000000

	THUMB_FUNC_START NextRN_100
NextRN_100: @ 0x08000C64
	push {lr}
	bl NextRN
	movs r1, #0x64
	muls r0, r1, r0
	cmp r0, #0
	bge _08000C76
	ldr r1, _08000C7C  @ 0x0000FFFF
	adds r0, r0, r1
_08000C76:
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08000C7C: .4byte 0x0000FFFF

	THUMB_FUNC_START NextRN_N
NextRN_N: @ 0x08000C80
	push {r4, lr}
	adds r4, r0, #0
	bl NextRN
	muls r0, r4, r0
	cmp r0, #0
	bge _08000C92
	ldr r1, _08000C9C  @ 0x0000FFFF
	adds r0, r0, r1
_08000C92:
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08000C9C: .4byte 0x0000FFFF

	THUMB_FUNC_START Roll1RN
Roll1RN: @ 0x08000CA0
	push {r4, lr}
	adds r4, r0, #0
	bl NextRN_100
	movs r1, #0
	cmp r4, r0
	ble _08000CB0
	movs r1, #1
_08000CB0:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Roll2RN
Roll2RN: @ 0x08000CB8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NextRN_100
	adds r4, r0, #0
	bl NextRN_100
	adds r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	movs r0, #0
	cmp r5, r4
	ble _08000CD6
	movs r0, #1
_08000CD6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START SetOtherRNState
SetOtherRNState: @ 0x08000CDC
	ldr r1, _08000CE4  @ 0x03000008
	str r0, [r1]
	bx lr
	.align 2, 0
_08000CE4: .4byte 0x03000008

	THUMB_FUNC_START GetOtherRN
GetOtherRN: @ 0x08000CE8
	ldr r1, _08000CFC  @ 0x03000008
	ldr r2, [r1]
	lsls r2, r2, #2
	adds r0, r2, #2
	adds r2, #3
	muls r0, r2, r0
	lsrs r0, r0, #2
	str r0, [r1]
	bx lr
	.align 2, 0
_08000CFC: .4byte 0x03000008
