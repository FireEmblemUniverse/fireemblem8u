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

	THUMB_FUNC_START sub_80B955C
sub_80B955C: @ 0x080B955C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0
	b _080B9566
_080B9564:
	adds r5, #1
_080B9566:
	cmp r5, #0x1c
	bgt _080B9574
	adds r0, r5, #0
	bl sub_80BBA4C
	cmp r0, r4
	bne _080B9564
_080B9574:
	movs r4, #1
	ldr r6, _080B959C  @ gGMData
_080B9578:
	adds r0, r5, r4
	cmp r0, #0x1c
	ble _080B9580
	subs r0, #0x1d
_080B9580:
	bl sub_80BBA4C
	adds r2, r0, #0
	lsls r0, r2, #2
	adds r0, r0, r6
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B95A0
	adds r0, r2, #0
	b _080B95AA
	.align 2, 0
_080B959C: .4byte gGMData
_080B95A0:
	adds r4, #1
	cmp r4, #0x1c
	ble _080B9578
	movs r0, #1
	negs r0, r0
_080B95AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B955C

	THUMB_FUNC_START sub_80B95B0
sub_80B95B0: @ 0x080B95B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080B9614  @ gGMData
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r8, r1
	ldr r0, [r0, #0xc]
	asrs r7, r0, #8
	movs r5, #0xf0
	lsls r5, r5, #7
	movs r6, #0
	movs r4, #0
_080B95CC:
	ldr r1, _080B9614  @ gGMData
	lsls r0, r4, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B9600
	lsls r1, r4, #5
	ldr r0, _080B9618  @ gWMNodeData
	adds r1, r1, r0
	movs r0, #0x18
	ldrsh r2, [r1, r0]
	movs r0, #0x1a
	ldrsh r3, [r1, r0]
	movs r0, #5
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	bl sub_80C0834
	cmp r0, r5
	bge _080B9600
	adds r6, r4, #0
	adds r5, r0, #0
_080B9600:
	adds r4, #1
	cmp r4, #0x1c
	ble _080B95CC
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B9614: .4byte gGMData
_080B9618: .4byte gWMNodeData

	THUMB_FUNC_END sub_80B95B0

	THUMB_FUNC_START sub_80B961C
sub_80B961C: @ 0x080B961C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	add r2, sp, #8
	lsls r1, r1, #5
	ldr r0, _080B96D0  @ gWMNodeData
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x1a]
	strh r0, [r2]
	ldr r7, _080B96D4  @ gGMData
	add r0, sp, #8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r7, #8]
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r7, #0xc]
	add r0, sp, #8
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r3, #0
	ldrsh r1, [r2, r3]
	add r5, sp, #0xc
	mov r6, sp
	adds r6, #0xe
	adds r2, r5, #0
	adds r3, r6, #0
	bl GetWMCenteredCameraPosition
	add r2, sp, #0x10
	ldrh r0, [r7, #2]
	strh r0, [r2]
	mov r1, sp
	adds r1, #0x12
	ldrh r0, [r7, #4]
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	movs r4, #4
	str r4, [sp]
	bl sub_80C0834
	cmp r0, #0
	bge _080B9692
	ldr r1, _080B96D8  @ 0x000001FF
	adds r0, r0, r1
_080B9692:
	asrs r0, r0, #9
	adds r0, #6
	cmp r0, #0xa
	ble _080B969C
	movs r0, #0xa
_080B969C:
	movs r1, #1
	negs r1, r1
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	adds r0, r1, #0
	bl sub_80BF404
	strb r4, [r7, #1]
	mov r0, r8
	movs r1, #8
	bl Proc_Goto
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B96D0: .4byte gWMNodeData
_080B96D4: .4byte gGMData
_080B96D8: .4byte 0x000001FF

	THUMB_FUNC_END sub_80B961C

	THUMB_FUNC_START sub_80B96DC
sub_80B96DC: @ 0x080B96DC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80BF3F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B96F0
	adds r0, r4, #0
	bl Proc_Break
_080B96F0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B96DC

	THUMB_FUNC_START sub_80B96F8
sub_80B96F8: @ 0x080B96F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080B9728  @ gGMData
	ldr r5, [r2, #8]
	ldr r6, [r2, #0xc]
	ldr r0, _080B972C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080B9736
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080B9730
	movs r0, #5
	negs r0, r0
	ands r0, r1
	b _080B9734
	.align 2, 0
_080B9728: .4byte gGMData
_080B972C: .4byte gKeyStatusPtr
_080B9730:
	movs r0, #4
	orrs r0, r1
_080B9734:
	strb r0, [r2]
_080B9736:
	ldr r0, [r4, #0x48]
	asrs r1, r5, #8
	asrs r2, r6, #8
	movs r3, #0
	str r3, [sp]
	bl sub_80BB628
	adds r1, r0, #0
	cmp r1, #0
	blt _080B9798
	ldr r0, _080B9778  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B9780
	adds r0, r4, #0
	bl sub_80B92D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B97BC
	ldr r0, _080B977C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B97EA
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080B97EA
	.align 2, 0
_080B9778: .4byte gKeyStatusPtr
_080B977C: .4byte gPlaySt
_080B9780:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080B97BC
	adds r0, r4, #0
	bl sub_80B955C
	adds r1, r0, #0
	cmp r1, #0
	blt _080B97BC
	b _080B97AE
_080B9798:
	ldr r0, _080B97B8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B97BC
	bl sub_80B95B0
	adds r1, r0, #0
_080B97AE:
	adds r0, r4, #0
	bl sub_80B961C
	b _080B97EA
	.align 2, 0
_080B97B8: .4byte gKeyStatusPtr
_080B97BC:
	ldr r0, _080B97D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B97D8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080B97EA
	.align 2, 0
_080B97D4: .4byte gKeyStatusPtr
_080B97D8:
	adds r0, r4, #0
	bl sub_80B93E0
	ldr r0, _080B97F4  @ gGMData
	str r5, [r0, #8]
	str r6, [r0, #0xc]
	adds r0, r4, #0
	bl sub_80B9218
_080B97EA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B97F4: .4byte gGMData

	THUMB_FUNC_END sub_80B96F8

	THUMB_FUNC_START sub_80B97F8
sub_80B97F8: @ 0x080B97F8
	ldr r1, _080B9800  @ gGMData
	movs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_080B9800: .4byte gGMData

	THUMB_FUNC_END sub_80B97F8

	THUMB_FUNC_START sub_80B9804
sub_80B9804: @ 0x080B9804
	push {lr}
	bl sub_80B96F8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9804

	THUMB_FUNC_START sub_80B9810
sub_80B9810: @ 0x080B9810
	push {lr}
	bl sub_80C1D70
	movs r0, #8
	bl Proc_EndEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9810

	THUMB_FUNC_START sub_80B9820
sub_80B9820: @ 0x080B9820
	push {lr}
	bl sub_8092194
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9820

	THUMB_FUNC_START sub_80B982C
sub_80B982C: @ 0x080B982C
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_SetGfxNeedsUpdate
	ldr r2, _080B9878  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9878: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B982C

	THUMB_FUNC_START sub_80B987C
sub_80B987C: @ 0x080B987C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080B9898  @ ProcScr_E_Guide2
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B9898: .4byte ProcScr_E_Guide2

	THUMB_FUNC_END sub_80B987C

	THUMB_FUNC_START sub_80B989C
sub_80B989C: @ 0x080B989C
	push {lr}
	movs r0, #8
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B989C

	THUMB_FUNC_START sub_80B98A8
sub_80B98A8: @ 0x080B98A8
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_SetGfxNeedsUpdate
	ldr r2, _080B98F4  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B98F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B98A8

	THUMB_FUNC_START sub_80B98F8
sub_80B98F8: @ 0x080B98F8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080B9914  @ gProcScr_Config3
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B9914: .4byte gProcScr_Config3

	THUMB_FUNC_END sub_80B98F8

	THUMB_FUNC_START sub_80B9918
sub_80B9918: @ 0x080B9918
	push {lr}
	movs r0, #8
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9918

	THUMB_FUNC_START sub_80B9924
sub_80B9924: @ 0x080B9924
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_SetGfxNeedsUpdate
	ldr r2, _080B9970  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9970: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B9924

	THUMB_FUNC_START sub_80B9974
sub_80B9974: @ 0x080B9974
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080B9990  @ gUnknown_08A3E8B8
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B9990: .4byte gUnknown_08A3E8B8

	THUMB_FUNC_END sub_80B9974

	THUMB_FUNC_START sub_80B9994
sub_80B9994: @ 0x080B9994
	push {lr}
	movs r0, #8
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9994

	THUMB_FUNC_START sub_80B99A0
sub_80B99A0: @ 0x080B99A0
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_SetGfxNeedsUpdate
	ldr r2, _080B99EC  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B99EC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B99A0

	THUMB_FUNC_START sub_80B99F0
sub_80B99F0: @ 0x080B99F0
	ldr r2, _080B9A0C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B9A0C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B99F0

	THUMB_FUNC_START WorldMap_HideEverything
WorldMap_HideEverything: @ 0x080B9A10
	ldr r2, _080B9A30  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B9A30: .4byte gLCDControlBuffer

	THUMB_FUNC_END WorldMap_HideEverything

	THUMB_FUNC_START sub_80B9A34
sub_80B9A34: @ 0x080B9A34
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B9A52
	movs r0, #0x45
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0x2c]
	movs r0, #4
	movs r1, #0
	bl NewFadeIn
_080B9A52:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9A34

	THUMB_FUNC_START sub_80B9A58
sub_80B9A58: @ 0x080B9A58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	movs r1, #0
	movs r2, #0
	bl MapMU_80BE108
	ldr r4, _080B9A8C  @ gGMData
	ldrb r0, [r4, #0x11]
	bl WMLoc_GetChapterId
	ldr r1, _080B9A90  @ gPlaySt
	movs r2, #0
	strb r0, [r1, #0xe]
	strb r2, [r4, #1]
	ldrb r0, [r4, #0x11]
	bl sub_80BCA1C
	adds r1, r0, #0
	movs r0, #0
	adds r2, r5, #0
	bl sub_80C07D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9A8C: .4byte gGMData
_080B9A90: .4byte gPlaySt

	THUMB_FUNC_END sub_80B9A58

	THUMB_FUNC_START sub_80B9A94
sub_80B9A94: @ 0x080B9A94
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C081C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9AA8
	adds r0, r4, #0
	bl Proc_Break
_080B9AA8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9A94

	THUMB_FUNC_START sub_80B9AB0
sub_80B9AB0: @ 0x080B9AB0
	push {lr}
	movs r0, #4
	bl Sound_FadeOutBGM
	ldr r2, _080B9AE8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	pop {r0}
	bx r0
	.align 2, 0
_080B9AE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B9AB0

	THUMB_FUNC_START sub_80B9AEC
sub_80B9AEC: @ 0x080B9AEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r4, #4
	ldr r6, _080B9B34  @ gGMData
	movs r0, #0xcc
	adds r0, r0, r6
	mov r8, r0
	adds r5, r6, #0
	adds r5, #0x10
_080B9B02:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080B9B20
	ldrb r0, [r6, #0x11]
	ldrb r1, [r5, #0x11]
	cmp r0, r1
	bne _080B9B20
	subs r0, r4, #4
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r7, #0x54]
	adds r1, r4, #0
	bl MapMU_RemoveUnit
_080B9B20:
	adds r5, #4
	adds r4, #1
	cmp r4, #6
	ble _080B9B02
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B34: .4byte gGMData

	THUMB_FUNC_END sub_80B9AEC

	THUMB_FUNC_START WorldMap_InitChapterTransition
WorldMap_InitChapterTransition: @ 0x080B9B38
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	movs r2, #0
	bl MapMU_80BE108
	ldr r5, _080B9B70  @ gGMData
	ldrb r2, [r5, #0x11]
	lsls r0, r2, #5
	ldr r1, _080B9B74  @ gWMNodeData
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B9B7C
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	bl WMLoc_GetChapterId
	ldr r1, _080B9B78  @ gPlaySt
	strb r0, [r1, #0xe]
	ldrb r1, [r5]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	b _080B9B86
	.align 2, 0
_080B9B70: .4byte gGMData
_080B9B74: .4byte gWMNodeData
_080B9B78: .4byte gPlaySt
_080B9B7C:
	adds r0, r2, #0
	bl WMLoc_GetChapterId
	ldr r1, _080B9B9C  @ gPlaySt
	strb r0, [r1, #0xe]
_080B9B86:
	adds r0, r4, #0
	bl CallChapterWMIntroEvents
	ldr r1, _080B9BA0  @ gGMData
	movs r0, #0
	strb r0, [r1, #1]
	bl sub_80C1AB0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B9C: .4byte gPlaySt
_080B9BA0: .4byte gGMData

	THUMB_FUNC_END WorldMap_InitChapterTransition

	THUMB_FUNC_START sub_80B9BA4
sub_80B9BA4: @ 0x080B9BA4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl EventEngineExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9CA4
	ldr r0, [r6, #0x44]
	ldr r0, [r0, #0x4c]
	bl MapRoute_80BC2DC
	ldr r0, _080B9C04  @ gGMData
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080B9C08
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	b _080B9C26
	.align 2, 0
_080B9C04: .4byte gGMData
_080B9C08:
	ldr r2, _080B9C68  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_080B9C26:
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	bl sub_80C0200
	bl sub_80C2460
	bl sub_80C1F5C
	ldr r5, _080B9C6C  @ gGMData
	ldrb r1, [r5]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080B9C70
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #1
	bl Sound_FadeOutSE
	ldrb r0, [r5, #0x11]
	adds r2, r6, #0
	adds r2, #0x3e
	strb r0, [r2]
	adds r0, r6, #0
	movs r1, #0xf
	bl Proc_Goto
	b _080B9CA4
	.align 2, 0
_080B9C68: .4byte gLCDControlBuffer
_080B9C6C: .4byte gGMData
_080B9C70:
	ldrb r1, [r5, #0x11]
	lsls r1, r1, #5
	ldr r0, _080B9CAC  @ gWMNodeData
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	lsls r2, r0, #8
	str r2, [r5, #8]
	lsls r2, r1, #8
	str r2, [r5, #0xc]
	mov r4, sp
	adds r4, #6
	add r2, sp, #4
	adds r3, r4, #0
	bl GetWMCenteredCameraPosition
	add r0, sp, #4
	ldrh r0, [r0]
	strh r0, [r5, #2]
	ldrh r0, [r4]
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl Proc_Break
_080B9CA4:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9CAC: .4byte gWMNodeData

	THUMB_FUNC_END sub_80B9BA4

	THUMB_FUNC_START WorldMap_WaitForChapterIntroEvents
WorldMap_WaitForChapterIntroEvents: @ 0x080B9CB0
	push {r4, lr}
	adds r4, r0, #0
	bl EventEngineExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9CFA
	ldr r2, _080B9D00  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	bl sub_80C0200
	bl sub_80C2460
	bl sub_80C1F5C
	adds r0, r4, #0
	bl Proc_Break
_080B9CFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D00: .4byte gLCDControlBuffer

	THUMB_FUNC_END WorldMap_WaitForChapterIntroEvents

	THUMB_FUNC_START sub_80B9D04
sub_80B9D04: @ 0x080B9D04
	ldr r0, _080B9D10  @ gGMData
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080B9D10: .4byte gGMData

	THUMB_FUNC_END sub_80B9D04

	THUMB_FUNC_START sub_80B9D14
sub_80B9D14: @ 0x080B9D14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r3, _080B9D2C  @ gGMData
	ldrb r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B9D30
	movs r4, #1
	b _080B9D96
	.align 2, 0
_080B9D2C: .4byte gGMData
_080B9D30:
	ldr r0, _080B9D44  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B9D60
	movs r2, #4
	adds r1, r3, #0
	adds r1, #0x10
	b _080B9D50
	.align 2, 0
_080B9D44: .4byte gPlaySt
_080B9D48:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	bgt _080B9D58
_080B9D50:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080B9D48
_080B9D58:
	cmp r2, #7
	bne _080B9D92
	movs r4, #1
	b _080B9D96
_080B9D60:
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #5
	ldr r1, _080B9D78  @ gWMNodeData
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080B9D92
	movs r2, #4
	adds r1, r3, #0
	adds r1, #0x10
	b _080B9D84
	.align 2, 0
_080B9D78: .4byte gWMNodeData
_080B9D7C:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	bgt _080B9D8C
_080B9D84:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080B9D7C
_080B9D8C:
	cmp r2, #7
	bne _080B9D92
	movs r4, #1
_080B9D92:
	cmp r4, #0
	beq _080B9DAC
_080B9D96:
	movs r0, #0
	mov r1, sp
	bl sub_80C1A74
	ldr r0, [sp]
	cmp r0, #0
	ble _080B9DAC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080B9DAC:
	bl sub_80C1AF8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9D14

	THUMB_FUNC_START sub_80B9DB8
sub_80B9DB8: @ 0x080B9DB8
	push {lr}
	bl sub_80C1ADC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9DB8

	THUMB_FUNC_START sub_80B9DC4
sub_80B9DC4: @ 0x080B9DC4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C1BE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9DD8
	adds r0, r4, #0
	bl Proc_Break
_080B9DD8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9DC4

	THUMB_FUNC_START sub_80B9DE0
sub_80B9DE0: @ 0x080B9DE0
	push {r4, lr}
	sub sp, #4
	ldr r0, [r0, #0x54]
	mov r4, sp
	adds r4, #2
	movs r1, #0
	mov r2, sp
	adds r3, r4, #0
	bl sub_80BE3A0
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl sub_80C168C
	mov r3, sp
	ldr r1, _080B9E38  @ gGMData
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #5
	ldr r2, _080B9E3C  @ gWMNodeData
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	strh r0, [r3]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	strh r0, [r4]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	str r0, [r1, #8]
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E38: .4byte gGMData
_080B9E3C: .4byte gWMNodeData

	THUMB_FUNC_END sub_80B9DE0

	THUMB_FUNC_START sub_80B9E40
sub_80B9E40: @ 0x080B9E40
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C16DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9E5A
	ldr r1, _080B9E60  @ gGMData
	movs r0, #1
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_080B9E5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E60: .4byte gGMData

	THUMB_FUNC_END sub_80B9E40

	THUMB_FUNC_START sub_80B9E64
sub_80B9E64: @ 0x080B9E64
	push {lr}
	sub sp, #4
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	mov r2, sp
	ldr r1, _080B9EA0  @ gGMData
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, #0x78
	lsls r0, r0, #8
	str r0, [r1, #8]
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #0x50
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B9EA0: .4byte gGMData

	THUMB_FUNC_END sub_80B9E64

	THUMB_FUNC_START sub_80B9EA4
sub_80B9EA4: @ 0x080B9EA4
	push {lr}
	sub sp, #4
	ldr r2, _080B9F04  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #1
	bl Sound_FadeOutSE
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B9F04: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B9EA4

	THUMB_FUNC_START DoNothing
DoNothing: @ 0x080B9F08
	push {lr}
	bl nullsub_22
	pop {r0}
	bx r0

	THUMB_FUNC_END DoNothing

	THUMB_FUNC_START sub_80B9F14
sub_80B9F14: @ 0x080B9F14
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F14

	THUMB_FUNC_START sub_80B9F24
sub_80B9F24: @ 0x080B9F24
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F24

	THUMB_FUNC_START sub_80B9F34
sub_80B9F34: @ 0x080B9F34
	push {lr}
	adds r1, r0, #0
	movs r0, #2
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F34

	THUMB_FUNC_START sub_80B9F44
sub_80B9F44: @ 0x080B9F44
	push {lr}
	adds r1, r0, #0
	movs r0, #3
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F44

	THUMB_FUNC_START sub_80B9F54
sub_80B9F54: @ 0x080B9F54
	push {r4, lr}
	ldr r4, _080B9F68  @ gPlaySt
	ldrb r1, [r4, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B9F6C
	movs r4, #8
	b _080B9FAA
	.align 2, 0
_080B9F68: .4byte gPlaySt
_080B9F6C:
	ldr r0, _080B9F90  @ gGMData
	bl sub_80BD014
	cmp r0, #0
	blt _080B9FA8
	ldrb r1, [r4, #0x1b]
	cmp r1, #1
	blt _080B9F84
	cmp r1, #2
	ble _080B9F84
	cmp r1, #3
	beq _080B9F98
_080B9F84:
	ldr r1, _080B9F94  @ gUnknown_08A3DD88
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0]
	b _080B9FAA
	.align 2, 0
_080B9F90: .4byte gGMData
_080B9F94: .4byte gUnknown_08A3DD88
_080B9F98:
	ldr r1, _080B9FA4  @ gUnknown_08A3DD88
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0, #2]
	b _080B9FAA
	.align 2, 0
_080B9FA4: .4byte gUnknown_08A3DD88
_080B9FA8:
	movs r4, #4
_080B9FAA:
	bl Sound_GetCurrentSong
	cmp r0, r4
	beq _080B9FB8
	adds r0, r4, #0
	bl OverrideBgm
_080B9FB8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F54

	THUMB_FUNC_START sub_80B9FC0
sub_80B9FC0: @ 0x080B9FC0
	push {lr}
	ldr r0, _080B9FD0  @ gProcScr_WorldMapMain
	bl Proc_Find
	bl sub_80B9F54
	pop {r0}
	bx r0
	.align 2, 0
_080B9FD0: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80B9FC0

	THUMB_FUNC_START sub_80B9FD4
sub_80B9FD4: @ 0x080B9FD4
	push {lr}
	ldr r0, _080BA000  @ gGMData
	bl sub_80BD014
	cmp r0, #0
	bge _080B9FE2
	movs r0, #0
_080B9FE2:
	bl WMLoc_GetChapterId
	ldr r2, _080BA004  @ gPlaySt
	strb r0, [r2, #0xe]
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080BA000: .4byte gGMData
_080BA004: .4byte gPlaySt

	THUMB_FUNC_END sub_80B9FD4

	THUMB_FUNC_START sub_80BA008
sub_80BA008: @ 0x080BA008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BA020  @ gProcScr_WorldMapMain
	bl Proc_Find
	str r4, [r0, #0x2c]
	movs r1, #0
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA020: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80BA008

	THUMB_FUNC_START EndWM
EndWM: @ 0x080BA024
	push {lr}
	ldr r0, _080BA04C  @ gUnknown_08A20DA4
	bl Proc_Find
	bl Proc_End
	ldr r0, _080BA050  @ gProcScr_WorldMapMain
	bl Proc_Find
	bl Proc_End
	bl ResetDialogueScreen
	bl APProc_DeleteAll
	movs r0, #0
	bl SetupBackgrounds
	pop {r0}
	bx r0
	.align 2, 0
_080BA04C: .4byte gUnknown_08A20DA4
_080BA050: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END EndWM

	THUMB_FUNC_START sub_80BA054
sub_80BA054: @ 0x080BA054
	push {lr}
	ldr r0, _080BA068  @ gProcScr_WorldMapMain
	bl Proc_Find
	cmp r0, #0
	beq _080BA062
	movs r0, #1
_080BA062:
	pop {r1}
	bx r1
	.align 2, 0
_080BA068: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80BA054

	THUMB_FUNC_START sub_80BA06C
sub_80BA06C: @ 0x080BA06C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080BA07C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080BA0AE
_080BA07C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #6
	beq _080BA08C
	cmp r0, #7
	beq _080BA09C
	b _080BA0A8
_080BA08C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_80B86CC
	b _080BA0A8
_080BA09C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_80B8844
_080BA0A8:
	adds r0, r4, #0
	bl Proc_Break
_080BA0AE:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BA06C

	THUMB_FUNC_START sub_80BA0B4
sub_80BA0B4: @ 0x080BA0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080BA0F8  @ gProcScr_WorldMapMain
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BA0FC  @ gUnknown_08A3DD08
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r4, [r1]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0F8: .4byte gProcScr_WorldMapMain
_080BA0FC: .4byte gUnknown_08A3DD08

	THUMB_FUNC_END sub_80BA0B4

	THUMB_FUNC_START sub_80BA100
sub_80BA100: @ 0x080BA100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080BA194  @ gPaletteBuffer+2
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov r9, r1
	movs r1, #0x20
	subs r3, r1, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080BA136:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, r9
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	negs r7, r7
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080BA136
	bl EnablePaletteSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080BA184
	adds r0, r6, #0
	bl Proc_Break
_080BA184:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA194: .4byte gPaletteBuffer+2

	THUMB_FUNC_END sub_80BA100

	THUMB_FUNC_START sub_80BA198
sub_80BA198: @ 0x080BA198
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BA1E4  @ gProcScr_WorldMapMain
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BA1E8  @ gUnknown_08A3DD20
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080BA1EC  @ gPal_MapSprite
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080BA1F0  @ gPaletteBuffer
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080BA1CE:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080BA1CE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA1E4: .4byte gProcScr_WorldMapMain
_080BA1E8: .4byte gUnknown_08A3DD20
_080BA1EC: .4byte gPal_MapSprite
_080BA1F0: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BA198

	THUMB_FUNC_START sub_80BA1F4
sub_80BA1F4: @ 0x080BA1F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080BA284  @ gPaletteBuffer+2
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov r9, r1
	adds r3, r0, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080BA228:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, r9
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	negs r7, r7
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080BA228
	bl EnablePaletteSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080BA276
	adds r0, r6, #0
	bl Proc_Break
_080BA276:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA284: .4byte gPaletteBuffer+2

	THUMB_FUNC_END sub_80BA1F4

	THUMB_FUNC_START sub_80BA288
sub_80BA288: @ 0x080BA288
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BA2D4  @ gProcScr_WorldMapMain
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BA2D8  @ gUnknown_08A3DD38
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080BA2DC  @ gPal_MapSprite
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080BA2E0  @ gPaletteBuffer
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080BA2BE:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080BA2BE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA2D4: .4byte gProcScr_WorldMapMain
_080BA2D8: .4byte gUnknown_08A3DD38
_080BA2DC: .4byte gPal_MapSprite
_080BA2E0: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BA288

	THUMB_FUNC_START NewWorldMap
NewWorldMap: @ 0x080BA2E4
	push {lr}
	ldr r0, _080BA310  @ gProcScr_WorldMapMain
	movs r1, #3
	bl Proc_Start
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080BA314  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BA318
	str r2, [r3, #0x2c]
	b _080BA330
	.align 2, 0
_080BA310: .4byte gProcScr_WorldMapMain
_080BA314: .4byte gPlaySt
_080BA318:
	ldr r0, _080BA328  @ gGMData
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BA32C
	movs r0, #0xc
	b _080BA32E
	.align 2, 0
_080BA328: .4byte gGMData
_080BA32C:
	movs r0, #0x10
_080BA32E:
	str r0, [r3, #0x2c]
_080BA330:
	pop {r0}
	bx r0

	THUMB_FUNC_END NewWorldMap

	THUMB_FUNC_START WorldMap_SetupChapterStuff
WorldMap_SetupChapterStuff: @ 0x080BA334
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl Sound_FadeOutBGM
	ldr r2, _080BA360  @ gGMData
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BA356
	ldr r6, _080BA364  @ gPlaySt
	ldrb r1, [r6, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BA368
_080BA356:
	ldr r0, [r5, #0x2c]
	bl sub_80BA008
	b _080BA3BC
	.align 2, 0
_080BA360: .4byte gGMData
_080BA364: .4byte gPlaySt
_080BA368:
	ldrb r0, [r2, #0x11]
	adds r1, r2, #0
	adds r1, #0xc8
	strb r0, [r1]
	bl WMLoc_GetNextLocId
	cmp r0, #0
	blt _080BA3BC
	bl WMLoc_GetChapterId
	adds r4, r0, #0
	strb r4, [r6, #0xe]
	ldr r6, _080BA3D0  @ gUnknown_088B39EC
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA3C8
	bl sub_80BCFB4
	ldr r1, [r5, #0x48]
	adds r1, #0x32
	ldrb r2, [r1]
	movs r0, #3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #0
	bl CallEvent
_080BA3BC:
	adds r0, r5, #0
	bl StartWMFaceCtrl
	movs r0, #0
	bl NewMapMuEntry
_080BA3C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA3D0: .4byte gUnknown_088B39EC

	THUMB_FUNC_END WorldMap_SetupChapterStuff

	THUMB_FUNC_START CallChapterWMIntroEvents
CallChapterWMIntroEvents: @ 0x080BA3D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080BA41C  @ gUnknown_088B3AD8
	ldr r4, _080BA420  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA416
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #0
	bl CallEvent
	adds r0, r5, #0
	bl StartWMFaceCtrl
	movs r0, #0
	bl NewMapMuEntry
_080BA416:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA41C: .4byte gUnknown_088B3AD8
_080BA420: .4byte gPlaySt

	THUMB_FUNC_END CallChapterWMIntroEvents

.align 2, 0
