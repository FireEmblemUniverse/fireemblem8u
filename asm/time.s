	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8000D00
sub_8000D00: @ 0x08000D00
	ldr r1, _08000D08  @ 0x0300000C
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08000D08: .4byte 0x0300000C

	THUMB_FUNC_START sub_8000D0C
sub_8000D0C: @ 0x08000D0C
	ldr r1, _08000D14  @ 0x0300000C
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08000D14: .4byte 0x0300000C

	THUMB_FUNC_START sub_8000D18
sub_8000D18: @ 0x08000D18
	ldr r0, _08000D24  @ 0x0300000C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08000D24: .4byte 0x0300000C

	THUMB_FUNC_START sub_08000D28
sub_08000D28: @ 0x08000D28
	ldr r0, _08000D30  @ 0x03000014
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08000D30: .4byte 0x03000014

	THUMB_FUNC_START SetGlobalClock
SetGlobalClock: @ 0x08000D34
	ldr r1, _08000D3C  @ 0x03000014
	str r0, [r1]
	bx lr
	.align 2, 0
_08000D3C: .4byte 0x03000014

	THUMB_FUNC_START IncrementGlobalClock
IncrementGlobalClock: @ 0x08000D40
	push {lr}
	ldr r2, _08000D58  @ 0x03000014
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	ldr r1, _08000D5C  @ 0x0CDFE5FF
	cmp r0, r1
	bls _08000D54
	ldr r0, _08000D60  @ 0x0CBEF080
	str r0, [r2]
_08000D54:
	pop {r0}
	bx r0
	.align 2, 0
_08000D58: .4byte 0x03000014
_08000D5C: .4byte 0x0CDFE5FF
_08000D60: .4byte 0x0CBEF080

	THUMB_FUNC_START sub_8000D64
sub_8000D64: @ 0x08000D64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r5, r3, #0
	movs r1, #0x3c
	bl __udivsi3
	movs r1, #0x3c
	bl __umodsi3
	strh r0, [r5]
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __udivsi3
	movs r1, #0x3c
	bl __umodsi3
	strh r0, [r6]
	ldr r1, _08000DB4  @ 0x00034BC0
	adds r0, r4, #0
	bl __udivsi3
	mov r1, r8
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0x1e
	bl __udivsi3
	movs r1, #1
	ands r0, r1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08000DB4: .4byte 0x00034BC0
