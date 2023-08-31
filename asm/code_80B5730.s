	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80B92D0
sub_80B92D0: @ 0x080B92D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r7, _080B930C  @ gGMData
	ldrb r0, [r7, #0x11]
	cmp r0, r4
	bne _080B9356
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B9344
	lsls r0, r4, #5
	ldr r1, _080B9310  @ gWMNodeData
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B9344
	adds r0, r4, #0
	bl sub_80BCA1C
	cmp r0, #0
	blt _080B9314
	adds r0, r5, #0
	movs r1, #0x10
	b _080B934E
	.align 2, 0
_080B930C: .4byte gGMData
_080B9310: .4byte gWMNodeData
_080B9314:
	adds r0, r7, #0
	bl sub_80BD014
	adds r3, r0, #0
	ldr r2, _080B9340  @ gPlaySt
	ldrb r1, [r2, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080B9338
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080B9338
	cmp r3, #2
	beq _080B93D6
_080B9338:
	adds r0, r5, #0
	movs r1, #0x12
	b _080B934E
	.align 2, 0
_080B9340: .4byte gPlaySt
_080B9344:
	adds r0, r5, #0
	adds r0, #0x3e
	strb r4, [r0]
	adds r0, r5, #0
	movs r1, #0xe
_080B934E:
	bl Proc_Goto
_080B9352:
	movs r0, #1
	b _080B93D8
_080B9356:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	lsls r1, r4, #0x18
	asrs r6, r1, #0x18
	adds r1, r6, #0
	movs r2, #0
	bl sub_80BCCFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B938A
	bl sub_80BD29C
	adds r1, r0, #0
	cmp r1, #2
	bne _080B9384
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080B9344
_080B9384:
	adds r0, r5, #0
	movs r1, #6
	b _080B934E
_080B938A:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	adds r1, r6, #0
	movs r2, #1
	bl sub_80BCCFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B93D6
	bl sub_80BD29C
	adds r2, r0, #0
	cmp r2, #2
	bne _080B93CC
	lsls r0, r4, #5
	ldr r1, _080B93C8  @ gWMNodeData
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B93C0
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, #0
	bne _080B9344
_080B93C0:
	adds r0, r5, #0
	movs r1, #6
	b _080B934E
	.align 2, 0
_080B93C8: .4byte gWMNodeData
_080B93CC:
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b _080B9352
_080B93D6:
	movs r0, #0
_080B93D8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B92D0

	THUMB_FUNC_START sub_80B93E0
sub_80B93E0: @ 0x080B93E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080B9408  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B940C
	movs r0, #2
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	adds r6, r1, #0
	b _080B9414
	.align 2, 0
_080B9408: .4byte gKeyStatusPtr
_080B940C:
	movs r2, #4
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x2a
_080B9414:
	adds r5, r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080B9426
	subs r0, r1, #1
	strb r0, [r5]
	b _080B954A
_080B9426:
	bl sub_80BF294
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9432
	b _080B954A
_080B9432:
	ldr r0, _080B944C  @ gKeyStatusPtr
	ldr r3, [r0]
	ldrh r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080B9450
	movs r3, #0xf0
	ands r3, r2
	movs r0, #0xa
	strb r0, [r5]
	b _080B946E
	.align 2, 0
_080B944C: .4byte gKeyStatusPtr
_080B9450:
	ldrh r0, [r3, #8]
	movs r4, #0xf0
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _080B9468
	movs r0, #0xa
	strb r0, [r5]
	ldrh r0, [r3, #8]
	adds r3, r4, #0
	ands r3, r0
	b _080B946E
_080B9468:
	adds r3, r4, #0
	ands r3, r2
	strb r1, [r6]
_080B946E:
	cmp r3, #0
	beq _080B954A
	ldr r2, _080B94A8  @ gGMData
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080B947E
	adds r0, #0xf
_080B947E:
	lsls r0, r0, #0xc
	lsrs r1, r0, #0x10
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080B948C
	adds r0, #0xf
_080B948C:
	lsls r0, r0, #0xc
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	adds r4, r6, #0
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080B94AC
	lsls r0, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	b _080B94B8
	.align 2, 0
_080B94A8: .4byte gGMData
_080B94AC:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080B94BC
	lsls r0, r2, #0x10
	ldr r2, _080B94CC  @ 0xFFFF0000
_080B94B8:
	adds r0, r0, r2
	lsrs r2, r0, #0x10
_080B94BC:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080B94D0
	lsls r0, r4, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	b _080B94DC
	.align 2, 0
_080B94CC: .4byte 0xFFFF0000
_080B94D0:
	movs r0, #0x40
	ands r3, r0
	cmp r3, #0
	beq _080B94E0
	lsls r0, r4, #0x10
	ldr r3, _080B94EC  @ 0xFFFF0000
_080B94DC:
	adds r0, r0, r3
	lsrs r4, r0, #0x10
_080B94E0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bgt _080B94F0
	movs r2, #1
	b _080B94F6
	.align 2, 0
_080B94EC: .4byte 0xFFFF0000
_080B94F0:
	cmp r0, #0x1c
	ble _080B94F6
	movs r2, #0x1c
_080B94F6:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bgt _080B9502
	movs r4, #1
	b _080B9508
_080B9502:
	cmp r0, #0x12
	ble _080B9508
	movs r4, #0x12
_080B9508:
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	lsls r4, r4, #0x10
	cmp r1, r0
	bne _080B9518
	lsls r0, r6, #0x10
	cmp r0, r4
	beq _080B954A
_080B9518:
	ldr r0, _080B9558  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B952A
	movs r0, #0x65
	bl m4aSongNumStart
_080B952A:
	lsls r0, r5, #4
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r1, r4, #0xc
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp, #4]
	str r7, [sp]
	movs r0, #0
	add r1, sp, #4
	mov r2, r8
	movs r3, #0
	bl sub_80BF210
_080B954A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9558: .4byte gPlaySt

	THUMB_FUNC_END sub_80B93E0

.align 2, 0
