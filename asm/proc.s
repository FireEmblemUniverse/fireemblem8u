	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START Find6C_
Find6C_: @ 0x0800346C
	push {lr}
	adds r3, r0, #0
	cmp r1, #0
	bne _08003480
	ldr r1, _08003478  @ gUnknown_02024E68
	b _08003482
	.align 2, 0
_08003478: .4byte gUnknown_02024E68
_0800347C:
	adds r0, r1, #0
	b _08003498
_08003480:
	adds r1, #0x6c
_08003482:
	ldr r0, _0800349C  @ gUnknown_02026968
	cmp r1, r0
	bhs _08003496
	adds r2, r0, #0
_0800348A:
	ldr r0, [r1]
	cmp r0, r3
	beq _0800347C
	adds r1, #0x6c
	cmp r1, r2
	blo _0800348A
_08003496:
	movs r0, #0
_08003498:
	pop {r1}
	bx r1
	.align 2, 0
_0800349C: .4byte gUnknown_02026968

	THUMB_FUNC_START sub_80034A0
sub_80034A0: @ 0x080034A0
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	bne _080034B4
	ldr r2, _080034AC  @ gUnknown_02024E68
	b _080034B6
	.align 2, 0
_080034AC: .4byte gUnknown_02024E68
_080034B0:
	adds r0, r2, #0
	b _080034CC
_080034B4:
	adds r2, #0x6c
_080034B6:
	ldr r0, _080034D0  @ gUnknown_02026968
	cmp r2, r0
	bhs _080034CA
	adds r3, r0, #0
_080034BE:
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _080034B0
	adds r2, #0x6c
	cmp r2, r3
	blo _080034BE
_080034CA:
	movs r0, #0
_080034CC:
	pop {r1}
	bx r1
	.align 2, 0
_080034D0: .4byte gUnknown_02026968

	THUMB_FUNC_START sub_80034D4
sub_80034D4: @ 0x080034D4
	push {lr}
	movs r2, #0x40
	ldr r1, _080034F4  @ gUnknown_02024E68
	ldr r0, _080034F8  @ 0x00001A94
	adds r3, r1, r0
_080034DE:
	ldr r0, [r1]
	cmp r0, #0
	beq _080034E6
	subs r2, #1
_080034E6:
	adds r1, #0x6c
	cmp r1, r3
	ble _080034DE
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080034F4: .4byte gUnknown_02024E68
_080034F8: .4byte 0x00001A94

	THUMB_FUNC_START sub_80034FC
sub_80034FC: @ 0x080034FC
	push {r4, lr}
	adds r3, r0, #0
	ldr r2, _08003514  @ gUnknown_02024E68
	movs r1, #0
	movs r4, #0x3f
_08003506:
	cmp r3, #0
	bne _08003518
	ldr r0, [r2]
	cmp r0, #0
	beq _08003520
	b _0800351E
	.align 2, 0
_08003514: .4byte gUnknown_02024E68
_08003518:
	ldr r0, [r2]
	cmp r0, r3
	bne _08003520
_0800351E:
	adds r1, #1
_08003520:
	subs r4, #1
	adds r2, #0x6c
	cmp r4, #0
	bge _08003506
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8003530
sub_8003530: @ 0x08003530
	ldr r2, _0800353C  @ gUnknown_02024E68
	str r2, [r0]
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0800353C: .4byte gUnknown_02024E68

	THUMB_FUNC_START sub_8003540
sub_8003540: @ 0x08003540
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r0, [r3, #8]
	cmp r0, #0x3f
	bgt _08003570
	ldr r5, [r3, #4]
_0800354E:
	ldr r1, [r3]
	ldr r0, [r1]
	cmp r0, r5
	bne _08003558
	adds r4, r1, #0
_08003558:
	ldr r0, [r3, #8]
	adds r2, r0, #1
	str r2, [r3, #8]
	adds r0, r1, #0
	adds r0, #0x6c
	str r0, [r3]
	cmp r4, #0
	beq _0800356C
	adds r0, r4, #0
	b _08003572
_0800356C:
	cmp r2, #0x3f
	ble _0800354E
_08003570:
	movs r0, #0
_08003572:
	pop {r4, r5}
	pop {r1}
	bx r1
