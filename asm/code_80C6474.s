	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80C6474
sub_80C6474: @ 0x080C6474
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r0, #4
	bls _080C648A
	b _080C66DE
_080C648A:
	lsls r0, r0, #2
	ldr r1, _080C6494  @ _080C6498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6494: .4byte _080C6498
_080C6498: @ jump table
	.4byte _080C64AC @ case 0
	.4byte _080C64F4 @ case 1
	.4byte _080C653C @ case 2
	.4byte _080C65B0 @ case 3
	.4byte _080C6624 @ case 4
_080C64AC:
	cmp r3, #1
	beq _080C64D0
	cmp r3, #1
	bgt _080C64BA
	cmp r3, #0
	beq _080C64C4
	b _080C66DE
_080C64BA:
	cmp r3, #2
	beq _080C64DC
	cmp r3, #3
	beq _080C64E8
	b _080C66DE
_080C64C4:
	movs r5, #0x8a
	ldr r4, _080C64CC  @ gUnknown_08AA6C22
	b _080C66DE
	.align 2, 0
_080C64CC: .4byte gUnknown_08AA6C22
_080C64D0:
	movs r5, #0x8a
	ldr r4, _080C64D8  @ gUnknown_08AA6C36
	b _080C66DE
	.align 2, 0
_080C64D8: .4byte gUnknown_08AA6C36
_080C64DC:
	movs r5, #0xb2
	ldr r4, _080C64E4  @ gUnknown_08AA6C22
	b _080C66DE
	.align 2, 0
_080C64E4: .4byte gUnknown_08AA6C22
_080C64E8:
	movs r5, #0xb2
	ldr r4, _080C64F0  @ gUnknown_08AA6C36
	b _080C66DE
	.align 2, 0
_080C64F0: .4byte gUnknown_08AA6C36
_080C64F4:
	cmp r3, #1
	beq _080C6518
	cmp r3, #1
	bgt _080C6502
	cmp r3, #0
	beq _080C650C
	b _080C66DE
_080C6502:
	cmp r3, #2
	beq _080C6524
	cmp r3, #3
	beq _080C6530
	b _080C66DE
_080C650C:
	movs r5, #0xda
	ldr r4, _080C6514  @ gUnknown_08AA6C4A
	b _080C66DE
	.align 2, 0
_080C6514: .4byte gUnknown_08AA6C4A
_080C6518:
	movs r5, #0xda
	ldr r4, _080C6520  @ gUnknown_08AA6C58
	b _080C66DE
	.align 2, 0
_080C6520: .4byte gUnknown_08AA6C58
_080C6524:
	movs r5, #0xf2
	ldr r4, _080C652C  @ gUnknown_08AA6C4A
	b _080C66DE
	.align 2, 0
_080C652C: .4byte gUnknown_08AA6C4A
_080C6530:
	movs r5, #0xf2
	ldr r4, _080C6538  @ gUnknown_08AA6C58
	b _080C66DE
	.align 2, 0
_080C6538: .4byte gUnknown_08AA6C58
_080C653C:
	cmp r3, #5
	bls _080C6542
	b _080C66DE
_080C6542:
	lsls r0, r3, #2
	ldr r1, _080C654C  @ _080C6550
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C654C: .4byte _080C6550
_080C6550: @ jump table
	.4byte _080C6568 @ case 0
	.4byte _080C6574 @ case 1
	.4byte _080C6580 @ case 2
	.4byte _080C658C @ case 3
	.4byte _080C6598 @ case 4
	.4byte _080C65A4 @ case 5
_080C6568:
	movs r5, #0x85
	lsls r5, r5, #1
	ldr r4, _080C6570  @ gUnknown_08AA6C66
	b _080C66DE
	.align 2, 0
_080C6570: .4byte gUnknown_08AA6C66
_080C6574:
	movs r5, #0x85
	lsls r5, r5, #1
	ldr r4, _080C657C  @ gUnknown_08AA6C74
	b _080C66DE
	.align 2, 0
_080C657C: .4byte gUnknown_08AA6C74
_080C6580:
	movs r5, #0x8b
	lsls r5, r5, #1
	ldr r4, _080C6588  @ gUnknown_08AA6C66
	b _080C66DE
	.align 2, 0
_080C6588: .4byte gUnknown_08AA6C66
_080C658C:
	movs r5, #0x8b
	lsls r5, r5, #1
	ldr r4, _080C6594  @ gUnknown_08AA6C74
	b _080C66DE
	.align 2, 0
_080C6594: .4byte gUnknown_08AA6C74
_080C6598:
	movs r5, #0x9d
	lsls r5, r5, #1
	ldr r4, _080C65A0  @ gUnknown_08AA6C66
	b _080C66DE
	.align 2, 0
_080C65A0: .4byte gUnknown_08AA6C66
_080C65A4:
	movs r5, #0x9d
	lsls r5, r5, #1
	ldr r4, _080C65AC  @ gUnknown_08AA6C74
	b _080C66DE
	.align 2, 0
_080C65AC: .4byte gUnknown_08AA6C74
_080C65B0:
	cmp r3, #5
	bls _080C65B6
	b _080C66DE
_080C65B6:
	lsls r0, r3, #2
	ldr r1, _080C65C0  @ _080C65C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C65C0: .4byte _080C65C4
_080C65C4: @ jump table
	.4byte _080C65DC @ case 0
	.4byte _080C65E8 @ case 1
	.4byte _080C65F4 @ case 2
	.4byte _080C6600 @ case 3
	.4byte _080C660C @ case 4
	.4byte _080C6618 @ case 5
_080C65DC:
	movs r5, #0x91
	lsls r5, r5, #1
	ldr r4, _080C65E4  @ gUnknown_08AA6C82
	b _080C66DE
	.align 2, 0
_080C65E4: .4byte gUnknown_08AA6C82
_080C65E8:
	movs r5, #0x91
	lsls r5, r5, #1
	ldr r4, _080C65F0  @ gUnknown_08AA6C8A
	b _080C66DE
	.align 2, 0
_080C65F0: .4byte gUnknown_08AA6C8A
_080C65F4:
	movs r5, #0x93
	lsls r5, r5, #1
	ldr r4, _080C65FC  @ gUnknown_08AA6C82
	b _080C66DE
	.align 2, 0
_080C65FC: .4byte gUnknown_08AA6C82
_080C6600:
	movs r5, #0x93
	lsls r5, r5, #1
	ldr r4, _080C6608  @ gUnknown_08AA6C8A
	b _080C66DE
	.align 2, 0
_080C6608: .4byte gUnknown_08AA6C8A
_080C660C:
	movs r5, #0x97
	lsls r5, r5, #1
	ldr r4, _080C6614  @ gUnknown_08AA6C82
	b _080C66DE
	.align 2, 0
_080C6614: .4byte gUnknown_08AA6C82
_080C6618:
	movs r5, #0x97
	lsls r5, r5, #1
	ldr r4, _080C6620  @ gUnknown_08AA6C8A
	b _080C66DE
	.align 2, 0
_080C6620: .4byte gUnknown_08AA6C8A
_080C6624:
	cmp r3, #0xb
	bhi _080C66DE
	lsls r0, r3, #2
	ldr r1, _080C6634  @ _080C6638
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6634: .4byte _080C6638
_080C6638: @ jump table
	.4byte _080C6668 @ case 0
	.4byte _080C6674 @ case 1
	.4byte _080C667A @ case 2
	.4byte _080C6688 @ case 3
	.4byte _080C668E @ case 4
	.4byte _080C669C @ case 5
	.4byte _080C66A2 @ case 6
	.4byte _080C66B0 @ case 7
	.4byte _080C66B6 @ case 8
	.4byte _080C66C4 @ case 9
	.4byte _080C66CA @ case 10
	.4byte _080C66D8 @ case 11
_080C6668:
	movs r5, #0x95
	lsls r5, r5, #1
	ldr r4, _080C6670  @ gUnknown_08AA6C92
	b _080C66DE
	.align 2, 0
_080C6670: .4byte gUnknown_08AA6C92
_080C6674:
	movs r5, #0x95
	lsls r5, r5, #1
	b _080C66DC
_080C667A:
	movs r5, #0x96
	lsls r5, r5, #1
	ldr r4, _080C6684  @ gUnknown_08AA6C92
	b _080C66DE
	.align 2, 0
_080C6684: .4byte gUnknown_08AA6C92
_080C6688:
	movs r5, #0x96
	lsls r5, r5, #1
	b _080C66DC
_080C668E:
	movs r5, #0x99
	lsls r5, r5, #1
	ldr r4, _080C6698  @ gUnknown_08AA6C92
	b _080C66DE
	.align 2, 0
_080C6698: .4byte gUnknown_08AA6C92
_080C669C:
	movs r5, #0x99
	lsls r5, r5, #1
	b _080C66DC
_080C66A2:
	movs r5, #0x9a
	lsls r5, r5, #1
	ldr r4, _080C66AC  @ gUnknown_08AA6C92
	b _080C66DE
	.align 2, 0
_080C66AC: .4byte gUnknown_08AA6C92
_080C66B0:
	movs r5, #0x9a
	lsls r5, r5, #1
	b _080C66DC
_080C66B6:
	movs r5, #0x9b
	lsls r5, r5, #1
	ldr r4, _080C66C0  @ gUnknown_08AA6C92
	b _080C66DE
	.align 2, 0
_080C66C0: .4byte gUnknown_08AA6C92
_080C66C4:
	movs r5, #0x9b
	lsls r5, r5, #1
	b _080C66DC
_080C66CA:
	movs r5, #0x9c
	lsls r5, r5, #1
	ldr r4, _080C66D4  @ gUnknown_08AA6C92
	b _080C66DE
	.align 2, 0
_080C66D4: .4byte gUnknown_08AA6C92
_080C66D8:
	movs r5, #0x9c
	lsls r5, r5, #1
_080C66DC:
	ldr r4, _080C6700  @ gUnknown_08AA6C9A
_080C66DE:
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r5, r0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6700: .4byte gUnknown_08AA6C9A

	THUMB_FUNC_END sub_80C6474

	THUMB_FUNC_START sub_80C6704
sub_80C6704: @ 0x080C6704
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C6730  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080C672A
	movs r0, #2
	bl SetNextGameActionId
	ldr r0, _080C6734  @ gUnknown_02022188
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r0, [r4, #0x14]
	movs r1, #0x63
	bl Proc_Goto
_080C672A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6730: .4byte gKeyStatusPtr
_080C6734: .4byte gUnknown_02022188

	THUMB_FUNC_END sub_80C6704

	THUMB_FUNC_START AddSomeChild6C
AddSomeChild6C: @ 0x080C6738
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C6748  @ gUnknown_08AA6CA4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080C6748: .4byte gUnknown_08AA6CA4

	THUMB_FUNC_END AddSomeChild6C

	THUMB_FUNC_START DeleteSome6C
DeleteSome6C: @ 0x080C674C
	push {lr}
	ldr r0, _080C675C  @ gUnknown_08AA6CA4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080C675C: .4byte gUnknown_08AA6CA4

	THUMB_FUNC_END DeleteSome6C

	THUMB_FUNC_START StorePaletteToBufferMaybe
StorePaletteToBufferMaybe: @ 0x080C6760
	push {lr}
	bl CopyToPaletteBuffer
	ldr r1, _080C6774  @ gPaletteBuffer
	ldr r0, _080C6778  @ gUnknown_02022188
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C6774: .4byte gPaletteBuffer
_080C6778: .4byte gUnknown_02022188

	THUMB_FUNC_END StorePaletteToBufferMaybe

	THUMB_FUNC_START sub_80C677C
sub_80C677C: @ 0x080C677C
	push {lr}
	adds r2, r0, #0
	movs r3, #0x13
_080C6782:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r3, #1
	cmp r3, #0
	bge _080C6782
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C677C

	THUMB_FUNC_START sub_80C6794
sub_80C6794: @ 0x080C6794
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	lsls r2, r2, #0x18
	ldr r6, _080C67BC  @ 0x00007FFF
	lsrs r5, r2, #0xc
	movs r2, #0x13
_080C67A2:
	ldrh r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r5
	strh r0, [r3]
	adds r4, #0x40
	adds r3, #0x40
	subs r2, #1
	cmp r2, #0
	bge _080C67A2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C67BC: .4byte 0x00007FFF

	THUMB_FUNC_END sub_80C6794

	THUMB_FUNC_START sub_80C67C0
sub_80C67C0: @ 0x080C67C0
	push {lr}
	movs r2, #0
	movs r1, #0x13
_080C67C6:
	strh r2, [r0]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge _080C67C6
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C67C0

	THUMB_FUNC_START sub_80C67D4
sub_80C67D4: @ 0x080C67D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, [sp, #0x24]
	mov r9, r2
	ldr r2, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	mov r0, sl
	bl BG_GetMapBuffer
	adds r5, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080C680E
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080C680E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x13
	adds r4, r0, #1
	lsls r1, r6, #0x10
	asrs r0, r1, #0x13
	adds r0, #1
	adds r6, r1, #0
	cmp r4, r0
	bge _080C687E
	movs r7, #0x1f
	mov r1, r8
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
_080C682A:
	cmp r4, #0x3f
	bhi _080C6838
	cmp r4, #0x1f
	ble _080C6846
	mov r2, r9
	cmp r2, #0
	bne _080C6846
_080C6838:
	adds r0, r4, #0
	ands r0, r7
	lsls r0, r0, #1
	adds r0, r5, r0
	bl sub_80C67C0
	b _080C6874
_080C6846:
	mov r0, r9
	cmp r4, #0x1f
	bgt _080C684E
	ldr r0, [sp, #0x20]
_080C684E:
	mov r1, r8
	cmp r1, #0
	bne _080C6864
	adds r1, r4, #0
	ands r1, r7
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, r1
	bl sub_80C677C
	b _080C6874
_080C6864:
	adds r1, r4, #0
	ands r1, r7
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, r1
	movs r2, #0xf
	bl sub_80C6794
_080C6874:
	adds r4, #1
	asrs r0, r6, #0x13
	adds r0, #1
	cmp r4, r0
	blt _080C682A
_080C687E:
	movs r2, #0x80
	lsls r2, r2, #0xd
	adds r1, r6, r2
	lsrs r1, r1, #0x10
	mov r0, sl
	movs r2, #0
	bl BG_SetPosition
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C67D4

	THUMB_FUNC_START sub_80C689C
sub_80C689C: @ 0x080C689C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x28]
	mov r9, r4
	ldr r4, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	adds r0, r3, #0
	bl BG_GetMapBuffer
	adds r7, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080C68DE
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080C68DE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r4, r9
	cmp r4, #0
	beq _080C6906
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	b _080C690C
_080C6906:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_080C690C:
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	subs r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x13
	subs r4, r0, #1
	lsls r1, r6, #0x10
	asrs r0, r1, #0x13
	subs r0, #1
	adds r5, r1, #0
	cmp r4, r0
	ble _080C6994
	movs r6, #0x1f
	mov r1, sl
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
_080C693C:
	cmp r4, #0x3f
	bhi _080C694A
	cmp r4, #0x1f
	ble _080C6958
	mov r2, r9
	cmp r2, #0
	bne _080C6958
_080C694A:
	adds r0, r4, #0
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r7, r0
	bl sub_80C67C0
	b _080C698A
_080C6958:
	mov r0, r9
	cmp r4, #0x1f
	bgt _080C6960
	ldr r0, [sp, #0x24]
_080C6960:
	cmp r0, #0
	beq _080C6994
	mov r1, r8
	cmp r1, #0
	bne _080C697A
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, r1
	bl sub_80C677C
	b _080C698A
_080C697A:
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, r1
	movs r2, #0xf
	bl sub_80C6794
_080C698A:
	subs r4, #1
	asrs r0, r5, #0x13
	subs r0, #1
	cmp r4, r0
	bgt _080C693C
_080C6994:
	lsrs r1, r5, #0x10
	ldr r0, [sp]
	movs r2, #0
	bl BG_SetPosition
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C689C

	THUMB_FUNC_START sub_80C69B0
sub_80C69B0: @ 0x080C69B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r0, #0x1f
	mov ip, r0
	movs r5, #0x1f
	movs r0, #0x10
	subs r6, r0, r2
	movs r1, #0xf
	mov r9, r1
	mov r0, r8
	ands r0, r5
	adds r7, r0, #0
	muls r7, r2, r7
	mov sl, r7
_080C69E2:
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r6, r3
	add r3, sl
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r6, r2
	mov r7, r8
	lsrs r0, r7, #5
	mov r7, ip
	ands r0, r7
	ldr r7, [sp]
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, ip
	ands r1, r0
	muls r1, r6, r1
	mov r7, r8
	lsrs r0, r7, #0xa
	mov r7, ip
	ands r0, r7
	ldr r7, [sp]
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	ands r1, r5
	lsls r1, r1, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r1, r2
	ands r3, r5
	orrs r3, r1
	strh r3, [r4]
	adds r4, #2
	movs r0, #1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, #0
	bge _080C69E2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C69B0

	THUMB_FUNC_START Initialize6CIntroSequence
Initialize6CIntroSequence: @ 0x080C6A54
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r1, #0
	strh r1, [r4, #0x2a]
	ldr r0, _080C6B10  @ gUnknown_02022188
	strh r1, [r0, #0xc]
	ldr r2, _080C6B14  @ gLCDControlBuffer
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
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
	ldr r0, _080C6B18  @ gUnknown_08AF1AE8
	ldr r1, _080C6B1C  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6B20  @ gUnknown_08AF1B38
	ldr r1, _080C6B24  @ 0x06010100
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6B28  @ gUnknown_08AF1FD0
	ldr r1, _080C6B2C  @ 0x060108C0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6B30  @ gUnknown_08AF2654
	ldr r1, _080C6B34  @ 0x06011140
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6B38  @ gUnknown_08AF1B18
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C6B3C  @ gUnknown_08AF1FB0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C6B40  @ gUnknown_08AF2634
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C6B44  @ gUnknown_08AF310C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	ldr r1, _080C6B48  @ 0x06017800
	ldr r2, _080C6B4C  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #3
	bl SetNextGameActionId
	adds r0, r4, #0
	bl AddSomeChild6C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6B10: .4byte gUnknown_02022188
_080C6B14: .4byte gLCDControlBuffer
_080C6B18: .4byte gUnknown_08AF1AE8
_080C6B1C: .4byte 0x06010000
_080C6B20: .4byte gUnknown_08AF1B38
_080C6B24: .4byte 0x06010100
_080C6B28: .4byte gUnknown_08AF1FD0
_080C6B2C: .4byte 0x060108C0
_080C6B30: .4byte gUnknown_08AF2654
_080C6B34: .4byte 0x06011140
_080C6B38: .4byte gUnknown_08AF1B18
_080C6B3C: .4byte gUnknown_08AF1FB0
_080C6B40: .4byte gUnknown_08AF2634
_080C6B44: .4byte gUnknown_08AF310C
_080C6B48: .4byte 0x06017800
_080C6B4C: .4byte 0x01000200

	THUMB_FUNC_END Initialize6CIntroSequence

	THUMB_FUNC_START sub_80C6B50
sub_80C6B50: @ 0x080C6B50
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C6B88  @ gLCDControlBuffer
	adds r3, r2, #0
	adds r3, #0x3c
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x46
	movs r5, #0
	strb r5, [r2]
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6B88: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C6B50

	THUMB_FUNC_START sub_80C6B8C
sub_80C6B8C: @ 0x080C6B8C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsh r3, [r5, r0]
	adds r4, r6, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r1, _080C6BD4  @ gLCDControlBuffer
	adds r1, #0x46
	strb r0, [r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080C6BC6
	adds r0, r6, #0
	bl Proc_Break
_080C6BC6:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6BD4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C6B8C

	THUMB_FUNC_START sub_80C6BD8
sub_80C6BD8: @ 0x080C6BD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C6BEC  @ gUnknown_08AA6CBC
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6BEC: .4byte gUnknown_08AA6CBC

	THUMB_FUNC_END sub_80C6BD8

	THUMB_FUNC_START sub_80C6BF0
sub_80C6BF0: @ 0x080C6BF0
	push {lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #9
	str r2, [sp]
	str r2, [sp, #4]
	mov r3, sp
	movs r2, #0x78
	strh r2, [r3, #8]
	movs r2, #0x50
	strh r2, [r3, #0xa]
	mov r2, sp
	strh r0, [r2, #0xc]
	strh r0, [r2, #0xe]
	mov r0, sp
	lsls r1, r1, #8
	strh r1, [r0, #0x10]
	ldr r1, _080C6C20  @ gUnknown_030030C8
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080C6C20: .4byte gUnknown_030030C8

	THUMB_FUNC_END sub_80C6BF0

	THUMB_FUNC_START sub_80C6C24
sub_80C6C24: @ 0x080C6C24
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _080C6DE8  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r0, #3
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xd8
	lsls r1, r1, #8
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r1, #0xf8
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundMapDataOffset
	movs r0, #0
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #1
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #3
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldr r4, _080C6DEC  @ gUnknown_08AB21D8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6DF0  @ gUnknown_08AB5D90
	ldr r1, _080C6DF4  @ 0x0600F000
	bl CopyDataWithPossibleUncomp
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C6DF8  @ gPaletteBuffer
	ldr r2, _080C6DFC  @ 0x01000008
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, _080C6E00  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r4, _080C6E04  @ gUnknown_08AB632C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6E08  @ gUnknown_08AB7DB0
	movs r1, #0x40
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r4, _080C6E0C  @ 0x0600E800
	ldr r0, _080C6E10  @ gUnknown_08AB7AC0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0x80
	lsls r5, r5, #3
_080C6D72:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	subs r5, #1
	adds r4, #2
	cmp r5, #0
	bne _080C6D72
	bl EnablePaletteSync
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	strh r5, [r6, #0x2a]
	strh r5, [r6, #0x34]
	strh r5, [r6, #0x36]
	ldr r2, _080C6DE8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6DE8: .4byte gLCDControlBuffer
_080C6DEC: .4byte gUnknown_08AB21D8
_080C6DF0: .4byte gUnknown_08AB5D90
_080C6DF4: .4byte 0x0600F000
_080C6DF8: .4byte gPaletteBuffer
_080C6DFC: .4byte 0x01000008
_080C6E00: .4byte gBG0TilemapBuffer
_080C6E04: .4byte gUnknown_08AB632C
_080C6E08: .4byte gUnknown_08AB7DB0
_080C6E0C: .4byte 0x0600E800
_080C6E10: .4byte gUnknown_08AB7AC0

	THUMB_FUNC_END sub_80C6C24

	THUMB_FUNC_START sub_80C6E14
sub_80C6E14: @ 0x080C6E14
	movs r1, #0
	strh r1, [r0, #0x2a]
	bx lr

	THUMB_FUNC_END sub_80C6E14

	THUMB_FUNC_START sub_80C6E1C
sub_80C6E1C: @ 0x080C6E1C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x3e
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1f
	bl Interpolate
	adds r2, r0, #0
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r2, r0
	ldr r1, _080C6E78  @ gPaletteBuffer
	adds r0, r1, #0
	adds r0, #0x1e
_080C6E42:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _080C6E42
	bl EnablePaletteSync
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x3e
	bne _080C6E84
	movs r0, #0
	strh r0, [r4, #0x2a]
	ldr r1, _080C6E7C  @ gUnknown_02022188
	ldr r0, _080C6E80  @ 0x00007FFF
	strh r0, [r1, #0xc]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	adds r0, r4, #0
	bl Proc_Break
	b _080C6E88
	.align 2, 0
_080C6E78: .4byte gPaletteBuffer
_080C6E7C: .4byte gUnknown_02022188
_080C6E80: .4byte 0x00007FFF
_080C6E84:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C6E88:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C6E1C

	THUMB_FUNC_START Until6C2AIs8Callback
Until6C2AIs8Callback: @ 0x080C6E90
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2a]
	cmp r0, #8
	bne _080C6EA6
	movs r0, #0
	strh r0, [r1, #0x2a]
	adds r0, r1, #0
	bl Proc_Break
	b _080C6EAA
_080C6EA6:
	adds r0, #1
	strh r0, [r1, #0x2a]
_080C6EAA:
	pop {r0}
	bx r0

	THUMB_FUNC_END Until6C2AIs8Callback

	THUMB_FUNC_START sub_80C6EB0
sub_80C6EB0: @ 0x080C6EB0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080C6EE8  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C6EEC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C6EF0
	.align 2, 0
_080C6EE8: .4byte gLCDControlBuffer
_080C6EEC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C6EF0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C6EB0

	THUMB_FUNC_START sub_80C6EF8
sub_80C6EF8: @ 0x080C6EF8
	push {lr}
	ldr r0, _080C6F0C  @ gUnknown_08AA6CDC
	bl Proc_Find
	cmp r0, #0
	beq _080C6F06
	movs r0, #1
_080C6F06:
	pop {r1}
	bx r1
	.align 2, 0
_080C6F0C: .4byte gUnknown_08AA6CDC

	THUMB_FUNC_END sub_80C6EF8

	THUMB_FUNC_START sub_80C6F10
sub_80C6F10: @ 0x080C6F10
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #1
	movs r1, #8
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r2, _080C6F6C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F6C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C6F10

	THUMB_FUNC_START sub_80C6F70
sub_80C6F70: @ 0x080C6F70
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #0x2a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C6F86
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
_080C6F86:
	ldrh r1, [r5, #0x2a]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080C6F96
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080C6F96:
	ldrh r1, [r5, #0x2c]
	ldrh r2, [r5, #0x2e]
	movs r0, #1
	bl BG_SetPosition
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x60
	bhi _080C6FD0
	adds r3, r0, #0
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _080C7034  @ gUnknown_08AB630C
	movs r1, #0
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C7038  @ gPaletteBuffer
	ldr r1, _080C703C  @ 0x00007FFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	bl sub_80C69B0
_080C6FD0:
	ldrh r0, [r5, #0x2a]
	adds r3, r0, #0
	subs r3, #0x80
	cmp r3, #0x60
	bhi _080C6FEE
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	ldr r1, _080C7040  @ gLCDControlBuffer
	adds r1, #0x44
	strb r0, [r1]
_080C6FEE:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0xef
	bne _080C701C
	ldr r2, _080C7040  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x20
	adds r1, r5, #0
	bl sub_80C6BD8
_080C701C:
	ldrh r1, [r5, #0x2a]
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bne _080C7044
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C7048
	.align 2, 0
_080C7034: .4byte gUnknown_08AB630C
_080C7038: .4byte gPaletteBuffer
_080C703C: .4byte 0x00007FFF
_080C7040: .4byte gLCDControlBuffer
_080C7044:
	adds r0, r1, #1
	strh r0, [r5, #0x2a]
_080C7048:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C6F70

	THUMB_FUNC_START sub_80C7050
sub_80C7050: @ 0x080C7050
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080C719C  @ gLCDControlBuffer
	ldrb r1, [r5]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r4, #0x80
	lsls r4, r4, #7
	movs r0, #2
	adds r1, r4, #0
	bl SetBackgroundTileDataOffset
	movs r0, #3
	adds r1, r4, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xd8
	lsls r1, r1, #8
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r1, #0xf8
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundMapDataOffset
	movs r0, #0
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #1
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #3
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r2, [r5, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #1]
	ldr r0, _080C71A0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C71A4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C71A8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C71AC  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	strh r4, [r6, #0x2a]
	strh r4, [r6, #0x38]
	strh r4, [r6, #0x3a]
	strh r4, [r6, #0x3c]
	adds r1, r6, #0
	adds r1, #0x46
	strb r0, [r1]
	strh r4, [r6, #0x3e]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C719C: .4byte gLCDControlBuffer
_080C71A0: .4byte gBG0TilemapBuffer
_080C71A4: .4byte gBG1TilemapBuffer
_080C71A8: .4byte gBG2TilemapBuffer
_080C71AC: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80C7050

	THUMB_FUNC_START sub_80C71B0
sub_80C71B0: @ 0x080C71B0
	ldr r0, _080C71BC  @ gUnknown_02022188
	ldrh r1, [r0, #2]
	strh r1, [r0, #8]
	ldrh r1, [r0, #6]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_080C71BC: .4byte gUnknown_02022188

	THUMB_FUNC_END sub_80C71B0

	THUMB_FUNC_START sub_80C71C0
sub_80C71C0: @ 0x080C71C0
	push {lr}
	ldr r0, _080C71D0  @ gUnknown_08AA6D04
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080C71D0: .4byte gUnknown_08AA6D04

	THUMB_FUNC_END sub_80C71C0

	THUMB_FUNC_START sub_80C71D4
sub_80C71D4: @ 0x080C71D4
	push {lr}
	ldr r0, _080C71E0  @ gUnknown_08AA6D04
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C71E0: .4byte gUnknown_08AA6D04

	THUMB_FUNC_END sub_80C71D4

	THUMB_FUNC_START sub_80C71E4
sub_80C71E4: @ 0x080C71E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x63
	bhi _080C7250
	asrs r1, r1, #0x10
	movs r0, #0x1f
	bics r0, r1
	lsls r0, r0, #6
	ldr r2, _080C725C  @ 0x0600E800
	adds r7, r0, r2
	movs r5, #0x63
	subs r5, r5, r1
	ldr r1, _080C7260  @ gUnknown_08AA6D14
	lsls r5, r5, #0x10
	asrs r0, r5, #0x10
	lsls r4, r0, #2
	adds r1, r4, r1
	ldr r6, [r1]
	movs r1, #0x16
	bl DivRem
	adds r1, r0, #0
	lsls r1, r1, #0xa
	ldr r0, _080C7264  @ 0x06008000
	adds r1, r1, r0
	adds r0, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7268  @ gUnknown_08AA6EA4
	adds r4, r4, r0
	ldr r4, [r4]
	movs r6, #0
	movs r2, #0xfc
	lsls r2, r2, #8
	mov r8, r2
_080C7230:
	asrs r0, r5, #0x10
	movs r1, #0x16
	bl DivRem
	ldrh r1, [r4]
	mov r2, r8
	ands r1, r2
	lsls r0, r0, #5
	adds r0, r0, r6
	orrs r1, r0
	strh r1, [r7]
	adds r6, #1
	adds r7, #2
	adds r4, #2
	cmp r6, #0x1d
	ble _080C7230
_080C7250:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C725C: .4byte 0x0600E800
_080C7260: .4byte gUnknown_08AA6D14
_080C7264: .4byte 0x06008000
_080C7268: .4byte gUnknown_08AA6EA4

	THUMB_FUNC_END sub_80C71E4

	THUMB_FUNC_START sub_80C726C
sub_80C726C: @ 0x080C726C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	asrs r1, r1, #3
	adds r4, r1, #0
	adds r4, #0x15
	asrs r0, r6, #3
	adds r0, #0x15
	cmp r4, r0
	bge _080C728E
	adds r5, r0, #0
_080C7280:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80C71E4
	adds r4, #1
	cmp r4, r5
	blt _080C7280
_080C728E:
	movs r2, #0x60
	subs r2, r2, r6
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C726C

	THUMB_FUNC_START sub_80C72A4
sub_80C72A4: @ 0x080C72A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetDefaultColorEffects
	cmp r4, #0
	bne _080C72DC
	ldr r2, _080C72D8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _080C737C
	.align 2, 0
_080C72D8: .4byte gLCDControlBuffer
_080C72DC:
	ldr r4, _080C73A4  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundTileDataOffset
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080C73A8  @ gUnknown_08AF47F0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	bl StorePaletteToBufferMaybe
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
_080C737C:
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	ldr r0, _080C73AC  @ gUnknown_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C73A4: .4byte gLCDControlBuffer
_080C73A8: .4byte gUnknown_08AF47F0
_080C73AC: .4byte gUnknown_08B103D8

	THUMB_FUNC_END sub_80C72A4

	THUMB_FUNC_START sub_80C73B0
sub_80C73B0: @ 0x080C73B0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #6
	bls _080C73BC
	b _080C7604
_080C73BC:
	lsls r0, r0, #2
	ldr r1, _080C73C8  @ _080C73CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C73C8: .4byte _080C73CC
_080C73CC: @ jump table
	.4byte _080C73E8 @ case 0
	.4byte _080C7454 @ case 1
	.4byte _080C7480 @ case 2
	.4byte _080C74B0 @ case 3
	.4byte _080C74EC @ case 4
	.4byte _080C7510 @ case 5
	.4byte _080C754C @ case 6
_080C73E8:
	ldr r4, _080C743C  @ gUnknown_08AB7DD0
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C7440  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7444  @ gUnknown_08AB87E0
	ldr r1, _080C7448  @ gBG3TilemapBuffer
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C744C  @ gPaletteBuffer
	ldr r1, _080C7450  @ 0x00007FFF
	movs r2, #0xe1
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r2, #0xe
_080C7410:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080C7410
	movs r4, #0xe1
	lsls r4, r4, #8
	adds r3, r4, #0
	ldr r1, _080C7448  @ gBG3TilemapBuffer
	movs r2, #0xa0
	lsls r2, r2, #2
_080C7426:
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080C7426
	movs r0, #8
	bl BG_EnableSyncByMask
	b _080C7604
	.align 2, 0
_080C743C: .4byte gUnknown_08AB7DD0
_080C7440: .4byte 0x06002000
_080C7444: .4byte gUnknown_08AB87E0
_080C7448: .4byte gBG3TilemapBuffer
_080C744C: .4byte gPaletteBuffer
_080C7450: .4byte 0x00007FFF
_080C7454:
	ldr r4, _080C7474  @ gUnknown_08ABF168
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7478  @ gUnknown_08AC1878
	ldr r1, _080C747C  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C7604
	.align 2, 0
_080C7474: .4byte gUnknown_08ABF168
_080C7478: .4byte gUnknown_08AC1878
_080C747C: .4byte gGenericBuffer
_080C7480:
	ldr r4, _080C74A0  @ gUnknown_08AC0BD8
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080C74A4  @ 0x06002000
	adds r1, r1, r2
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C74A8  @ gUnknown_08AC1B98
	ldr r1, _080C74AC  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C7604
	.align 2, 0
_080C74A0: .4byte gUnknown_08AC0BD8
_080C74A4: .4byte 0x06002000
_080C74A8: .4byte gUnknown_08AC1B98
_080C74AC: .4byte gUnknown_02020988
_080C74B0:
	ldr r4, _080C74DC  @ gUnknown_08ABB14C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C74E0  @ gUnknown_08ABC074
	ldr r1, _080C74E4  @ gUnknown_02021188
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C74E8  @ gUnknown_08AC1C8C
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	b _080C7604
	.align 2, 0
_080C74DC: .4byte gUnknown_08ABB14C
_080C74E0: .4byte gUnknown_08ABC074
_080C74E4: .4byte gUnknown_02021188
_080C74E8: .4byte gUnknown_08AC1C8C
_080C74EC:
	ldr r0, _080C7500  @ gUnknown_08ABE304
	ldr r1, _080C7504  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7508  @ gUnknown_08ABEF70
	ldr r1, _080C750C  @ 0x0600C000
	bl CopyDataWithPossibleUncomp
	b _080C7604
	.align 2, 0
_080C7500: .4byte gUnknown_08ABE304
_080C7504: .4byte 0x06008000
_080C7508: .4byte gUnknown_08ABEF70
_080C750C: .4byte 0x0600C000
_080C7510:
	ldr r0, _080C753C  @ gUnknown_08ABD348
	ldr r1, _080C7540  @ 0x0600A000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7544  @ gUnknown_08ABE120
	ldr r4, _080C7548  @ 0x0600C800
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #2
_080C752C:
	ldrh r3, [r4]
	adds r0, r1, r3
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne _080C752C
	b _080C7604
	.align 2, 0
_080C753C: .4byte gUnknown_08ABD348
_080C7540: .4byte 0x0600A000
_080C7544: .4byte gUnknown_08ABE120
_080C7548: .4byte 0x0600C800
_080C754C:
	ldr r3, _080C75EC  @ gUnknown_02021188
	ldr r0, _080C75F0  @ gPaletteBuffer
	movs r1, #0
	movs r4, #0xf1
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r2, #0xe
_080C755A:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080C755A
	movs r0, #0x80
	lsls r0, r0, #4
	adds r4, r3, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r3, #0
	adds r1, r4, #0
	bl CpuFastSet
	adds r7, r4, #0
	ldr r6, _080C75F4  @ 0x00000FFF
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r4, r2, #0
	adds r3, r7, #0
	movs r2, #0xa0
	lsls r2, r2, #2
_080C7586:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _080C7586
	ldr r1, _080C75F8  @ 0x0600F000
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r7, #0
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r2, _080C75FC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	strh r0, [r5, #0x2a]
	strh r0, [r5, #0x30]
	strh r0, [r5, #0x32]
	ldr r1, _080C7600  @ gUnknown_02022188
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	movs r2, #0xa0
	strh r2, [r1, #6]
	strh r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	adds r0, r5, #0
	bl Proc_Break
	b _080C760A
	.align 2, 0
_080C75EC: .4byte gUnknown_02021188
_080C75F0: .4byte gPaletteBuffer
_080C75F4: .4byte 0x00000FFF
_080C75F8: .4byte 0x0600F000
_080C75FC: .4byte gLCDControlBuffer
_080C7600: .4byte gUnknown_02022188
_080C7604:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C760A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C73B0

	THUMB_FUNC_START sub_80C7610
sub_80C7610: @ 0x080C7610
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80C7610

	THUMB_FUNC_START sub_80C7618
sub_80C7618: @ 0x080C7618
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _080C7668  @ gUnknown_08AB8CAC
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C766C  @ gUnknown_02022A68
	ldr r1, _080C7670  @ 0x00007FFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	bl sub_80C69B0
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0x20
	bne _080C7674
	movs r0, #0
	strh r0, [r5]
	adds r0, r6, #0
	bl Proc_Break
	b _080C7678
	.align 2, 0
_080C7668: .4byte gUnknown_08AB8CAC
_080C766C: .4byte gUnknown_02022A68
_080C7670: .4byte 0x00007FFF
_080C7674:
	adds r0, r1, #1
	strh r0, [r5]
_080C7678:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7618

	THUMB_FUNC_START sub_80C7680
sub_80C7680: @ 0x080C7680
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r4, #0
	movs r6, #4
_080C768C:
	lsls r1, r4, #5
	str r6, [sp]
	movs r0, #0
	adds r2, r5, #0
	ldr r3, _080C76C0  @ gObject_32x8
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #7
	ble _080C768C
	movs r4, #0
	movs r5, #0
_080C76A4:
	lsls r2, r4, #5
	str r5, [sp]
	movs r0, #0
	adds r1, r7, #0
	ldr r3, _080C76C4  @ gObject_8x32
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #7
	ble _080C76A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C76C0: .4byte gObject_32x8
_080C76C4: .4byte gObject_8x32

	THUMB_FUNC_END sub_80C7680

	THUMB_FUNC_START sub_80C76C8
sub_80C76C8: @ 0x080C76C8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x10
	bhi _080C77BA
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	adds r6, r0, #0
	ldrh r0, [r5, #0x2a]
	subs r0, #0xc
	cmp r0, #4
	bhi _080C7770
	lsls r0, r0, #2
	ldr r1, _080C7704  @ _080C7708
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7704: .4byte _080C7708
_080C7708: @ jump table
	.4byte _080C771C @ case 0
	.4byte _080C7730 @ case 1
	.4byte _080C7750 @ case 2
	.4byte _080C7770 @ case 3
	.4byte _080C7790 @ case 4
_080C771C:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080C772C  @ 0x0600C800
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080C7782
	.align 2, 0
_080C772C: .4byte 0x0600C800
_080C7730:
	ldr r0, _080C7744  @ gUnknown_08ABC22C
	ldr r1, _080C7748  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080C774C  @ 0x0600C800
	b _080C777A
	.align 2, 0
_080C7744: .4byte gUnknown_08ABC22C
_080C7748: .4byte 0x06008000
_080C774C: .4byte 0x0600C800
_080C7750:
	ldr r0, _080C7768  @ gUnknown_08ABD174
	ldr r4, _080C776C  @ 0x0600C000
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080C7782
	.align 2, 0
_080C7768: .4byte gUnknown_08ABD174
_080C776C: .4byte 0x0600C000
_080C7770:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080C778C  @ 0x0600C000
_080C777A:
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_080C7782:
	movs r2, #0x88
	movs r3, #2
	bl sub_80C67D4
	b _080C77B8
	.align 2, 0
_080C778C: .4byte 0x0600C000
_080C7790:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080C7824  @ gUnknown_02021188
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r2, #0x88
	movs r3, #2
	bl sub_80C67D4
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundTileDataOffset
	ldr r0, _080C7828  @ gUnknown_08AA7034
	adds r1, r5, #0
	bl Proc_Start
_080C77B8:
	strh r6, [r5, #0x30]
_080C77BA:
	ldrh r0, [r5, #0x2a]
	subs r4, r0, #5
	cmp r4, #0
	blt _080C7830
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x90
	adds r3, r4, #0
	bl Interpolate
	adds r6, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	ldr r7, _080C782C  @ gGenericBuffer
	str r7, [sp]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r2, r2, r7
	mov r9, r2
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xc8
	movs r3, #1
	bl sub_80C689C
	movs r0, #0
	mov r8, r0
	strh r6, [r5, #0x32]
	cmp r4, #0x10
	bne _080C7830
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	str r7, [sp]
	mov r2, r9
	str r2, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0
	bl sub_80C689C
	mov r2, r8
	strh r2, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C7836
	.align 2, 0
_080C7824: .4byte gUnknown_02021188
_080C7828: .4byte gUnknown_08AA7034
_080C782C: .4byte gGenericBuffer
_080C7830:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C7836:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C76C8

	THUMB_FUNC_START sub_80C7844
sub_80C7844: @ 0x080C7844
	push {r4, lr}
	ldr r0, _080C78A0  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bls _080C7870
	ldr r2, _080C78A4  @ 0x0400000C
	ldrh r1, [r2]
	ldr r0, _080C78A8  @ 0x0000C0FF
	ands r0, r1
	movs r4, #0xf0
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080C78AC  @ 0x04000050
	ldr r2, _080C78B0  @ 0x00000C46
	adds r0, r2, #0
	strh r0, [r1]
_080C7870:
	ldr r1, _080C78B4  @ gUnknown_02022188
	movs r4, #8
	ldrsh r0, [r1, r4]
	cmp r3, r0
	beq _080C787E
	cmp r0, #0
	bne _080C7898
_080C787E:
	ldr r2, _080C78A4  @ 0x0400000C
	ldrh r1, [r2]
	ldr r0, _080C78A8  @ 0x0000C0FF
	ands r0, r1
	movs r3, #0xe8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080C78AC  @ 0x04000050
	ldr r4, _080C78B8  @ 0x00000C42
	adds r0, r4, #0
	strh r0, [r1]
_080C7898:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C78A0: .4byte 0x04000006
_080C78A4: .4byte 0x0400000C
_080C78A8: .4byte 0x0000C0FF
_080C78AC: .4byte 0x04000050
_080C78B0: .4byte 0x00000C46
_080C78B4: .4byte gUnknown_02022188
_080C78B8: .4byte 0x00000C42

	THUMB_FUNC_END sub_80C7844

	THUMB_FUNC_START sub_80C78BC
sub_80C78BC: @ 0x080C78BC
	push {lr}
	ldr r0, _080C78EC  @ 0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bls _080C78D6
	ldr r1, _080C78F0  @ 0x04000050
	ldr r3, _080C78F4  @ 0x00000C46
	adds r0, r3, #0
	strh r0, [r1]
_080C78D6:
	ldr r0, _080C78F8  @ gUnknown_02022188
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r2, r0
	bne _080C78E8
	ldr r1, _080C78F0  @ 0x04000050
	ldr r2, _080C78FC  @ 0x00000CCF
	adds r0, r2, #0
	strh r0, [r1]
_080C78E8:
	pop {r0}
	bx r0
	.align 2, 0
_080C78EC: .4byte 0x04000006
_080C78F0: .4byte 0x04000050
_080C78F4: .4byte 0x00000C46
_080C78F8: .4byte gUnknown_02022188
_080C78FC: .4byte 0x00000CCF

	THUMB_FUNC_END sub_80C78BC

	THUMB_FUNC_START sub_80C7900
sub_80C7900: @ 0x080C7900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	ldr r0, _080C79E4  @ sub_80C7844
	bl SetPrimaryHBlankHandler
	ldr r7, _080C79E8  @ gLCDControlBuffer
	ldrb r2, [r7, #1]
	movs r0, #0x20
	orrs r2, r0
	subs r0, #0x61
	ands r2, r0
	movs r0, #0x7f
	ands r2, r0
	ldr r1, _080C79EC  @ gUnknown_030030B4
	ldrb r3, [r1]
	movs r0, #1
	mov r9, r0
	mov r1, r9
	orrs r3, r1
	movs r6, #2
	orrs r3, r6
	movs r0, #4
	mov r8, r0
	mov r1, r8
	orrs r3, r1
	movs r5, #8
	orrs r3, r5
	movs r4, #0x10
	orrs r3, r4
	movs r0, #0x35
	adds r0, r0, r7
	mov ip, r0
	ldrb r0, [r0]
	mov r1, r9
	orrs r0, r1
	orrs r0, r6
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	mov r1, ip
	strb r0, [r1]
	movs r0, #0x36
	adds r0, r0, r7
	mov sl, r0
	ldrb r1, [r0]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	mov r1, r8
	orrs r0, r1
	orrs r0, r5
	orrs r0, r4
	mov r1, r9
	orrs r2, r1
	orrs r2, r6
	mov r1, r8
	orrs r2, r1
	orrs r2, r5
	orrs r2, r4
	strb r2, [r7, #1]
	movs r1, #0x20
	orrs r3, r1
	ldr r1, _080C79EC  @ gUnknown_030030B4
	strb r3, [r1]
	movs r1, #0x20
	orrs r0, r1
	mov r1, sl
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r4, #0
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	ldr r0, _080C79F0  @ gUnknown_02022188
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	ldr r0, [sp, #4]
	bl Proc_Break
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C79E4: .4byte sub_80C7844
_080C79E8: .4byte gLCDControlBuffer
_080C79EC: .4byte gUnknown_030030B4
_080C79F0: .4byte gUnknown_02022188

	THUMB_FUNC_END sub_80C7900

	THUMB_FUNC_START sub_80C79F4
sub_80C79F4: @ 0x080C79F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xf0
	bl Interpolate
	ldr r4, _080C7A6C  @ gUnknown_02022188
	movs r6, #0
	strh r0, [r4]
	ldrh r3, [r7, #0x2a]
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xa0
	bl Interpolate
	strh r0, [r4, #2]
	ldr r2, _080C7A70  @ gLCDControlBuffer
	adds r0, r2, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	ldrh r1, [r4]
	subs r0, #5
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r0, #0xe8
	ble _080C7A48
	movs r0, #0xe8
_080C7A48:
	cmp r1, #0x88
	ble _080C7A4E
	movs r1, #0x88
_080C7A4E:
	bl sub_80C7680
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x10
	bne _080C7A78
	ldr r0, _080C7A74  @ sub_80C78BC
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C7A7C
	.align 2, 0
_080C7A6C: .4byte gUnknown_02022188
_080C7A70: .4byte gLCDControlBuffer
_080C7A74: .4byte sub_80C78BC
_080C7A78:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C7A7C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C79F4

	THUMB_FUNC_START sub_80C7A84
sub_80C7A84: @ 0x080C7A84
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x78
	bl Interpolate
	ldr r1, _080C7AD0  @ gUnknown_02022188
	strh r0, [r1, #6]
	movs r0, #0xe8
	movs r1, #0x88
	bl sub_80C7680
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bls _080C7ABC
	ldr r3, _080C7AD4  @ gUnknown_08AA6BFA
	ldr r0, _080C7AD8  @ 0x00002046
	str r0, [sp]
	movs r0, #1
	movs r1, #0x98
	movs r2, #0x88
	bl PutSpriteExt
_080C7ABC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C7ADC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C7AE0
	.align 2, 0
_080C7AD0: .4byte gUnknown_02022188
_080C7AD4: .4byte gUnknown_08AA6BFA
_080C7AD8: .4byte 0x00002046
_080C7ADC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C7AE0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7A84

	THUMB_FUNC_START sub_80C7AE8
sub_80C7AE8: @ 0x080C7AE8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xe8
	movs r1, #0x88
	bl sub_80C7680
	ldr r3, _080C7B60  @ gUnknown_08AA6BFA
	ldr r0, _080C7B64  @ 0x0000205A
	str r0, [sp]
	movs r0, #1
	movs r1, #0x98
	movs r2, #0x88
	bl PutSpriteExt
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x38
	bne _080C7B74
	movs r0, #0
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x36]
	ldr r2, _080C7B68  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r6, _080C7B6C  @ 0x00007FFF
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r5, r0, #0
	ldr r2, _080C7B70  @ gBG2TilemapBuffer
	movs r7, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080C7B44:
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080C7B44
	adds r0, r4, #0
	bl Proc_Break
	b _080C7B78
	.align 2, 0
_080C7B60: .4byte gUnknown_08AA6BFA
_080C7B64: .4byte 0x0000205A
_080C7B68: .4byte gLCDControlBuffer
_080C7B6C: .4byte 0x00007FFF
_080C7B70: .4byte gBG2TilemapBuffer
_080C7B74:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C7B78:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7AE8

	THUMB_FUNC_START sub_80C7B80
sub_80C7B80: @ 0x080C7B80
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r6, #0x2a]
	cmp r0, #1
	bhi _080C7BA8
	ldr r3, _080C7CD0  @ gUnknown_08AA6BFA
	ldr r0, _080C7CD4  @ 0x00002046
	str r0, [sp]
	movs r0, #1
	movs r1, #0x98
	movs r2, #0x88
	bl PutSpriteExt
_080C7BA8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bhi _080C7BEC
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #0xa0
	bl Interpolate
	ldr r4, _080C7CD8  @ gUnknown_02022188
	strh r0, [r4, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r6, #0x2a]
	str r5, [sp]
	movs r0, #1
	movs r1, #0xe8
	bl Interpolate
	adds r5, r0, #0
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, #0x10
	adds r0, r5, #0
	bl sub_80C7680
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _080C7BEC
	movs r0, #0
	bl SetPrimaryHBlankHandler
_080C7BEC:
	ldrh r2, [r6, #0x2a]
	mov r8, r2
	mov r7, r8
	subs r7, #4
	cmp r7, #0
	blt _080C7CE4
	cmp r7, #0x18
	bgt _080C7C2E
	ldrh r1, [r6, #0x34]
	movs r2, #0xb8
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	adds r3, r7, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r6, r3]
	ldr r2, _080C7CDC  @ gUnknown_02021188
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0x88
	movs r3, #2
	bl sub_80C67D4
	strh r5, [r6, #0x30]
_080C7C2E:
	movs r0, #0xb
	negs r0, r0
	add r0, r8
	mov r9, r0
	cmp r0, #0
	blt _080C7CE4
	cmp r7, #0x18
	bne _080C7C5C
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
_080C7C5C:
	cmp r7, #0x17
	ble _080C7C88
	mov r3, r8
	subs r3, #0x1b
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C7C88:
	ldrh r1, [r6, #0x36]
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	mov r3, r9
	bl Interpolate
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	ldr r2, _080C7CE0  @ gGenericBuffer
	str r2, [sp]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r2, #0xc8
	movs r3, #0
	bl sub_80C689C
	strh r5, [r6, #0x32]
	mov r0, r9
	cmp r0, #0x18
	bne _080C7CE4
	strh r4, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080C7CEA
	.align 2, 0
_080C7CD0: .4byte gUnknown_08AA6BFA
_080C7CD4: .4byte 0x00002046
_080C7CD8: .4byte gUnknown_02022188
_080C7CDC: .4byte gUnknown_02021188
_080C7CE0: .4byte gGenericBuffer
_080C7CE4:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080C7CEA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7B80

	THUMB_FUNC_START sub_80C7CF8
sub_80C7CF8: @ 0x080C7CF8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #6
	bls _080C7D06
	b _080C7F80
_080C7D06:
	lsls r0, r0, #2
	ldr r1, _080C7D10  @ _080C7D14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7D10: .4byte _080C7D14
_080C7D14: @ jump table
	.4byte _080C7D30 @ case 0
	.4byte _080C7DEC @ case 1
	.4byte _080C7E18 @ case 2
	.4byte _080C7E48 @ case 3
	.4byte _080C7E84 @ case 4
	.4byte _080C7EA8 @ case 5
	.4byte _080C7EE4 @ case 6
_080C7D30:
	ldr r2, _080C7DDC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080C7DE0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C7DE4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C7DE8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	b _080C7F80
	.align 2, 0
_080C7DDC: .4byte gLCDControlBuffer
_080C7DE0: .4byte gBG0TilemapBuffer
_080C7DE4: .4byte gBG1TilemapBuffer
_080C7DE8: .4byte gBG2TilemapBuffer
_080C7DEC:
	ldr r4, _080C7E0C  @ gUnknown_08AC5614
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7E10  @ gUnknown_08AC8DDC
	ldr r1, _080C7E14  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C7F80
	.align 2, 0
_080C7E0C: .4byte gUnknown_08AC5614
_080C7E10: .4byte gUnknown_08AC8DDC
_080C7E14: .4byte gGenericBuffer
_080C7E18:
	ldr r4, _080C7E38  @ gUnknown_08AC7374
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080C7E3C  @ 0x06002000
	adds r1, r1, r2
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7E40  @ gUnknown_08AC91F8
	ldr r1, _080C7E44  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C7F80
	.align 2, 0
_080C7E38: .4byte gUnknown_08AC7374
_080C7E3C: .4byte 0x06002000
_080C7E40: .4byte gUnknown_08AC91F8
_080C7E44: .4byte gUnknown_02020988
_080C7E48:
	ldr r4, _080C7E74  @ gUnknown_08AC1DEC
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7E78  @ gUnknown_08AC2B24
	ldr r1, _080C7E7C  @ gUnknown_02021188
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7E80  @ gUnknown_08AC933C
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	b _080C7F80
	.align 2, 0
_080C7E74: .4byte gUnknown_08AC1DEC
_080C7E78: .4byte gUnknown_08AC2B24
_080C7E7C: .4byte gUnknown_02021188
_080C7E80: .4byte gUnknown_08AC933C
_080C7E84:
	ldr r0, _080C7E98  @ gUnknown_08AC4928
	ldr r1, _080C7E9C  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7EA0  @ gUnknown_08AC5420
	ldr r1, _080C7EA4  @ 0x0600C000
	bl CopyDataWithPossibleUncomp
	b _080C7F80
	.align 2, 0
_080C7E98: .4byte gUnknown_08AC4928
_080C7E9C: .4byte 0x06008000
_080C7EA0: .4byte gUnknown_08AC5420
_080C7EA4: .4byte 0x0600C000
_080C7EA8:
	ldr r0, _080C7ED4  @ gUnknown_08AC3BC8
	ldr r1, _080C7ED8  @ 0x0600A000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C7EDC  @ gUnknown_08AC4760
	ldr r4, _080C7EE0  @ 0x0600C800
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080C7EC4:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _080C7EC4
	b _080C7F80
	.align 2, 0
_080C7ED4: .4byte gUnknown_08AC3BC8
_080C7ED8: .4byte 0x0600A000
_080C7EDC: .4byte gUnknown_08AC4760
_080C7EE0: .4byte 0x0600C800
_080C7EE4:
	ldr r0, _080C7F6C  @ gUnknown_02021188
	movs r1, #0x80
	lsls r1, r1, #4
	adds r4, r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl CpuFastSet
	adds r7, r4, #0
	ldr r5, _080C7F70  @ 0x00000FFF
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r4, r2, #0
	adds r2, r7, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080C7F06:
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080C7F06
	ldr r1, _080C7F74  @ 0x0600F000
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r7, #0
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r2, _080C7F78  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r2, #0
	strh r2, [r6, #0x2a]
	strh r2, [r6, #0x30]
	strh r2, [r6, #0x32]
	ldr r1, _080C7F7C  @ gUnknown_02022188
	movs r0, #0xf0
	strh r0, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	adds r0, r6, #0
	bl Proc_Break
	b _080C7F86
	.align 2, 0
_080C7F6C: .4byte gUnknown_02021188
_080C7F70: .4byte 0x00000FFF
_080C7F74: .4byte 0x0600F000
_080C7F78: .4byte gLCDControlBuffer
_080C7F7C: .4byte gUnknown_02022188
_080C7F80:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080C7F86:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7CF8

	THUMB_FUNC_START sub_80C7F90
sub_80C7F90: @ 0x080C7F90
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x10
	bhi _080C807A
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x68
	bl Interpolate
	adds r6, r0, #0
	ldrh r0, [r5, #0x2a]
	subs r0, #0xc
	cmp r0, #4
	bhi _080C8038
	lsls r0, r0, #2
	ldr r1, _080C7FCC  @ _080C7FD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7FCC: .4byte _080C7FD0
_080C7FD0: @ jump table
	.4byte _080C7FE4 @ case 0
	.4byte _080C7FF8 @ case 1
	.4byte _080C8018 @ case 2
	.4byte _080C8038 @ case 3
	.4byte _080C8058 @ case 4
_080C7FE4:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080C7FF4  @ 0x0600C800
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080C804A
	.align 2, 0
_080C7FF4: .4byte 0x0600C800
_080C7FF8:
	ldr r0, _080C800C  @ gUnknown_08AC2CB4
	ldr r1, _080C8010  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080C8014  @ 0x0600C800
	b _080C8042
	.align 2, 0
_080C800C: .4byte gUnknown_08AC2CB4
_080C8010: .4byte 0x06008000
_080C8014: .4byte 0x0600C800
_080C8018:
	ldr r0, _080C8030  @ gUnknown_08AC3A2C
	ldr r4, _080C8034  @ 0x0600C000
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080C804A
	.align 2, 0
_080C8030: .4byte gUnknown_08AC3A2C
_080C8034: .4byte 0x0600C000
_080C8038:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080C8054  @ 0x0600C000
_080C8042:
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_080C804A:
	movs r2, #0x98
	movs r3, #2
	bl sub_80C689C
	b _080C8078
	.align 2, 0
_080C8054: .4byte 0x0600C000
_080C8058:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080C80E4  @ gUnknown_02021188
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r2, #0x98
	movs r3, #2
	bl sub_80C689C
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundTileDataOffset
_080C8078:
	strh r6, [r5, #0x30]
_080C807A:
	ldrh r0, [r5, #0x2a]
	subs r4, r0, #5
	cmp r4, #0
	blt _080C80EC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xcc
	adds r3, r4, #0
	bl Interpolate
	adds r6, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	ldr r7, _080C80E8  @ gGenericBuffer
	str r7, [sp]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r2, r2, r7
	mov r9, r2
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xc0
	movs r3, #1
	bl sub_80C67D4
	movs r0, #0
	mov r8, r0
	strh r6, [r5, #0x32]
	cmp r4, #0x10
	bne _080C80EC
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	str r7, [sp]
	mov r2, r9
	str r2, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0
	bl sub_80C67D4
	mov r2, r8
	strh r2, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C80F2
	.align 2, 0
_080C80E4: .4byte gUnknown_02021188
_080C80E8: .4byte gGenericBuffer
_080C80EC:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C80F2:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7F90

	THUMB_FUNC_START sub_80C8100
sub_80C8100: @ 0x080C8100
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080C8178  @ sub_80C7844
	bl SetPrimaryHBlankHandler
	ldr r2, _080C817C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
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
	ldr r0, _080C8180  @ gUnknown_02022188
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r4, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8178: .4byte sub_80C7844
_080C817C: .4byte gLCDControlBuffer
_080C8180: .4byte gUnknown_02022188

	THUMB_FUNC_END sub_80C8100

	THUMB_FUNC_START sub_80C8184
sub_80C8184: @ 0x080C8184
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0xf0
	movs r2, #0
	bl Interpolate
	ldr r4, _080C81FC  @ gUnknown_02022188
	movs r6, #0
	strh r0, [r4]
	ldrh r3, [r7, #0x2a]
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xa0
	bl Interpolate
	strh r0, [r4, #2]
	ldr r2, _080C8200  @ gLCDControlBuffer
	ldrh r0, [r4]
	adds r1, r2, #0
	adds r1, #0x2d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r6, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r0, #7
	bgt _080C81DA
	movs r0, #8
_080C81DA:
	cmp r1, #0x88
	ble _080C81E0
	movs r1, #0x88
_080C81E0:
	bl sub_80C7680
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x10
	bne _080C8208
	ldr r0, _080C8204  @ sub_80C78BC
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C820C
	.align 2, 0
_080C81FC: .4byte gUnknown_02022188
_080C8200: .4byte gLCDControlBuffer
_080C8204: .4byte sub_80C78BC
_080C8208:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C820C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8184

	THUMB_FUNC_START sub_80C8214
sub_80C8214: @ 0x080C8214
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x78
	bl Interpolate
	ldr r1, _080C8260  @ gUnknown_02022188
	strh r0, [r1, #6]
	movs r0, #8
	movs r1, #0x88
	bl sub_80C7680
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bls _080C824C
	ldr r3, _080C8264  @ gUnknown_08AA6C0E
	ldr r0, _080C8268  @ 0x0000206E
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
_080C824C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C826C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C8270
	.align 2, 0
_080C8260: .4byte gUnknown_02022188
_080C8264: .4byte gUnknown_08AA6C0E
_080C8268: .4byte 0x0000206E
_080C826C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C8270:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8214

	THUMB_FUNC_START sub_80C8278
sub_80C8278: @ 0x080C8278
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #8
	movs r1, #0x88
	bl sub_80C7680
	ldr r3, _080C82A8  @ gUnknown_08AA6C0E
	ldr r0, _080C82AC  @ 0x0000207C
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
	ldrh r0, [r5, #0x2a]
	cmp r0, #1
	beq _080C82C8
	cmp r0, #1
	bgt _080C82B0
	cmp r0, #0
	beq _080C82B6
	b _080C82EA
	.align 2, 0
_080C82A8: .4byte gUnknown_08AA6C0E
_080C82AC: .4byte 0x0000207C
_080C82B0:
	cmp r0, #2
	beq _080C82DA
	b _080C82EA
_080C82B6:
	movs r4, #0
_080C82B8:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80C71E4
	adds r4, #1
	cmp r4, #7
	ble _080C82B8
	b _080C82EA
_080C82C8:
	movs r4, #8
_080C82CA:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80C71E4
	adds r4, #1
	cmp r4, #0xf
	ble _080C82CA
	b _080C82EA
_080C82DA:
	movs r4, #0x10
_080C82DC:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80C71E4
	adds r4, #1
	cmp r4, #0x15
	ble _080C82DC
_080C82EA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x38
	bne _080C8350
	movs r0, #0
	strh r0, [r5, #0x2a]
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x34]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x36]
	ldr r2, _080C8344  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r6, _080C8348  @ 0x00007FFF
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r3, r0, #0
	ldr r2, _080C834C  @ gBG2TilemapBuffer
	movs r7, #0
	movs r4, #0xa0
	lsls r4, r4, #2
_080C8328:
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bne _080C8328
	adds r0, r5, #0
	bl Proc_Break
	b _080C8354
	.align 2, 0
_080C8344: .4byte gLCDControlBuffer
_080C8348: .4byte 0x00007FFF
_080C834C: .4byte gBG2TilemapBuffer
_080C8350:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8354:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8278

	THUMB_FUNC_START sub_80C835C
sub_80C835C: @ 0x080C835C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r6, #0x2a]
	cmp r0, #1
	bhi _080C8384
	ldr r3, _080C84B0  @ gUnknown_08AA6C0E
	ldr r0, _080C84B4  @ 0x0000206E
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
_080C8384:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bhi _080C83C6
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #0xa0
	bl Interpolate
	ldr r4, _080C84B8  @ gUnknown_02022188
	strh r0, [r4, #6]
	ldrh r3, [r6, #0x2a]
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, #0x10
	adds r0, r5, #0
	bl sub_80C7680
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _080C83C6
	movs r0, #0
	bl SetPrimaryHBlankHandler
_080C83C6:
	ldrh r2, [r6, #0x2a]
	mov r8, r2
	mov r7, r8
	subs r7, #4
	cmp r7, #0
	blt _080C84C4
	cmp r7, #0x18
	bgt _080C8408
	ldrh r1, [r6, #0x34]
	movs r2, #0xac
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	adds r3, r7, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r6, r3]
	ldr r2, _080C84BC  @ gUnknown_02021188
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0x98
	movs r3, #2
	bl sub_80C689C
	strh r5, [r6, #0x30]
_080C8408:
	movs r0, #0xb
	negs r0, r0
	add r0, r8
	mov r9, r0
	cmp r0, #0
	blt _080C84C4
	cmp r7, #0x18
	bne _080C8436
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
_080C8436:
	cmp r7, #0x17
	ble _080C8462
	mov r3, r8
	subs r3, #0x1b
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C8462:
	ldrh r1, [r6, #0x36]
	movs r2, #0xde
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	mov r3, r9
	bl Interpolate
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	ldr r2, _080C84C0  @ gGenericBuffer
	str r2, [sp]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r2, #0xc0
	movs r3, #0
	bl sub_80C67D4
	strh r5, [r6, #0x32]
	mov r0, r9
	cmp r0, #0x18
	bne _080C84C4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	strh r4, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080C84CA
	.align 2, 0
_080C84B0: .4byte gUnknown_08AA6C0E
_080C84B4: .4byte 0x0000206E
_080C84B8: .4byte gUnknown_02022188
_080C84BC: .4byte gUnknown_02021188
_080C84C0: .4byte gGenericBuffer
_080C84C4:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080C84CA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C835C

	THUMB_FUNC_START sub_80C84D8
sub_80C84D8: @ 0x080C84D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0
	bne _080C851C
	ldr r2, _080C8544  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
_080C851C:
	ldrh r3, [r4, #0x2a]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r1, _080C8544  @ gLCDControlBuffer
	adds r1, #0x46
	strb r0, [r1]
	ldrh r0, [r4, #0x2a]
	cmp r0, #8
	bne _080C8548
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C854C
	.align 2, 0
_080C8544: .4byte gLCDControlBuffer
_080C8548:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C854C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C84D8

	THUMB_FUNC_START sub_80C8554
sub_80C8554: @ 0x080C8554
	ldr r1, _080C8560  @ gLCDControlBuffer
	ldrh r0, [r1, #0x28]
	adds r0, #2
	strh r0, [r1, #0x28]
	bx lr
	.align 2, 0
_080C8560: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C8554

	THUMB_FUNC_START sub_80C8564
sub_80C8564: @ 0x080C8564
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x46
	ldrb r0, [r0]
	bl sub_80C72A4
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80C726C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8564

	THUMB_FUNC_START sub_80C8580
sub_80C8580: @ 0x080C8580
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0xe
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8580

	THUMB_FUNC_START sub_80C85B0
sub_80C85B0: @ 0x080C85B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0xe
	movs r2, #0
	bl Interpolate
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #8
	movs r2, #8
	bl SetSpecialColorEffectsParameters
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	bne _080C85EE
	adds r0, r5, #0
	bl Proc_Break
	b _080C85F2
_080C85EE:
	adds r0, r1, #1
	strh r0, [r4]
_080C85F2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C85B0

	THUMB_FUNC_START sub_80C85FC
sub_80C85FC: @ 0x080C85FC
	push {lr}
	bl SetDefaultColorEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C85FC

	THUMB_FUNC_START sub_80C8608
sub_80C8608: @ 0x080C8608
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8608

	THUMB_FUNC_START sub_80C8638
sub_80C8638: @ 0x080C8638
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc
	bl Interpolate
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #8
	movs r2, #8
	bl SetSpecialColorEffectsParameters
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	bne _080C8676
	adds r0, r5, #0
	bl Proc_Break
	b _080C867A
_080C8676:
	adds r0, r1, #1
	strh r0, [r4]
_080C867A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8638

	THUMB_FUNC_START sub_80C8684
sub_80C8684: @ 0x080C8684
	push {lr}
	bl SetDefaultColorEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8684

	THUMB_FUNC_START sub_80C8690
sub_80C8690: @ 0x080C8690
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	subs r0, #1
	cmp r0, #5
	bls _080C86C8
	b _080C8802
_080C86C8:
	lsls r0, r0, #2
	ldr r1, _080C86D4  @ _080C86D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C86D4: .4byte _080C86D8
_080C86D8: @ jump table
	.4byte _080C86F0 @ case 0
	.4byte _080C8740 @ case 1
	.4byte _080C876C @ case 2
	.4byte _080C879C @ case 3
	.4byte _080C87CC @ case 4
	.4byte _080C87E0 @ case 5
_080C86F0:
	ldr r4, _080C8730  @ gUnknown_08AB8CCC
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8734  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8738  @ gUnknown_08AB942C
	ldr r4, _080C873C  @ gBG3TilemapBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r3, #0xe1
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C8718:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C8718
	movs r0, #8
	bl BG_EnableSyncByMask
	b _080C8802
	.align 2, 0
_080C8730: .4byte gUnknown_08AB8CCC
_080C8734: .4byte 0x06002000
_080C8738: .4byte gUnknown_08AB942C
_080C873C: .4byte gBG3TilemapBuffer
_080C8740:
	ldr r4, _080C8760  @ gUnknown_08AC949C
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8764  @ gUnknown_08ACBF58
	ldr r1, _080C8768  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C8802
	.align 2, 0
_080C8760: .4byte gUnknown_08AC949C
_080C8764: .4byte gUnknown_08ACBF58
_080C8768: .4byte gGenericBuffer
_080C876C:
	ldr r4, _080C878C  @ gUnknown_08ACAF70
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r3, _080C8790  @ 0x06002000
	adds r1, r1, r3
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8794  @ gUnknown_08ACC340
	ldr r1, _080C8798  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C8802
	.align 2, 0
_080C878C: .4byte gUnknown_08ACAF70
_080C8790: .4byte 0x06002000
_080C8794: .4byte gUnknown_08ACC340
_080C8798: .4byte gUnknown_02020988
_080C879C:
	ldr r0, _080C87BC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C87C0  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C87C4  @ 0x0600D800
	ldr r2, _080C87C8  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
	b _080C8802
	.align 2, 0
_080C87BC: .4byte gBG0TilemapBuffer
_080C87C0: .4byte gBG1TilemapBuffer
_080C87C4: .4byte 0x0600D800
_080C87C8: .4byte 0x01000400
_080C87CC:
	ldr r0, _080C87D8  @ gUnknown_08AF312C
	ldr r1, _080C87DC  @ 0x06004000
	bl CopyDataWithPossibleUncomp
	b _080C8802
	.align 2, 0
_080C87D8: .4byte gUnknown_08AF312C
_080C87DC: .4byte 0x06004000
_080C87E0:
	ldr r0, _080C8820  @ gUnknown_08AF404C
	ldr r4, _080C8824  @ 0x0600F000
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0x80
	lsls r0, r0, #8
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C87F4:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080C87F4
_080C8802:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8830
	ldr r0, _080C8828  @ gUnknown_08AA705C
	bl Proc_EndEach
	ldr r0, _080C882C  @ gUnknown_08AA707C
	bl Proc_EndEach
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8834
	.align 2, 0
_080C8820: .4byte gUnknown_08AF404C
_080C8824: .4byte 0x0600F000
_080C8828: .4byte gUnknown_08AA705C
_080C882C: .4byte gUnknown_08AA707C
_080C8830:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8834:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8690

	THUMB_FUNC_START sub_80C883C
sub_80C883C: @ 0x080C883C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C88AC
	cmp r0, #2
	bgt _080C887A
	cmp r0, #1
	beq _080C8880
	b _080C88FA
_080C887A:
	cmp r0, #3
	beq _080C88DC
	b _080C88FA
_080C8880:
	ldr r4, _080C88A0  @ gUnknown_08ACC540
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C88A4  @ gUnknown_08ACEED0
	ldr r1, _080C88A8  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C88FA
	.align 2, 0
_080C88A0: .4byte gUnknown_08ACC540
_080C88A4: .4byte gUnknown_08ACEED0
_080C88A8: .4byte gGenericBuffer
_080C88AC:
	ldr r4, _080C88CC  @ gUnknown_08ACE0B8
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C88D0  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C88D4  @ gUnknown_08ACF200
	ldr r1, _080C88D8  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C88FA
	.align 2, 0
_080C88CC: .4byte gUnknown_08ACE0B8
_080C88D0: .4byte 0x06002000
_080C88D4: .4byte gUnknown_08ACF200
_080C88D8: .4byte gUnknown_02020988
_080C88DC:
	ldr r0, _080C8914  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8918  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C891C  @ 0x0600D800
	ldr r2, _080C8920  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C88FA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8928
	ldr r0, _080C8924  @ gUnknown_08AA705C
	bl Proc_EndEach
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C892C
	.align 2, 0
_080C8914: .4byte gBG0TilemapBuffer
_080C8918: .4byte gBG1TilemapBuffer
_080C891C: .4byte 0x0600D800
_080C8920: .4byte 0x01000400
_080C8924: .4byte gUnknown_08AA705C
_080C8928:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C892C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C883C

	THUMB_FUNC_START sub_80C8934
sub_80C8934: @ 0x080C8934
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C89A4
	cmp r0, #2
	bgt _080C8972
	cmp r0, #1
	beq _080C8978
	b _080C89F2
_080C8972:
	cmp r0, #3
	beq _080C89D4
	b _080C89F2
_080C8978:
	ldr r4, _080C8998  @ gUnknown_08ACF474
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C899C  @ gUnknown_08AD206C
	ldr r1, _080C89A0  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C89F2
	.align 2, 0
_080C8998: .4byte gUnknown_08ACF474
_080C899C: .4byte gUnknown_08AD206C
_080C89A0: .4byte gGenericBuffer
_080C89A4:
	ldr r4, _080C89C4  @ gUnknown_08AD1048
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C89C8  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C89CC  @ gUnknown_08AD236C
	ldr r1, _080C89D0  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C89F2
	.align 2, 0
_080C89C4: .4byte gUnknown_08AD1048
_080C89C8: .4byte 0x06002000
_080C89CC: .4byte gUnknown_08AD236C
_080C89D0: .4byte gUnknown_02020988
_080C89D4:
	ldr r0, _080C8A04  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8A08  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8A0C  @ 0x0600D800
	ldr r2, _080C8A10  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C89F2:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8A14
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8A18
	.align 2, 0
_080C8A04: .4byte gBG0TilemapBuffer
_080C8A08: .4byte gBG1TilemapBuffer
_080C8A0C: .4byte 0x0600D800
_080C8A10: .4byte 0x01000400
_080C8A14:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8A18:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8934

	THUMB_FUNC_START sub_80C8A20
sub_80C8A20: @ 0x080C8A20
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C8A90
	cmp r0, #2
	bgt _080C8A5E
	cmp r0, #1
	beq _080C8A64
	b _080C8ADE
_080C8A5E:
	cmp r0, #3
	beq _080C8AC0
	b _080C8ADE
_080C8A64:
	ldr r4, _080C8A84  @ gUnknown_08AD2614
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8A88  @ gUnknown_08AD5094
	ldr r1, _080C8A8C  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C8ADE
	.align 2, 0
_080C8A84: .4byte gUnknown_08AD2614
_080C8A88: .4byte gUnknown_08AD5094
_080C8A8C: .4byte gGenericBuffer
_080C8A90:
	ldr r4, _080C8AB0  @ gUnknown_08AD423C
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8AB4  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8AB8  @ gUnknown_08AD543C
	ldr r1, _080C8ABC  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C8ADE
	.align 2, 0
_080C8AB0: .4byte gUnknown_08AD423C
_080C8AB4: .4byte 0x06002000
_080C8AB8: .4byte gUnknown_08AD543C
_080C8ABC: .4byte gUnknown_02020988
_080C8AC0:
	ldr r0, _080C8AF0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8AF4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8AF8  @ 0x0600D800
	ldr r2, _080C8AFC  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C8ADE:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8B00
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8B04
	.align 2, 0
_080C8AF0: .4byte gBG0TilemapBuffer
_080C8AF4: .4byte gBG1TilemapBuffer
_080C8AF8: .4byte 0x0600D800
_080C8AFC: .4byte 0x01000400
_080C8B00:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8B04:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8A20

	THUMB_FUNC_START sub_80C8B0C
sub_80C8B0C: @ 0x080C8B0C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C8B7C
	cmp r0, #2
	bgt _080C8B4A
	cmp r0, #1
	beq _080C8B50
	b _080C8BCA
_080C8B4A:
	cmp r0, #3
	beq _080C8BAC
	b _080C8BCA
_080C8B50:
	ldr r4, _080C8B70  @ gUnknown_08AD563C
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8B74  @ gUnknown_08AD8518
	ldr r1, _080C8B78  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C8BCA
	.align 2, 0
_080C8B70: .4byte gUnknown_08AD563C
_080C8B74: .4byte gUnknown_08AD8518
_080C8B78: .4byte gGenericBuffer
_080C8B7C:
	ldr r4, _080C8B9C  @ gUnknown_08AD72FC
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8BA0  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8BA4  @ gUnknown_08AD88D4
	ldr r1, _080C8BA8  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C8BCA
	.align 2, 0
_080C8B9C: .4byte gUnknown_08AD72FC
_080C8BA0: .4byte 0x06002000
_080C8BA4: .4byte gUnknown_08AD88D4
_080C8BA8: .4byte gUnknown_02020988
_080C8BAC:
	ldr r0, _080C8BDC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8BE0  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8BE4  @ 0x0600D800
	ldr r2, _080C8BE8  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C8BCA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8BEC
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8BF0
	.align 2, 0
_080C8BDC: .4byte gBG0TilemapBuffer
_080C8BE0: .4byte gBG1TilemapBuffer
_080C8BE4: .4byte 0x0600D800
_080C8BE8: .4byte 0x01000400
_080C8BEC:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8BF0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8B0C

	THUMB_FUNC_START sub_80C8BF8
sub_80C8BF8: @ 0x080C8BF8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C8C68
	cmp r0, #2
	bgt _080C8C36
	cmp r0, #1
	beq _080C8C3C
	b _080C8CB6
_080C8C36:
	cmp r0, #3
	beq _080C8C98
	b _080C8CB6
_080C8C3C:
	ldr r4, _080C8C5C  @ gUnknown_08AD8B08
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8C60  @ gUnknown_08ADB804
	ldr r1, _080C8C64  @ gGenericBuffer
	bl CopyDataWithPossibleUncomp
	b _080C8CB6
	.align 2, 0
_080C8C5C: .4byte gUnknown_08AD8B08
_080C8C60: .4byte gUnknown_08ADB804
_080C8C64: .4byte gGenericBuffer
_080C8C68:
	ldr r4, _080C8C88  @ gUnknown_08ADA31C
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8C8C  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8C90  @ gUnknown_08ADBC0C
	ldr r1, _080C8C94  @ gUnknown_02020988
	bl CopyDataWithPossibleUncomp
	b _080C8CB6
	.align 2, 0
_080C8C88: .4byte gUnknown_08ADA31C
_080C8C8C: .4byte 0x06002000
_080C8C90: .4byte gUnknown_08ADBC0C
_080C8C94: .4byte gUnknown_02020988
_080C8C98:
	ldr r0, _080C8CC8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8CCC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8CD0  @ 0x0600D800
	ldr r2, _080C8CD4  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C8CB6:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8CD8
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8CDC
	.align 2, 0
_080C8CC8: .4byte gBG0TilemapBuffer
_080C8CCC: .4byte gBG1TilemapBuffer
_080C8CD0: .4byte 0x0600D800
_080C8CD4: .4byte 0x01000400
_080C8CD8:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8CDC:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8BF8

	THUMB_FUNC_START sub_80C8CE4
sub_80C8CE4: @ 0x080C8CE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80C726C
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x28
	bne _080C8D24
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C8D28
_080C8D24:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C8D28:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8CE4

	THUMB_FUNC_START sub_80C8D30
sub_80C8D30: @ 0x080C8D30
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x3e]
	movs r1, #0x4c
	bl DivRem
	adds r4, r0, #0
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	adds r3, r4, #0
	bl Interpolate
	adds r4, r0, #0
	cmp r4, #0xc
	bgt _080C8D66
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C8D78
_080C8D66:
	movs r1, #0x19
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C8D78:
	ldrh r0, [r7, #0x3e]
	adds r0, #1
	strh r0, [r7, #0x3e]
	ldr r0, _080C8DC4  @ gUnknown_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	ldrh r3, [r7, #0x2a]
	movs r0, #0x26
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0
	bl Interpolate
	ldr r5, _080C8DC8  @ gPaletteBuffer
	lsls r6, r0, #0x10
	movs r4, #7
_080C8DA0:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r6, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080C8DA0
	ldrh r0, [r7, #0x2a]
	subs r0, #1
	cmp r0, #4
	bhi _080C8EA0
	lsls r0, r0, #2
	ldr r1, _080C8DCC  @ _080C8DD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8DC4: .4byte gUnknown_08B103D8
_080C8DC8: .4byte gPaletteBuffer
_080C8DCC: .4byte _080C8DD0
_080C8DD0: @ jump table
	.4byte _080C8EA0 @ case 0
	.4byte _080C8DE4 @ case 1
	.4byte _080C8E1C @ case 2
	.4byte _080C8E50 @ case 3
	.4byte _080C8E84 @ case 4
_080C8DE4:
	ldr r4, _080C8E18  @ gUnknown_08ADBE78
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	b _080C8EA0
	.align 2, 0
_080C8E18: .4byte gUnknown_08ADBE78
_080C8E1C:
	ldr r0, _080C8E3C  @ gUnknown_08ADBE98
	ldr r1, _080C8E40  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8E44  @ gUnknown_08ADC708
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C8E48  @ gUnknown_08ADC3C0
	ldr r1, _080C8E4C  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C8EA0
	.align 2, 0
_080C8E3C: .4byte gUnknown_08ADBE98
_080C8E40: .4byte 0x06010000
_080C8E44: .4byte gUnknown_08ADC708
_080C8E48: .4byte gUnknown_08ADC3C0
_080C8E4C: .4byte 0x06010F00
_080C8E50:
	ldr r0, _080C8E70  @ gUnknown_08ADC728
	ldr r1, _080C8E74  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8E78  @ gUnknown_08ADD050
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C8E7C  @ gUnknown_08ADCCB8
	ldr r1, _080C8E80  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C8EA0
	.align 2, 0
_080C8E70: .4byte gUnknown_08ADC728
_080C8E74: .4byte 0x06011E00
_080C8E78: .4byte gUnknown_08ADD050
_080C8E7C: .4byte gUnknown_08ADCCB8
_080C8E80: .4byte 0x06012D00
_080C8E84:
	ldr r0, _080C8EB4  @ gUnknown_08ADD070
	ldr r1, _080C8EB8  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8EBC  @ gUnknown_08ADDA54
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C8EC0  @ gUnknown_08ADD6EC
	ldr r1, _080C8EC4  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
_080C8EA0:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x26
	bne _080C8EC8
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C8ECC
	.align 2, 0
_080C8EB4: .4byte gUnknown_08ADD070
_080C8EB8: .4byte 0x06013C00
_080C8EBC: .4byte gUnknown_08ADDA54
_080C8EC0: .4byte gUnknown_08ADD6EC
_080C8EC4: .4byte 0x06014B00
_080C8EC8:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C8ECC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8D30

	THUMB_FUNC_START sub_80C8ED4
sub_80C8ED4: @ 0x080C8ED4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0x12
	bl DivRem
	adds r3, r0, #0
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C8F08
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C8F1A
_080C8F08:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C8F1A:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C8F6C
	cmp r0, #2
	bgt _080C8F30
	cmp r0, #1
	beq _080C8F3A
	b _080C8FF0
_080C8F30:
	cmp r0, #3
	beq _080C8FA0
	cmp r0, #4
	beq _080C8FD4
	b _080C8FF0
_080C8F3A:
	ldr r0, _080C8F58  @ gUnknown_08ADDA74
	ldr r1, _080C8F5C  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8F60  @ gUnknown_08ADE47C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C8F64  @ gUnknown_08ADE080
	ldr r1, _080C8F68  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C8FF0
	.align 2, 0
_080C8F58: .4byte gUnknown_08ADDA74
_080C8F5C: .4byte 0x06010000
_080C8F60: .4byte gUnknown_08ADE47C
_080C8F64: .4byte gUnknown_08ADE080
_080C8F68: .4byte 0x06010F00
_080C8F6C:
	ldr r0, _080C8F8C  @ gUnknown_08ADEEF4
	ldr r1, _080C8F90  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8F94  @ gUnknown_08ADFA08
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C8F98  @ gUnknown_08ADF58C
	ldr r1, _080C8F9C  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C8FF0
	.align 2, 0
_080C8F8C: .4byte gUnknown_08ADEEF4
_080C8F90: .4byte 0x06011E00
_080C8F94: .4byte gUnknown_08ADFA08
_080C8F98: .4byte gUnknown_08ADF58C
_080C8F9C: .4byte 0x06012D00
_080C8FA0:
	ldr r0, _080C8FC0  @ gUnknown_08ADE49C
	ldr r1, _080C8FC4  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C8FC8  @ gUnknown_08ADEED4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C8FCC  @ gUnknown_08ADEB1C
	ldr r1, _080C8FD0  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
	b _080C8FF0
	.align 2, 0
_080C8FC0: .4byte gUnknown_08ADE49C
_080C8FC4: .4byte 0x06013C00
_080C8FC8: .4byte gUnknown_08ADEED4
_080C8FCC: .4byte gUnknown_08ADEB1C
_080C8FD0: .4byte 0x06014B00
_080C8FD4:
	ldr r0, _080C9004  @ gUnknown_08ADFA28
	ldr r1, _080C9008  @ 0x06015A00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C900C  @ gUnknown_08AE04D4
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9010  @ gUnknown_08AE00E4
	ldr r1, _080C9014  @ 0x06016900
	bl CopyDataWithPossibleUncomp
_080C8FF0:
	ldrh r0, [r4, #0x2a]
	cmp r0, #7
	bne _080C9018
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C901C
	.align 2, 0
_080C9004: .4byte gUnknown_08ADFA28
_080C9008: .4byte 0x06015A00
_080C900C: .4byte gUnknown_08AE04D4
_080C9010: .4byte gUnknown_08AE00E4
_080C9014: .4byte 0x06016900
_080C9018:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C901C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8ED4

	THUMB_FUNC_START sub_80C9024
sub_80C9024: @ 0x080C9024
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xe
	bl DivRem
	adds r3, r0, #0
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9058
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C906A
_080C9058:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C906A:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C907C
	cmp r0, #2
	beq _080C90B0
	b _080C90CC
_080C907C:
	ldr r0, _080C909C  @ gUnknown_08AE04F4
	ldr r1, _080C90A0  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C90A4  @ gUnknown_08AE0D74
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C90A8  @ gUnknown_08AE0A48
	ldr r1, _080C90AC  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C90CC
	.align 2, 0
_080C909C: .4byte gUnknown_08AE04F4
_080C90A0: .4byte 0x06010000
_080C90A4: .4byte gUnknown_08AE0D74
_080C90A8: .4byte gUnknown_08AE0A48
_080C90AC: .4byte 0x06010F00
_080C90B0:
	ldr r0, _080C90E0  @ gUnknown_08AE0D94
	ldr r1, _080C90E4  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C90E8  @ gUnknown_08AE1634
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C90EC  @ gUnknown_08AE12BC
	ldr r1, _080C90F0  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
_080C90CC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #8
	bne _080C90F4
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C90F8
	.align 2, 0
_080C90E0: .4byte gUnknown_08AE0D94
_080C90E4: .4byte 0x06011E00
_080C90E8: .4byte gUnknown_08AE1634
_080C90EC: .4byte gUnknown_08AE12BC
_080C90F0: .4byte 0x06012D00
_080C90F4:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C90F8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9024

	THUMB_FUNC_START sub_80C9100
sub_80C9100: @ 0x080C9100
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xc
	bl DivRem
	adds r3, r0, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9134
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9146
_080C9134:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9146:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C9194
	cmp r0, #2
	bgt _080C915C
	cmp r0, #1
	beq _080C9162
	b _080C91E4
_080C915C:
	cmp r0, #3
	beq _080C91C8
	b _080C91E4
_080C9162:
	ldr r0, _080C9180  @ gUnknown_08AE1654
	ldr r1, _080C9184  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9188  @ gUnknown_08AE20C4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C918C  @ gUnknown_08AE1D00
	ldr r1, _080C9190  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C91E4
	.align 2, 0
_080C9180: .4byte gUnknown_08AE1654
_080C9184: .4byte 0x06010000
_080C9188: .4byte gUnknown_08AE20C4
_080C918C: .4byte gUnknown_08AE1D00
_080C9190: .4byte 0x06010F00
_080C9194:
	ldr r0, _080C91B4  @ gUnknown_08AE20E4
	ldr r1, _080C91B8  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C91BC  @ gUnknown_08AE2BF4
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C91C0  @ gUnknown_08AE281C
	ldr r1, _080C91C4  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C91E4
	.align 2, 0
_080C91B4: .4byte gUnknown_08AE20E4
_080C91B8: .4byte 0x06011E00
_080C91BC: .4byte gUnknown_08AE2BF4
_080C91C0: .4byte gUnknown_08AE281C
_080C91C4: .4byte 0x06012D00
_080C91C8:
	ldr r0, _080C91F8  @ gUnknown_08AE2C14
	ldr r1, _080C91FC  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9200  @ gUnknown_08AE3734
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9204  @ gUnknown_08AE33D4
	ldr r1, _080C9208  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
_080C91E4:
	ldrh r0, [r4, #0x2a]
	cmp r0, #9
	bne _080C920C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9210
	.align 2, 0
_080C91F8: .4byte gUnknown_08AE2C14
_080C91FC: .4byte 0x06013C00
_080C9200: .4byte gUnknown_08AE3734
_080C9204: .4byte gUnknown_08AE33D4
_080C9208: .4byte 0x06014B00
_080C920C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9210:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9100

	THUMB_FUNC_START sub_80C9218
sub_80C9218: @ 0x080C9218
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xa
	bl DivRem
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C924C
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C925E
_080C924C:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C925E:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C92AC
	cmp r0, #2
	bgt _080C9274
	cmp r0, #1
	beq _080C927A
	b _080C92FC
_080C9274:
	cmp r0, #3
	beq _080C92E0
	b _080C92FC
_080C927A:
	ldr r0, _080C9298  @ gUnknown_08AE3754
	ldr r1, _080C929C  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C92A0  @ gUnknown_08AE41E4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C92A4  @ gUnknown_08AE3E54
	ldr r1, _080C92A8  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C92FC
	.align 2, 0
_080C9298: .4byte gUnknown_08AE3754
_080C929C: .4byte 0x06010000
_080C92A0: .4byte gUnknown_08AE41E4
_080C92A4: .4byte gUnknown_08AE3E54
_080C92A8: .4byte 0x06010F00
_080C92AC:
	ldr r0, _080C92CC  @ gUnknown_08AE4204
	ldr r1, _080C92D0  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C92D4  @ gUnknown_08AE4CE8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C92D8  @ gUnknown_08AE4940
	ldr r1, _080C92DC  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C92FC
	.align 2, 0
_080C92CC: .4byte gUnknown_08AE4204
_080C92D0: .4byte 0x06011E00
_080C92D4: .4byte gUnknown_08AE4CE8
_080C92D8: .4byte gUnknown_08AE4940
_080C92DC: .4byte 0x06012D00
_080C92E0:
	ldr r0, _080C9310  @ gUnknown_08AE4D08
	ldr r1, _080C9314  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9318  @ gUnknown_08AE5730
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C931C  @ gUnknown_08AE53C8
	ldr r1, _080C9320  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
_080C92FC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xa
	bne _080C9324
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9328
	.align 2, 0
_080C9310: .4byte gUnknown_08AE4D08
_080C9314: .4byte 0x06013C00
_080C9318: .4byte gUnknown_08AE5730
_080C931C: .4byte gUnknown_08AE53C8
_080C9320: .4byte 0x06014B00
_080C9324:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9328:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9218

	THUMB_FUNC_START sub_80C9330
sub_80C9330: @ 0x080C9330
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #9
	bl DivRem
	adds r3, r0, #0
	movs r0, #9
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9364
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9376
_080C9364:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9376:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C9388
	cmp r0, #2
	beq _080C93BC
	b _080C93D8
_080C9388:
	ldr r0, _080C93A8  @ gUnknown_08AE5750
	ldr r1, _080C93AC  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C93B0  @ gUnknown_08AE60B0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C93B4  @ gUnknown_08AE5D54
	ldr r1, _080C93B8  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C93D8
	.align 2, 0
_080C93A8: .4byte gUnknown_08AE5750
_080C93AC: .4byte 0x06010000
_080C93B0: .4byte gUnknown_08AE60B0
_080C93B4: .4byte gUnknown_08AE5D54
_080C93B8: .4byte 0x06010F00
_080C93BC:
	ldr r0, _080C93EC  @ gUnknown_08AE60D0
	ldr r1, _080C93F0  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C93F4  @ gUnknown_08AE69EC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C93F8  @ gUnknown_08AE6648
	ldr r1, _080C93FC  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
_080C93D8:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xb
	bne _080C9400
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9404
	.align 2, 0
_080C93EC: .4byte gUnknown_08AE60D0
_080C93F0: .4byte 0x06011E00
_080C93F4: .4byte gUnknown_08AE69EC
_080C93F8: .4byte gUnknown_08AE6648
_080C93FC: .4byte 0x06012D00
_080C9400:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9404:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9330

	THUMB_FUNC_START sub_80C940C
sub_80C940C: @ 0x080C940C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #8
	bl DivRem
	adds r3, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9440
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9452
_080C9440:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9452:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C94A4
	cmp r0, #2
	bgt _080C9468
	cmp r0, #1
	beq _080C9472
	b _080C9528
_080C9468:
	cmp r0, #3
	beq _080C94D8
	cmp r0, #4
	beq _080C950C
	b _080C9528
_080C9472:
	ldr r0, _080C9490  @ gUnknown_08AE6A0C
	ldr r1, _080C9494  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9498  @ gUnknown_08AE72C8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C949C  @ gUnknown_08AE6FA8
	ldr r1, _080C94A0  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C9528
	.align 2, 0
_080C9490: .4byte gUnknown_08AE6A0C
_080C9494: .4byte 0x06010000
_080C9498: .4byte gUnknown_08AE72C8
_080C949C: .4byte gUnknown_08AE6FA8
_080C94A0: .4byte 0x06010F00
_080C94A4:
	ldr r0, _080C94C4  @ gUnknown_08AE84DC
	ldr r1, _080C94C8  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C94CC  @ gUnknown_08AE8D84
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C94D0  @ gUnknown_08AE8AB8
	ldr r1, _080C94D4  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C9528
	.align 2, 0
_080C94C4: .4byte gUnknown_08AE84DC
_080C94C8: .4byte 0x06011E00
_080C94CC: .4byte gUnknown_08AE8D84
_080C94D0: .4byte gUnknown_08AE8AB8
_080C94D4: .4byte 0x06012D00
_080C94D8:
	ldr r0, _080C94F8  @ gUnknown_08AE72E8
	ldr r1, _080C94FC  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9500  @ gUnknown_08AE7C2C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9504  @ gUnknown_08AE78B0
	ldr r1, _080C9508  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
	b _080C9528
	.align 2, 0
_080C94F8: .4byte gUnknown_08AE72E8
_080C94FC: .4byte 0x06013C00
_080C9500: .4byte gUnknown_08AE7C2C
_080C9504: .4byte gUnknown_08AE78B0
_080C9508: .4byte 0x06014B00
_080C950C:
	ldr r0, _080C953C  @ gUnknown_08AE7C4C
	ldr r1, _080C9540  @ 0x06015A00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9544  @ gUnknown_08AE84BC
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9548  @ gUnknown_08AE819C
	ldr r1, _080C954C  @ 0x06016900
	bl CopyDataWithPossibleUncomp
_080C9528:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xc
	bne _080C9550
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9554
	.align 2, 0
_080C953C: .4byte gUnknown_08AE7C4C
_080C9540: .4byte 0x06015A00
_080C9544: .4byte gUnknown_08AE84BC
_080C9548: .4byte gUnknown_08AE819C
_080C954C: .4byte 0x06016900
_080C9550:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9554:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C940C

	THUMB_FUNC_START sub_80C955C
sub_80C955C: @ 0x080C955C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #7
	bl DivRem
	adds r3, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9590
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C95A2
_080C9590:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C95A2:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C95B4
	cmp r0, #2
	beq _080C95E8
	b _080C9604
_080C95B4:
	ldr r0, _080C95D4  @ gUnknown_08AE8DA4
	ldr r1, _080C95D8  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C95DC  @ gUnknown_08AE9720
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C95E0  @ gUnknown_08AE9364
	ldr r1, _080C95E4  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C9604
	.align 2, 0
_080C95D4: .4byte gUnknown_08AE8DA4
_080C95D8: .4byte 0x06010000
_080C95DC: .4byte gUnknown_08AE9720
_080C95E0: .4byte gUnknown_08AE9364
_080C95E4: .4byte 0x06010F00
_080C95E8:
	ldr r0, _080C9618  @ gUnknown_08AE9740
	ldr r1, _080C961C  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9620  @ gUnknown_08AEA02C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9624  @ gUnknown_08AE9CA4
	ldr r1, _080C9628  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
_080C9604:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xd
	bne _080C962C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9630
	.align 2, 0
_080C9618: .4byte gUnknown_08AE9740
_080C961C: .4byte 0x06011E00
_080C9620: .4byte gUnknown_08AEA02C
_080C9624: .4byte gUnknown_08AE9CA4
_080C9628: .4byte 0x06012D00
_080C962C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9630:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C955C

	THUMB_FUNC_START sub_80C9638
sub_80C9638: @ 0x080C9638
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #6
	bl DivRem
	adds r3, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C966C
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C967E
_080C966C:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C967E:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C96CC
	cmp r0, #2
	bgt _080C9694
	cmp r0, #1
	beq _080C969A
	b _080C971C
_080C9694:
	cmp r0, #3
	beq _080C9700
	b _080C971C
_080C969A:
	ldr r0, _080C96B8  @ gUnknown_08AECAE0
	ldr r1, _080C96BC  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C96C0  @ gUnknown_08AED3E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C96C4  @ gUnknown_08AED0A4
	ldr r1, _080C96C8  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C971C
	.align 2, 0
_080C96B8: .4byte gUnknown_08AECAE0
_080C96BC: .4byte 0x06010000
_080C96C0: .4byte gUnknown_08AED3E8
_080C96C4: .4byte gUnknown_08AED0A4
_080C96C8: .4byte 0x06010F00
_080C96CC:
	ldr r0, _080C96EC  @ gUnknown_08AED408
	ldr r1, _080C96F0  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C96F4  @ gUnknown_08AEDC80
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C96F8  @ gUnknown_08AED95C
	ldr r1, _080C96FC  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C971C
	.align 2, 0
_080C96EC: .4byte gUnknown_08AED408
_080C96F0: .4byte 0x06011E00
_080C96F4: .4byte gUnknown_08AEDC80
_080C96F8: .4byte gUnknown_08AED95C
_080C96FC: .4byte 0x06012D00
_080C9700:
	ldr r0, _080C9730  @ gUnknown_08AEDCA0
	ldr r1, _080C9734  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9738  @ gUnknown_08AEE564
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C973C  @ gUnknown_08AEE218
	ldr r1, _080C9740  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
_080C971C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bne _080C9744
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9748
	.align 2, 0
_080C9730: .4byte gUnknown_08AEDCA0
_080C9734: .4byte 0x06013C00
_080C9738: .4byte gUnknown_08AEE564
_080C973C: .4byte gUnknown_08AEE218
_080C9740: .4byte 0x06014B00
_080C9744:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9748:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9638

	THUMB_FUNC_START sub_80C9750
sub_80C9750: @ 0x080C9750
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #5
	bl DivRem
	adds r3, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9784
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9796
_080C9784:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9796:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C97E8
	cmp r0, #2
	bgt _080C97AC
	cmp r0, #1
	beq _080C97B6
	b _080C986C
_080C97AC:
	cmp r0, #3
	beq _080C981C
	cmp r0, #4
	beq _080C9850
	b _080C986C
_080C97B6:
	ldr r0, _080C97D4  @ gUnknown_08AEA04C
	ldr r1, _080C97D8  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C97DC  @ gUnknown_08AEAB50
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C97E0  @ gUnknown_08AEA7A8
	ldr r1, _080C97E4  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C986C
	.align 2, 0
_080C97D4: .4byte gUnknown_08AEA04C
_080C97D8: .4byte 0x06010000
_080C97DC: .4byte gUnknown_08AEAB50
_080C97E0: .4byte gUnknown_08AEA7A8
_080C97E4: .4byte 0x06010F00
_080C97E8:
	ldr r0, _080C9808  @ gUnknown_08AEAB70
	ldr r1, _080C980C  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9810  @ gUnknown_08AEB56C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9814  @ gUnknown_08AEB1B8
	ldr r1, _080C9818  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C986C
	.align 2, 0
_080C9808: .4byte gUnknown_08AEAB70
_080C980C: .4byte 0x06011E00
_080C9810: .4byte gUnknown_08AEB56C
_080C9814: .4byte gUnknown_08AEB1B8
_080C9818: .4byte 0x06012D00
_080C981C:
	ldr r0, _080C983C  @ gUnknown_08AEB58C
	ldr r1, _080C9840  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9844  @ gUnknown_08AEC048
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9848  @ gUnknown_08AEBCEC
	ldr r1, _080C984C  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
	b _080C986C
	.align 2, 0
_080C983C: .4byte gUnknown_08AEB58C
_080C9840: .4byte 0x06013C00
_080C9844: .4byte gUnknown_08AEC048
_080C9848: .4byte gUnknown_08AEBCEC
_080C984C: .4byte 0x06014B00
_080C9850:
	ldr r0, _080C9880  @ gUnknown_08AEC068
	ldr r1, _080C9884  @ 0x06015A00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9888  @ gUnknown_08AECAC0
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C988C  @ gUnknown_08AEC724
	ldr r1, _080C9890  @ 0x06016900
	bl CopyDataWithPossibleUncomp
_080C986C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xf
	bne _080C9894
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9898
	.align 2, 0
_080C9880: .4byte gUnknown_08AEC068
_080C9884: .4byte 0x06015A00
_080C9888: .4byte gUnknown_08AECAC0
_080C988C: .4byte gUnknown_08AEC724
_080C9890: .4byte 0x06016900
_080C9894:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9898:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9750

	THUMB_FUNC_START sub_80C98A0
sub_80C98A0: @ 0x080C98A0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #4
	bl DivRem
	adds r3, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C98D4
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C98E6
_080C98D4:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C98E6:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C9934
	cmp r0, #2
	bgt _080C98FC
	cmp r0, #1
	beq _080C9902
	b _080C9984
_080C98FC:
	cmp r0, #3
	beq _080C9968
	b _080C9984
_080C9902:
	ldr r0, _080C9920  @ gUnknown_08AEE584
	ldr r1, _080C9924  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9928  @ gUnknown_08AEEECC
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C992C  @ gUnknown_08AEEBB0
	ldr r1, _080C9930  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C9984
	.align 2, 0
_080C9920: .4byte gUnknown_08AEE584
_080C9924: .4byte 0x06010000
_080C9928: .4byte gUnknown_08AEEECC
_080C992C: .4byte gUnknown_08AEEBB0
_080C9930: .4byte 0x06010F00
_080C9934:
	ldr r0, _080C9954  @ gUnknown_08AEEEEC
	ldr r1, _080C9958  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C995C  @ gUnknown_08AEF880
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9960  @ gUnknown_08AEF580
	ldr r1, _080C9964  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
	b _080C9984
	.align 2, 0
_080C9954: .4byte gUnknown_08AEEEEC
_080C9958: .4byte 0x06011E00
_080C995C: .4byte gUnknown_08AEF880
_080C9960: .4byte gUnknown_08AEF580
_080C9964: .4byte 0x06012D00
_080C9968:
	ldr r0, _080C9998  @ gUnknown_08AEF8A0
	ldr r1, _080C999C  @ 0x06013C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C99A0  @ gUnknown_08AF0130
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C99A4  @ gUnknown_08AEFDC8
	ldr r1, _080C99A8  @ 0x06014B00
	bl CopyDataWithPossibleUncomp
_080C9984:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C99AC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C99B0
	.align 2, 0
_080C9998: .4byte gUnknown_08AEF8A0
_080C999C: .4byte 0x06013C00
_080C99A0: .4byte gUnknown_08AF0130
_080C99A4: .4byte gUnknown_08AEFDC8
_080C99A8: .4byte 0x06014B00
_080C99AC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C99B0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C98A0

	THUMB_FUNC_START sub_80C99B8
sub_80C99B8: @ 0x080C99B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #3
	bl DivRem
	adds r3, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C99EC
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C99FE
_080C99EC:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C99FE:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C9A10
	cmp r0, #2
	beq _080C9A44
	b _080C9A60
_080C9A10:
	ldr r0, _080C9A30  @ gUnknown_08AF0150
	ldr r1, _080C9A34  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9A38  @ gUnknown_08AF0DE8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9A3C  @ gUnknown_08AF09E4
	ldr r1, _080C9A40  @ 0x06010F00
	bl CopyDataWithPossibleUncomp
	b _080C9A60
	.align 2, 0
_080C9A30: .4byte gUnknown_08AF0150
_080C9A34: .4byte 0x06010000
_080C9A38: .4byte gUnknown_08AF0DE8
_080C9A3C: .4byte gUnknown_08AF09E4
_080C9A40: .4byte 0x06010F00
_080C9A44:
	ldr r0, _080C9A74  @ gUnknown_08AF0E08
	ldr r1, _080C9A78  @ 0x06011E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C9A7C  @ gUnknown_08AF1AC8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl StorePaletteToBufferMaybe
	ldr r0, _080C9A80  @ gUnknown_08AF16CC
	ldr r1, _080C9A84  @ 0x06012D00
	bl CopyDataWithPossibleUncomp
_080C9A60:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x12
	bne _080C9A88
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9A8C
	.align 2, 0
_080C9A74: .4byte gUnknown_08AF0E08
_080C9A78: .4byte 0x06011E00
_080C9A7C: .4byte gUnknown_08AF1AC8
_080C9A80: .4byte gUnknown_08AF16CC
_080C9A84: .4byte 0x06012D00
_080C9A88:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9A8C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C99B8

	THUMB_FUNC_START sub_80C9A94
sub_80C9A94: @ 0x080C9A94
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C9AEC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldrh r3, [r4, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x30
	bne _080C9AF0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9AF4
	.align 2, 0
_080C9AEC: .4byte gLCDControlBuffer
_080C9AF0:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9AF4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9A94

	THUMB_FUNC_START sub_80C9AFC
sub_80C9AFC: @ 0x080C9AFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _080C9B50  @ gUnknown_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	ldr r5, _080C9B54  @ gPaletteBuffer
	lsls r6, r4, #0x10
	movs r4, #7
_080C9B26:
	adds r0, r5, #0
	ldr r1, _080C9B58  @ 0x00007FFF
	lsrs r2, r6, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080C9B26
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x30
	bne _080C9B60
	ldr r0, _080C9B5C  @ gUnknown_02022188
	movs r2, #0
	ldr r1, _080C9B58  @ 0x00007FFF
	strh r1, [r0, #0xc]
	strh r2, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C9B64
	.align 2, 0
_080C9B50: .4byte gUnknown_08B103D8
_080C9B54: .4byte gPaletteBuffer
_080C9B58: .4byte 0x00007FFF
_080C9B5C: .4byte gUnknown_02022188
_080C9B60:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C9B64:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9AFC

	THUMB_FUNC_START sub_80C9B6C
sub_80C9B6C: @ 0x080C9B6C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r4, _080C9C04  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldrb r0, [r4, #1]
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C04: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9B6C

	THUMB_FUNC_START sub_80C9C08
sub_80C9C08: @ 0x080C9C08
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9C54  @ gUnknown_08ACC3E0
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9C58  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #0xe8
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C54: .4byte gUnknown_08ACC3E0
_080C9C58: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9C08

	THUMB_FUNC_START sub_80C9C5C
sub_80C9C5C: @ 0x080C9C5C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9CA4  @ gUnknown_08ACF314
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9CA8  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x38
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CA4: .4byte gUnknown_08ACF314
_080C9CA8: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9C5C

	THUMB_FUNC_START sub_80C9CAC
sub_80C9CAC: @ 0x080C9CAC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9CF4  @ gUnknown_08AD24B4
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9CF8  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x28
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CF4: .4byte gUnknown_08AD24B4
_080C9CF8: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9CAC

	THUMB_FUNC_START sub_80C9CFC
sub_80C9CFC: @ 0x080C9CFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9D44  @ gUnknown_08AD54DC
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9D48  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xf0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x18
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D44: .4byte gUnknown_08AD54DC
_080C9D48: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9CFC

	THUMB_FUNC_START sub_80C9D4C
sub_80C9D4C: @ 0x080C9D4C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9D98  @ gUnknown_08AD89A8
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9D9C  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xe8
	strh r1, [r0]
	adds r3, r4, #0
	adds r3, #0x42
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D98: .4byte gUnknown_08AD89A8
_080C9D9C: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9D4C

	THUMB_FUNC_START sub_80C9DA0
sub_80C9DA0: @ 0x080C9DA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9DE8  @ gUnknown_08ADBD18
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9DEC  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc8
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x70
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x10
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9DE8: .4byte gUnknown_08ADBD18
_080C9DEC: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9DA0

	THUMB_FUNC_START sub_80C9DF0
sub_80C9DF0: @ 0x080C9DF0
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r2, _080C9E68  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r5
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9E68: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9DF0

	THUMB_FUNC_START sub_80C9E6C
sub_80C9E6C: @ 0x080C9E6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80C726C
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080C9ED8
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080C9ED4  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C9ED8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9EDE
	.align 2, 0
_080C9ED4: .4byte gLCDControlBuffer
_080C9ED8:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9EDE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9E6C

	THUMB_FUNC_START sub_80C9EE8
sub_80C9EE8: @ 0x080C9EE8
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C9F74  @ gUnknown_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r3, _080C9F78  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F74: .4byte gUnknown_08B103D8
_080C9F78: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9EE8

	THUMB_FUNC_START sub_80C9F7C
sub_80C9F7C: @ 0x080C9F7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80C726C
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080C9FE8
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r2, _080C9FE4  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C9FE8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9FEE
	.align 2, 0
_080C9FE4: .4byte gLCDControlBuffer
_080C9FE8:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9FEE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9F7C

	THUMB_FUNC_START sub_80C9FF8
sub_80C9FF8: @ 0x080C9FF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl sub_80C726C
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r2, [r0]
	ldrh r3, [r5, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r6, [r0]
	cmp r6, #0
	beq _080CA06E
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r4, r5, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r5, #0x48]
	str r3, [sp]
	ldr r3, [r5, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl sub_80C67D4
	b _080CA08E
_080CA06E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r4, r5, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r5, #0x48]
	str r3, [sp]
	ldr r3, [r5, #0x4c]
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA08E:
	strh r7, [r5, #0x30]
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x1e
	bne _080CA0FE
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r0, #0xf0
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA0D6
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r1, [r5, #0x48]
	str r1, [sp]
	ldr r1, [r5, #0x4c]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl sub_80C689C
	b _080CA0F2
_080CA0D6:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r1, [r5, #0x48]
	str r1, [sp]
	ldr r1, [r5, #0x4c]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl sub_80C67D4
_080CA0F2:
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080CA102
_080CA0FE:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CA102:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9FF8

	THUMB_FUNC_START sub_80CA10C
sub_80CA10C: @ 0x080CA10C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	ldrh r1, [r6, #0x3a]
	bl sub_80C726C
	ldrh r0, [r6, #0x38]
	strh r0, [r6, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r6, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r6, #0x38]
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	ldrh r3, [r6, #0x2a]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r2, r1, #0
	adds r2, #0x10
	ldrh r3, [r6, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r7, [r0]
	cmp r7, #0
	beq _080CA1AA
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl sub_80C67D4
	b _080CA1CA
_080CA1AA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	str r7, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA1CA:
	adds r7, r4, #0
	strh r5, [r6, #0x30]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r6, #0x2a]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r5, r0, #0
	ldrh r3, [r6, #0x2a]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r6, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r5, r1, r0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA230
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C689C
	b _080CA24C
_080CA230:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C67D4
_080CA24C:
	strh r5, [r6, #0x32]
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1e
	bne _080CA260
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CA264
_080CA260:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CA264:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA10C

	THUMB_FUNC_START sub_80CA26C
sub_80CA26C: @ 0x080CA26C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xb
	bne _080CA2E6
	ldr r5, _080CA380  @ gLCDControlBuffer
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	movs r2, #3
	negs r2, r2
	mov sl, r2
	ands r0, r2
	movs r3, #5
	negs r3, r3
	mov r9, r3
	ands r0, r3
	movs r1, #8
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5, #1]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r5, #1]
	movs r3, #1
	orrs r0, r3
	mov r1, sl
	ands r0, r1
	mov r2, r9
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	orrs r0, r6
	strb r0, [r5, #1]
_080CA2E6:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xa
	bhi _080CA3A6
	adds r3, r0, #0
	adds r3, #0x1e
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r5, r0, #0
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r7, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r4, r1, r0
	adds r0, r7, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA384
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C689C
	b _080CA3A4
	.align 2, 0
_080CA380: .4byte gLCDControlBuffer
_080CA384:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C67D4
_080CA3A4:
	strh r4, [r7, #0x32]
_080CA3A6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA26C

	THUMB_FUNC_START sub_80CA3B8
sub_80CA3B8: @ 0x080CA3B8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80CA26C
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80C726C
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	adds r3, r0, #0
	subs r3, #0xf
	cmp r3, #0
	blt _080CA412
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080CA460  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CA412:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r2, [r0]
	adds r1, r2, #0
	adds r1, #0x10
	lsls r2, r2, #1
	adds r2, #0x10
	ldrh r3, [r4, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r5, [r0]
	cmp r5, #0
	beq _080CA464
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl sub_80C67D4
	b _080CA484
	.align 2, 0
_080CA460: .4byte gLCDControlBuffer
_080CA464:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA484:
	strh r6, [r4, #0x30]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x1e
	bne _080CA498
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080CA49C
_080CA498:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CA49C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA3B8

	THUMB_FUNC_START sub_80CA4A4
sub_80CA4A4: @ 0x080CA4A4
	push {lr}
	ldr r0, _080CA4D4  @ gUnknown_08AA707C
	bl Proc_EndEach
	ldr r2, _080CA4D8  @ gLCDControlBuffer
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
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_080CA4D4: .4byte gUnknown_08AA707C
_080CA4D8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CA4A4

	THUMB_FUNC_START sub_80CA4DC
sub_80CA4DC: @ 0x080CA4DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #4
	bhi _080CA53E
	lsls r0, r0, #2
	ldr r1, _080CA4F4  @ _080CA4F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA4F4: .4byte _080CA4F8
_080CA4F8: @ jump table
	.4byte _080CA53E @ case 0
	.4byte _080CA50C @ case 1
	.4byte _080CA51A @ case 2
	.4byte _080CA528 @ case 3
	.4byte _080CA536 @ case 4
_080CA50C:
	movs r0, #0xd8
	lsls r0, r0, #1
	movs r1, #0xc4
	lsls r1, r1, #1
	bl sub_80C726C
	b _080CA53E
_080CA51A:
	movs r0, #0xf8
	lsls r0, r0, #1
	movs r1, #0xd8
	lsls r1, r1, #1
	bl sub_80C726C
	b _080CA53E
_080CA528:
	movs r0, #0x8c
	lsls r0, r0, #2
	movs r1, #0xf8
	lsls r1, r1, #1
	bl sub_80C726C
	b _080CA53E
_080CA536:
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r6, #0x3a]
	strh r0, [r6, #0x38]
_080CA53E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8e
	bls _080CA550
	movs r0, #0xae
	movs r1, #0xa
	movs r2, #4
	movs r3, #9
	bl sub_80C6474
_080CA550:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8d
	bls _080CA562
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #7
	bl sub_80C6474
_080CA562:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8c
	bls _080CA574
	movs r0, #0x9c
	movs r1, #0x3a
	movs r2, #3
	movs r3, #3
	bl sub_80C6474
_080CA574:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8b
	bls _080CA586
	movs r0, #0x22
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl sub_80C6474
_080CA586:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8a
	bls _080CA598
	movs r0, #0xd2
	movs r1, #0x10
	movs r2, #4
	movs r3, #5
	bl sub_80C6474
_080CA598:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x89
	bls _080CA5AA
	movs r0, #0xc
	movs r1, #0x1a
	movs r2, #3
	movs r3, #1
	bl sub_80C6474
_080CA5AA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x88
	bls _080CA5BC
	movs r0, #0xcc
	movs r1, #0x2a
	movs r2, #3
	movs r3, #4
	bl sub_80C6474
_080CA5BC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x87
	bls _080CA5CE
	movs r0, #0x60
	movs r1, #0
	movs r2, #4
	movs r3, #0
	bl sub_80C6474
_080CA5CE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x86
	bls _080CA5E0
	movs r0, #0xe4
	movs r1, #0x10
	movs r2, #4
	movs r3, #0xb
	bl sub_80C6474
_080CA5E0:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x85
	bls _080CA5F2
	movs r0, #0x58
	movs r1, #0x1e
	movs r2, #3
	movs r3, #3
	bl sub_80C6474
_080CA5F2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x84
	bls _080CA604
	movs r0, #0x54
	movs r1, #0x2e
	movs r2, #2
	movs r3, #1
	bl sub_80C6474
_080CA604:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x83
	bls _080CA616
	movs r0, #0
	movs r1, #2
	movs r2, #4
	movs r3, #2
	bl sub_80C6474
_080CA616:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x82
	bls _080CA628
	movs r0, #0xc6
	movs r1, #0x18
	movs r2, #4
	movs r3, #9
	bl sub_80C6474
_080CA628:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x81
	bls _080CA63A
	movs r0, #0x90
	movs r1, #0x22
	movs r2, #3
	movs r3, #5
	bl sub_80C6474
_080CA63A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x80
	bls _080CA64C
	movs r0, #0xa8
	movs r1, #0x44
	movs r2, #2
	movs r3, #0
	bl sub_80C6474
_080CA64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7f
	bls _080CA65E
	movs r0, #0xca
	movs r1, #2
	movs r2, #4
	movs r3, #7
	bl sub_80C6474
_080CA65E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7e
	bls _080CA670
	movs r0, #0x26
	movs r1, #0x18
	movs r2, #4
	movs r3, #2
	bl sub_80C6474
_080CA670:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7d
	bls _080CA682
	movs r0, #0x80
	movs r1, #0x26
	movs r2, #3
	movs r3, #0
	bl sub_80C6474
_080CA682:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7b
	bls _080CA694
	movs r0, #0x80
	movs r1, #0x32
	movs r2, #2
	movs r3, #5
	bl sub_80C6474
_080CA694:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x79
	bls _080CA6A6
	movs r0, #0x86
	movs r1, #6
	movs r2, #4
	movs r3, #0
	bl sub_80C6474
_080CA6A6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x77
	bls _080CA6B8
	movs r0, #0x98
	movs r1, #0x16
	movs r2, #4
	movs r3, #1
	bl sub_80C6474
_080CA6B8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x75
	bls _080CA6CA
	movs r0, #0xe8
	movs r1, #0x16
	movs r2, #3
	movs r3, #3
	bl sub_80C6474
_080CA6CA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x73
	bls _080CA6DC
	movs r0, #0x64
	movs r1, #0x48
	movs r2, #2
	movs r3, #1
	bl sub_80C6474
_080CA6DC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x71
	bls _080CA6EE
	movs r0, #0x70
	movs r1, #6
	movs r2, #4
	movs r3, #0xa
	bl sub_80C6474
_080CA6EE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6f
	bls _080CA700
	movs r0, #0x40
	movs r1, #0x14
	movs r2, #4
	movs r3, #8
	bl sub_80C6474
_080CA700:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6d
	bls _080CA712
	movs r0, #0
	movs r1, #0x2e
	movs r2, #3
	movs r3, #4
	bl sub_80C6474
_080CA712:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6b
	bls _080CA724
	movs r0, #0x2c
	movs r1, #0x4a
	movs r2, #2
	movs r3, #4
	bl sub_80C6474
_080CA724:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x69
	bls _080CA736
	movs r0, #0x40
	movs r1, #8
	movs r2, #4
	movs r3, #6
	bl sub_80C6474
_080CA736:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x67
	bls _080CA748
	movs r0, #0x78
	movs r1, #0x1a
	movs r2, #4
	movs r3, #2
	bl sub_80C6474
_080CA748:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x65
	bls _080CA75A
	movs r0, #0x24
	movs r1, #0x32
	movs r2, #3
	movs r3, #2
	bl sub_80C6474
_080CA75A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x62
	bls _080CA76C
	movs r0, #0xe
	movs r1, #0x4e
	movs r2, #2
	movs r3, #0
	bl sub_80C6474
_080CA76C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5f
	bls _080CA77E
	movs r0, #0x16
	movs r1, #0xa
	movs r2, #4
	movs r3, #4
	bl sub_80C6474
_080CA77E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5c
	bls _080CA790
	movs r0, #0xb4
	movs r1, #0x28
	movs r2, #4
	movs r3, #1
	bl sub_80C6474
_080CA790:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x59
	bls _080CA7A2
	movs r0, #0x42
	movs r1, #0x36
	movs r2, #3
	movs r3, #1
	bl sub_80C6474
_080CA7A2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x55
	bls _080CA7B4
	movs r0, #0xdc
	movs r1, #0x32
	movs r2, #2
	movs r3, #2
	bl sub_80C6474
_080CA7B4:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x51
	bls _080CA7C6
	movs r0, #0xc8
	movs r1, #0x48
	movs r2, #1
	movs r3, #0
	bl sub_80C6474
_080CA7C6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x4c
	bls _080CA7D8
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #0
	bl sub_80C6474
_080CA7D8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x47
	bls _080CA7EA
	movs r0, #0x8c
	movs r1, #0x54
	movs r2, #1
	movs r3, #2
	bl sub_80C6474
_080CA7EA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x41
	bls _080CA7FC
	movs r0, #0x10
	movs r1, #0x64
	movs r2, #1
	movs r3, #1
	bl sub_80C6474
_080CA7FC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x37
	bls _080CA80E
	movs r0, #0
	movs r1, #0x7e
	movs r2, #0
	movs r3, #1
	bl sub_80C6474
_080CA80E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x31
	bls _080CA820
	movs r0, #0xa0
	movs r1, #0x78
	movs r2, #0
	movs r3, #2
	bl sub_80C6474
_080CA820:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1d
	bls _080CA832
	movs r0, #0x58
	movs r1, #0x70
	movs r2, #0
	movs r3, #0
	bl sub_80C6474
_080CA832:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0x52
	cmp r4, #0
	bne _080CA870
	ldr r2, _080CA914  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
_080CA870:
	cmp r4, #0x5f
	bhi _080CA8A8
	ldr r0, _080CA918  @ gUnknown_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl StorePaletteToBufferMaybe
	movs r0, #0x5f
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl Interpolate
	ldr r5, _080CA91C  @ gPaletteBuffer
	lsls r7, r0, #0x10
	movs r4, #7
_080CA896:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r7, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CA896
_080CA8A8:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0xb1
	cmp r4, #0
	bne _080CA8DC
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
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
_080CA8DC:
	cmp r4, #0x20
	bhi _080CA900
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	adds r3, r4, #0
	bl Interpolate
	ldr r2, _080CA914  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CA900:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xd1
	bne _080CA920
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CA924
	.align 2, 0
_080CA914: .4byte gLCDControlBuffer
_080CA918: .4byte gUnknown_08B103D8
_080CA91C: .4byte gPaletteBuffer
_080CA920:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CA924:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA4DC

	THUMB_FUNC_START sub_80CA92C
sub_80CA92C: @ 0x080CA92C
	push {r4, lr}
	adds r4, r0, #0
	bl SetDefaultColorEffects
	adds r4, #0x46
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA92C

	THUMB_FUNC_START sub_80CA940
sub_80CA940: @ 0x080CA940
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r0, _080CA9F0  @ gUnknown_08AA707C
	bl Proc_EndEach
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r3, _080CA9F4  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r2, #2
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r5, #3
	negs r5, r5
	ands r0, r5
	movs r1, #4
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r4, #9
	negs r4, r4
	ands r0, r4
	movs r6, #0x10
	orrs r0, r6
	movs r1, #0x21
	negs r1, r1
	mov r9, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	mov r1, r8
	orrs r0, r1
	ands r0, r4
	orrs r0, r6
	adds r3, #0x36
	ldrb r1, [r3]
	ands r2, r1
	ands r2, r5
	movs r1, #5
	negs r1, r1
	ands r2, r1
	ands r2, r4
	subs r1, #0xc
	ands r2, r1
	movs r1, #0x20
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	mov r0, r9
	ands r2, r0
	strb r2, [r3]
	movs r0, #1
	movs r1, #4
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA9F0: .4byte gUnknown_08AA707C
_080CA9F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CA940

	THUMB_FUNC_START sub_80CA9F8
sub_80CA9F8: @ 0x080CA9F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	subs r2, r3, r2
	movs r5, #0x10
	subs r3, r5, r2
	cmp r3, #0
	bge _080CAA14
	ldr r0, _080CAA10  @ 0x0000FFFF
	b _080CAA2E
	.align 2, 0
_080CAA10: .4byte 0x0000FFFF
_080CAA14:
	cmp r3, #0xf
	bgt _080CAA2C
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	str r5, [sp]
	movs r0, #4
	adds r2, r4, #0
	bl Interpolate
	b _080CAA2E
_080CAA2C:
	adds r0, r4, #0
_080CAA2E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CA9F8

	THUMB_FUNC_START sub_80CAA38
sub_80CAA38: @ 0x080CAA38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAB60  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAAA2
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xec
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB6C  @ 0x000004EC
	ldr r0, _080CAB70  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB74  @ 0x00000804
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAA2:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAAF8
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB7C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAB80  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB84  @ 0x00000838
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAF8:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAB4C
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB88  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x54
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB8C  @ 0x00000454
	ldr r0, _080CAB90  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB94  @ 0x0000086C
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAB4C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x14
	bne _080CAB98
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CAB9E
	.align 2, 0
_080CAB60: .4byte 0x0000FFFF
_080CAB64: .4byte 0x000001FF
_080CAB68: .4byte gUnknown_08AA709C
_080CAB6C: .4byte 0x000004EC
_080CAB70: .4byte 0x00001078
_080CAB74: .4byte 0x00000804
_080CAB78: .4byte gUnknown_08AA70BC
_080CAB7C: .4byte 0x000020F0
_080CAB80: .4byte 0x00003168
_080CAB84: .4byte 0x00000838
_080CAB88: .4byte 0x000041E0
_080CAB8C: .4byte 0x00000454
_080CAB90: .4byte 0x00005258
_080CAB94: .4byte 0x0000086C
_080CAB98:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CAB9E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAA38

	THUMB_FUNC_START sub_80CABB0
sub_80CABB0: @ 0x080CABB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrh r4, [r0, #0x2a]
	adds r4, #2
	movs r5, #1
	negs r5, r5
	movs r0, #0x42
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	mov sl, r0
	movs r0, #0x2a
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	adds r7, r0, #0
	movs r0, #0xae
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #8]
	movs r0, #0x76
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #0xc]
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	cmp r7, r0
	beq _080CAC6E
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAC6E
	cmp r7, #0xc8
	bgt _080CAC6E
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADE8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r1, r9
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAC6E:
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CACE0
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CACE0
	cmp r1, #0xc8
	bgt _080CACE0
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADF4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CACE0:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	cmp r7, r0
	beq _080CAD52
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAD52
	cmp r7, #0xc8
	bgt _080CAD52
	adds r5, r1, #0
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADFC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAD52:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CADC6
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CADC6
	cmp r1, #0xc8
	bgt _080CADC6
	ldr r5, [sp, #8]
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CAE00  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CAE04  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CADC6:
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x12
	bne _080CAE08
	movs r0, #0
	strh r0, [r1, #0x2a]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080CAE0E
	.align 2, 0
_080CADDC: .4byte 0x0000FFFF
_080CADE0: .4byte 0x000001FF
_080CADE4: .4byte gUnknown_08AA709C
_080CADE8: .4byte 0x00001078
_080CADEC: .4byte gUnknown_08AA70DC
_080CADF0: .4byte 0x000020F0
_080CADF4: .4byte 0x00003168
_080CADF8: .4byte 0x000041E0
_080CADFC: .4byte 0x00005258
_080CAE00: .4byte 0x000062D0
_080CAE04: .4byte 0x00007348
_080CAE08:
	adds r0, #1
	ldr r1, [sp, #4]
	strh r0, [r1, #0x2a]
_080CAE0E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CABB0

	THUMB_FUNC_START sub_80CAE20
sub_80CAE20: @ 0x080CAE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAEF4  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAE8C
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF00  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CAE8C:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAEDE
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	ldr r0, _080CAF0C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF10  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CAEDE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x10
	bne _080CAF14
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CAF1A
	.align 2, 0
_080CAEF4: .4byte 0x0000FFFF
_080CAEF8: .4byte 0x000001FF
_080CAEFC: .4byte gUnknown_08AA709C
_080CAF00: .4byte 0x00001078
_080CAF04: .4byte 0x00000838
_080CAF08: .4byte gUnknown_08AA70EA
_080CAF0C: .4byte 0x000020F0
_080CAF10: .4byte 0x00003168
_080CAF14:
	adds r0, #1
	mov r1, r8
	strh r0, [r1, #0x2a]
_080CAF1A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAE20

	THUMB_FUNC_START sub_80CAF2C
sub_80CAF2C: @ 0x080CAF2C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAF98
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAF98
	cmp r4, #0xc8
	bgt _080CAF98
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB07C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CAF98:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAFFC
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAFFC
	cmp r4, #0xc8
	bgt _080CAFFC
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB084  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB088  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CAFFC:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB060
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB060
	cmp r4, #0xc8
	bgt _080CB060
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB08C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB090  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB060:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xf
	bne _080CB094
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB098
	.align 2, 0
_080CB074: .4byte 0x0000FFFF
_080CB078: .4byte gUnknown_08AA709C
_080CB07C: .4byte 0x00001078
_080CB080: .4byte gUnknown_08AA7116
_080CB084: .4byte 0x000020F0
_080CB088: .4byte 0x00003168
_080CB08C: .4byte 0x000041E0
_080CB090: .4byte 0x00005258
_080CB094:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB098:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAF2C

	THUMB_FUNC_START sub_80CB0A0
sub_80CB0A0: @ 0x080CB0A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB10A
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB10A
	cmp r4, #0xc8
	bgt _080CB10A
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1E8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CB10A:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB16C
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB16C
	cmp r4, #0xc8
	bgt _080CB16C
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1F4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CB16C:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB1CE
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB1CE
	cmp r4, #0xc8
	bgt _080CB1CE
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1FC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB1CE:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xd
	bne _080CB200
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB204
	.align 2, 0
_080CB1E0: .4byte 0x0000FFFF
_080CB1E4: .4byte gUnknown_08AA709C
_080CB1E8: .4byte 0x00001078
_080CB1EC: .4byte gUnknown_08AA7116
_080CB1F0: .4byte 0x000020F0
_080CB1F4: .4byte 0x00003168
_080CB1F8: .4byte 0x000041E0
_080CB1FC: .4byte 0x00005258
_080CB200:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB204:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB0A0

	THUMB_FUNC_START sub_80CB20C
sub_80CB20C: @ 0x080CB20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #1
	negs r0, r0
	mov sl, r0
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB2E0  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB27A
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB2EC  @ 0x00000406
	ldr r0, _080CB2F0  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB2F4  @ 0x0000081E
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB27A:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB2CC
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	ldr r0, _080CB2FC  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB300  @ 0x0000043A
	ldr r0, _080CB304  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB308  @ 0x00000852
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB2CC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xb
	bne _080CB30C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB310
	.align 2, 0
_080CB2E0: .4byte 0x0000FFFF
_080CB2E4: .4byte 0x000001FF
_080CB2E8: .4byte gUnknown_08AA709C
_080CB2EC: .4byte 0x00000406
_080CB2F0: .4byte 0x00001078
_080CB2F4: .4byte 0x0000081E
_080CB2F8: .4byte gUnknown_08AA70EA
_080CB2FC: .4byte 0x000020F0
_080CB300: .4byte 0x0000043A
_080CB304: .4byte 0x00003168
_080CB308: .4byte 0x00000852
_080CB30C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB310:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB20C

	THUMB_FUNC_START sub_80CB320
sub_80CB320: @ 0x080CB320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldrh r7, [r0, #0x2a]
	cmp r7, #0
	bne _080CB3A6
	ldr r0, _080CB54C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	negs r1, r1
	mov r8, r1
	ands r0, r1
	movs r6, #3
	negs r6, r6
	ands r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #9
	negs r3, r3
	ands r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r8
	ands r0, r2
	ands r0, r6
	orrs r0, r4
	ands r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r0, ip
	adds r0, #0x2d
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #1
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
_080CB3A6:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB41C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB41C
	cmp r7, #0xc8
	bgt _080CB41C
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB554  @ gUnknown_08AA709C
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB558  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl PutSpriteExt
_080CB41C:
	movs r0, #0x84
	movs r1, #1
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	movs r1, #0x78
	cmp r1, r0
	beq _080CB49A
	cmp r7, r0
	beq _080CB49A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB49A
	cmp r7, #0xc8
	bgt _080CB49A
	subs r1, #0x30
	ldr r5, _080CB560  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r2, #0xff
	mov r8, r2
	ands r4, r2
	ldr r6, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB564  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB568  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x38
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB49A:
	mov r3, r9
	subs r3, #2
	cmp r3, #7
	bhi _080CB4F2
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl Interpolate
	adds r7, r0, #0
	ldr r3, _080CB54C  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #6
	strb r0, [r1]
	movs r2, #0x50
	subs r2, r2, r7
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0x76
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r5, r3, #0
	adds r5, #0x2f
	movs r0, #0x7a
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x33
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #0xea
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
_080CB4F2:
	ldr r4, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB56C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0x84
	lsls r5, r5, #3
	ldr r0, _080CB570  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x12
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB574  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x82
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB578  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0x86
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xa
	bne _080CB57C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sl
	bl Proc_Break
	b _080CB582
	.align 2, 0
_080CB54C: .4byte gLCDControlBuffer
_080CB550: .4byte 0x0000FFFF
_080CB554: .4byte gUnknown_08AA709C
_080CB558: .4byte 0x00001078
_080CB55C: .4byte gUnknown_08AA70EA
_080CB560: .4byte 0x000001FF
_080CB564: .4byte 0x000020F0
_080CB568: .4byte 0x00003168
_080CB56C: .4byte 0x000041E0
_080CB570: .4byte 0x00005258
_080CB574: .4byte 0x000062D0
_080CB578: .4byte 0x00007348
_080CB57C:
	adds r0, #1
	mov r2, sl
	strh r0, [r2, #0x2a]
_080CB582:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB320

	THUMB_FUNC_START sub_80CB594
sub_80CB594: @ 0x080CB594
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB660  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB5FA
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB66C  @ 0x00000406
	ldr r0, _080CB670  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB674  @ 0x0000081E
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB5FA:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB64C
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	ldr r0, _080CB67C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB680  @ 0x0000043A
	ldr r0, _080CB684  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB688  @ 0x00000852
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #9
	bne _080CB68C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB690
	.align 2, 0
_080CB660: .4byte 0x0000FFFF
_080CB664: .4byte 0x000001FF
_080CB668: .4byte gUnknown_08AA709C
_080CB66C: .4byte 0x00000406
_080CB670: .4byte 0x00001078
_080CB674: .4byte 0x0000081E
_080CB678: .4byte gUnknown_08AA70EA
_080CB67C: .4byte 0x000020F0
_080CB680: .4byte 0x0000043A
_080CB684: .4byte 0x00003168
_080CB688: .4byte 0x00000852
_080CB68C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB690:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB594

	THUMB_FUNC_START sub_80CB6A0
sub_80CB6A0: @ 0x080CB6A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	mov sl, r0
	movs r0, #0x1c
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB722
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB722
	cmp r7, #0xc8
	bgt _080CB722
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB840  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB844  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CB722:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB7A4
	cmp r7, r0
	beq _080CB7A4
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB7A4
	cmp r7, #0xc8
	bgt _080CB7A4
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB850  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB854  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB7A4:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x84
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB826
	cmp r7, r0
	beq _080CB826
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB826
	cmp r7, #0xc8
	bgt _080CB826
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB858  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB85C  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB826:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #8
	bne _080CB860
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CB866
	.align 2, 0
_080CB83C: .4byte 0x0000FFFF
_080CB840: .4byte gUnknown_08AA709C
_080CB844: .4byte 0x00001078
_080CB848: .4byte gUnknown_08AA715C
_080CB84C: .4byte 0x000001FF
_080CB850: .4byte 0x000020F0
_080CB854: .4byte 0x00003168
_080CB858: .4byte 0x000041E0
_080CB85C: .4byte 0x00005258
_080CB860:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CB866:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB6A0

	THUMB_FUNC_START sub_80CB878
sub_80CB878: @ 0x080CB878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	str r0, [sp, #4]
	movs r0, #0x1e
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB902
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB902
	cmp r7, #0xc8
	bgt _080CB902
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBA24  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r6, _080CBA28  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA2C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutSpriteExt
_080CB902:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB956
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB956
	cmp r7, #0xc8
	bgt _080CB956
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA34  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x66
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA38  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x6a
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7a
	adds r2, r4, #0
	bl PutSpriteExt
_080CB956:
	movs r0, #0x50
	movs r1, #1
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB9B8
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB9B8
	cmp r7, #0xc8
	bgt _080CB9B8
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA3C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x2a
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA40  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x2e
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x3e
	adds r2, r4, #0
	bl PutSpriteExt
_080CB9B8:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBA0C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBA0C
	cmp r7, #0xc8
	bgt _080CBA0C
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA44  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xa2
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA48  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa6
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0xb6
	adds r2, r4, #0
	bl PutSpriteExt
_080CBA0C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #7
	bne _080CBA4C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBA52
	.align 2, 0
_080CBA20: .4byte 0x0000FFFF
_080CBA24: .4byte 0x000001FF
_080CBA28: .4byte gUnknown_08AA709C
_080CBA2C: .4byte 0x00001078
_080CBA30: .4byte gUnknown_08AA712A
_080CBA34: .4byte 0x000041E0
_080CBA38: .4byte 0x00005258
_080CBA3C: .4byte 0x000020F0
_080CBA40: .4byte 0x00003168
_080CBA44: .4byte 0x000062D0
_080CBA48: .4byte 0x00007348
_080CBA4C:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBA52:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB878

	THUMB_FUNC_START sub_80CBA64
sub_80CBA64: @ 0x080CBA64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBAE6
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBAE6
	cmp r7, #0xc8
	bgt _080CBAE6
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CBC08  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC0C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CBAE6:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBB6A
	cmp r7, r0
	beq _080CBB6A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBB6A
	cmp r7, #0xc8
	bgt _080CBB6A
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC18  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC1C  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBB6A:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x84
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBBF0
	cmp r7, r0
	beq _080CBBF0
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBBF0
	cmp r7, #0xc8
	bgt _080CBBF0
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC20  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC24  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBBF0:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #6
	bne _080CBC28
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBC2E
	.align 2, 0
_080CBC04: .4byte 0x0000FFFF
_080CBC08: .4byte gUnknown_08AA709C
_080CBC0C: .4byte 0x00001078
_080CBC10: .4byte gUnknown_08AA715C
_080CBC14: .4byte 0x000001FF
_080CBC18: .4byte 0x000020F0
_080CBC1C: .4byte 0x00003168
_080CBC20: .4byte 0x000041E0
_080CBC24: .4byte 0x00005258
_080CBC28:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBC2E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBA64

	THUMB_FUNC_START sub_80CBC40
sub_80CBC40: @ 0x080CBC40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBD3C  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CBCAC
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD48  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CBCAC:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CBCFE
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	ldr r0, _080CBD54  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD58  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBCFE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #1
	bne _080CBD28
	ldr r0, _080CBD5C  @ gUnknown_08AF4330
	ldr r4, _080CBD60  @ 0x0600F000
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CBD1A:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080CBD1A
_080CBD28:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #5
	bne _080CBD64
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CBD6A
	.align 2, 0
_080CBD3C: .4byte 0x0000FFFF
_080CBD40: .4byte 0x000001FF
_080CBD44: .4byte gUnknown_08AA709C
_080CBD48: .4byte 0x00001078
_080CBD4C: .4byte 0x00000828
_080CBD50: .4byte gUnknown_08AA7194
_080CBD54: .4byte 0x000020F0
_080CBD58: .4byte 0x00003168
_080CBD5C: .4byte gUnknown_08AF4330
_080CBD60: .4byte 0x0600F000
_080CBD64:
	adds r0, #1
	mov r3, r8
	strh r0, [r3, #0x2a]
_080CBD6A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBC40

	THUMB_FUNC_START sub_80CBD7C
sub_80CBD7C: @ 0x080CBD7C
	push {r4, lr}
	bl EndAllProcChildren
	bl sub_80C71D4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl DeleteSome6C
	ldr r4, _080CBDCC  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r1, _080CBDD0  @ gPaletteBuffer
	ldr r0, _080CBDD4  @ gUnknown_02022188
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	bl EnablePaletteSync
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBDCC: .4byte gLCDControlBuffer
_080CBDD0: .4byte gPaletteBuffer
_080CBDD4: .4byte gUnknown_02022188

	THUMB_FUNC_END sub_80CBD7C

	THUMB_FUNC_START sub_80CBDD8
sub_80CBDD8: @ 0x080CBDD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #2
	beq _080CBDEA
	bl ShouldSkipHSScreen
	cmp r0, #0
	beq _080CBE00
_080CBDEA:
	ldr r0, _080CBE08  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080CBE00
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080CBE00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBE08: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80CBDD8

	THUMB_FUNC_START sub_80CBE0C
sub_80CBE0C: @ 0x080CBE0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r5, _080CBECC  @ gLCDControlBuffer
	ldrb r1, [r5, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	mov sl, r1
	ands r0, r1
	subs r1, #2
	mov r9, r1
	ands r0, r1
	subs r1, #4
	mov r8, r1
	ands r0, r1
	movs r6, #0x11
	negs r6, r6
	ands r0, r6
	strb r0, [r5, #1]
	ldr r0, _080CBED0  @ gUnknown_08B10630
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CBED4  @ gUnknown_08B104D8
	ldr r4, _080CBED8  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CBEDC  @ gBG0TilemapBuffer
	adds r1, r4, #0
	movs r2, #0
	bl CallARM_FillTileRect
	ldr r0, _080CBEE0  @ gUnknown_08B10CA4
	ldr r1, _080CBEE4  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CBEE8  @ gUnknown_08B10ADC
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CBEEC  @ gBG1TilemapBuffer
	movs r2, #0x88
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r4, #0
	str r4, [sp]
	ldr r1, _080CBEF0  @ gPaletteBuffer
	ldr r2, _080CBEF4  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	movs r0, #3
	bl BG_EnableSyncByMask
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	ands r0, r1
	mov r1, r9
	ands r0, r1
	mov r1, r8
	ands r0, r1
	ands r0, r6
	strb r0, [r5, #1]
	str r4, [r7, #0x30]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CBECC: .4byte gLCDControlBuffer
_080CBED0: .4byte gUnknown_08B10630
_080CBED4: .4byte gUnknown_08B104D8
_080CBED8: .4byte gGenericBuffer
_080CBEDC: .4byte gBG0TilemapBuffer
_080CBEE0: .4byte gUnknown_08B10CA4
_080CBEE4: .4byte 0x06002000
_080CBEE8: .4byte gUnknown_08B10ADC
_080CBEEC: .4byte gBG1TilemapBuffer
_080CBEF0: .4byte gPaletteBuffer
_080CBEF4: .4byte 0x01000100

	THUMB_FUNC_END sub_80CBE0C

	THUMB_FUNC_START sub_80CBEF8
sub_80CBEF8: @ 0x080CBEF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r3, #0
	lsls r2, r2, #4
	lsls r1, r1, #5
	ldr r0, _080CBF74  @ gPaletteBuffer
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [sp, #0x20]
	cmp r7, r0
	bge _080CBF78
	cmp r2, #0
	ble _080CBF86
	mov r9, r4
	mov sl, r2
_080CBF1E:
	mov r1, r9
	ldrh r4, [r1]
	adds r0, r4, #0
	movs r1, #0x1f
	ands r0, r1
	muls r0, r7, r0
	ldr r1, [sp, #0x20]
	bl __divsi3
	adds r6, r0, #0
	asrs r0, r4, #5
	movs r1, #0x1f
	ands r0, r1
	muls r0, r7, r0
	ldr r1, [sp, #0x20]
	bl __divsi3
	adds r5, r0, #0
	asrs r4, r4, #0xa
	movs r0, #0x1f
	ands r4, r0
	adds r0, r4, #0
	muls r0, r7, r0
	ldr r1, [sp, #0x20]
	bl __divsi3
	lsls r5, r5, #5
	orrs r5, r6
	lsls r0, r0, #0xa
	orrs r0, r5
	mov r1, r8
	strh r0, [r1]
	movs r0, #2
	add r8, r0
	add r9, r0
	movs r1, #1
	negs r1, r1
	add sl, r1
	mov r0, sl
	cmp r0, #0
	bne _080CBF1E
	b _080CBF86
	.align 2, 0
_080CBF74: .4byte gPaletteBuffer
_080CBF78:
	asrs r2, r2, #1
	ldr r0, _080CBF98  @ 0x001FFFFF
	ands r2, r0
	adds r0, r4, #0
	mov r1, r8
	bl CpuFastSet
_080CBF86:
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CBF98: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_80CBEF8

	THUMB_FUNC_START sub_80CBF9C
sub_80CBF9C: @ 0x080CBF9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080CBFB8  @ gPaletteBuffer
	ldr r1, _080CBFBC  @ gUnknown_02000000
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #4
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBFB8: .4byte gPaletteBuffer
_080CBFBC: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_80CBF9C

	THUMB_FUNC_START sub_80CBFC0
sub_80CBFC0: @ 0x080CBFC0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	subs r0, #1
	str r0, [r7, #0x38]
	cmp r0, #0
	ble _080CC044
	movs r6, #0
	ldr r0, _080CC038  @ gPaletteBuffer
	mov r9, r0
	movs r3, #0x1f
	mov r8, r3
	ldr r4, _080CC03C  @ gUnknown_02000000
	mov ip, r4
_080CBFE4:
	lsls r2, r6, #1
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	ldr r1, [r7, #0x38]
	muls r0, r1, r0
	cmp r0, #0
	bge _080CBFF8
	adds r0, #3
_080CBFF8:
	asrs r5, r0, #2
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x15
	mov r4, r8
	ands r0, r4
	muls r0, r1, r0
	cmp r0, #0
	bge _080CC00A
	adds r0, #3
_080CC00A:
	asrs r4, r0, #2
	lsrs r0, r3, #0x1a
	mov r3, r8
	ands r0, r3
	muls r0, r1, r0
	cmp r0, #0
	bge _080CC01A
	adds r0, #3
_080CC01A:
	asrs r1, r0, #2
	add r2, r9
	lsls r0, r4, #5
	orrs r0, r5
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r2]
	movs r4, #2
	add ip, r4
	adds r6, #1
	ldr r0, _080CC040  @ 0x000001FF
	cmp r6, r0
	ble _080CBFE4
	b _080CC058
	.align 2, 0
_080CC038: .4byte gPaletteBuffer
_080CC03C: .4byte gUnknown_02000000
_080CC040: .4byte 0x000001FF
_080CC044:
	movs r0, #0
	str r0, [sp]
	ldr r1, _080CC06C  @ gPaletteBuffer
	ldr r2, _080CC070  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	adds r0, r7, #0
	bl Proc_Break
_080CC058:
	bl EnablePaletteSync
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC06C: .4byte gPaletteBuffer
_080CC070: .4byte 0x01000100

	THUMB_FUNC_END sub_80CBFC0

	THUMB_FUNC_START sub_80CC074
sub_80CC074: @ 0x080CC074
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	cmp r0, #0
	bgt _080CC08C
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_080CC08C:
	adds r0, r4, #0
	bl sub_80CBDD8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CC074

	THUMB_FUNC_START sub_80CC098
sub_80CC098: @ 0x080CC098
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080CC0C0
	ldr r2, _080CC0F4  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
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
_080CC0C0:
	ldr r3, [r4, #0x30]
	adds r3, #1
	str r3, [r4, #0x30]
	ldr r0, _080CC0F8  @ gUnknown_08B10ABC
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #0
	movs r2, #1
	bl sub_80CBEF8
	ldr r0, [r4, #0x30]
	cmp r0, #0x1d
	ble _080CC0E4
	movs r0, #0x3c
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080CC0E4:
	adds r0, r4, #0
	bl sub_80CBDD8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC0F4: .4byte gLCDControlBuffer
_080CC0F8: .4byte gUnknown_08B10ABC

	THUMB_FUNC_END sub_80CC098

	THUMB_FUNC_START sub_80CC0FC
sub_80CC0FC: @ 0x080CC0FC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r3, #1
	str r3, [r4, #0x30]
	ldr r0, _080CC138  @ gUnknown_08B10ABC
	movs r1, #0x1e
	subs r3, r1, r3
	str r1, [sp]
	movs r1, #0
	movs r2, #1
	bl sub_80CBEF8
	ldr r0, [r4, #0x30]
	cmp r0, #0x1d
	ble _080CC128
	movs r0, #0x28
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080CC128:
	adds r0, r4, #0
	bl sub_80CBDD8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC138: .4byte gUnknown_08B10ABC

	THUMB_FUNC_END sub_80CC0FC

	THUMB_FUNC_START sub_80CC13C
sub_80CC13C: @ 0x080CC13C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080CC166
	ldr r2, _080CC198  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_080CC166:
	ldr r3, [r4, #0x30]
	adds r3, #1
	str r3, [r4, #0x30]
	ldr r0, _080CC19C  @ gUnknown_08B11864
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #1
	movs r2, #3
	bl sub_80CBEF8
	ldr r0, [r4, #0x30]
	cmp r0, #0x1d
	ble _080CC18A
	movs r0, #0x3c
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080CC18A:
	adds r0, r4, #0
	bl sub_80CBDD8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC198: .4byte gLCDControlBuffer
_080CC19C: .4byte gUnknown_08B11864

	THUMB_FUNC_END sub_80CC13C

	THUMB_FUNC_START sub_80CC1A0
sub_80CC1A0: @ 0x080CC1A0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r3, #1
	str r3, [r4, #0x30]
	ldr r0, _080CC1DC  @ gUnknown_08B11864
	movs r1, #0x28
	subs r3, r1, r3
	str r1, [sp]
	movs r1, #1
	movs r2, #3
	bl sub_80CBEF8
	ldr r0, [r4, #0x30]
	cmp r0, #0x27
	ble _080CC1CC
	movs r0, #0x3c
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080CC1CC:
	adds r0, r4, #0
	bl sub_80CBDD8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC1DC: .4byte gUnknown_08B11864

	THUMB_FUNC_END sub_80CC1A0

	THUMB_FUNC_START sub_80CC1E0
sub_80CC1E0: @ 0x080CC1E0
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80CC1E0

	THUMB_FUNC_START sub_80CC1E8
sub_80CC1E8: @ 0x080CC1E8
	movs r1, #1
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80CC1E8

	THUMB_FUNC_START sub_80CC1F0
sub_80CC1F0: @ 0x080CC1F0
	movs r1, #2
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80CC1F0

	THUMB_FUNC_START PrepareHealthAndSafetyScreen
PrepareHealthAndSafetyScreen: @ 0x080CC1F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl ShouldSkipHSScreen
	cmp r0, #1
	bne _080CC21C
	ldr r1, _080CC218  @ 0x000003E7
	adds r0, r7, #0
	bl Proc_Goto
	b _080CC2BA
	.align 2, 0
_080CC218: .4byte 0x000003E7
_080CC21C:
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r6, _080CC2CC  @ gLCDControlBuffer
	ldrb r1, [r6, #1]
	movs r4, #2
	negs r4, r4
	adds r0, r4, #0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	mov sl, r1
	ands r0, r1
	subs r1, #4
	mov r9, r1
	ands r0, r1
	subs r1, #8
	mov r8, r1
	ands r0, r1
	strb r0, [r6, #1]
	ldr r0, _080CC2D0  @ gUnknown_08B11D0C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CC2D4  @ gUnknown_08B118C4
	ldr r5, _080CC2D8  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CC2DC  @ gBG1TilemapBuffer
	adds r1, r5, #0
	movs r2, #0
	bl CallARM_FillTileRect
	ldr r0, _080CC2E0  @ gUnknown_08B11C0C
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CC2E4  @ gBG0TilemapBuffer
	adds r1, r5, #0
	movs r2, #0
	bl CallARM_FillTileRect
	movs r5, #0
	str r5, [sp]
	ldr r1, _080CC2E8  @ gPaletteBuffer
	ldr r2, _080CC2EC  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	movs r0, #3
	bl BG_EnableSyncByMask
	ldrb r0, [r6, #1]
	ands r4, r0
	movs r0, #2
	orrs r4, r0
	mov r0, sl
	ands r4, r0
	mov r1, r9
	ands r4, r1
	mov r0, r8
	ands r4, r0
	strb r4, [r6, #1]
	str r5, [r7, #0x30]
	ldr r0, _080CC2F0  @ 0x000003FF
	bl SetKeyStatus_IgnoreMask
_080CC2BA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC2CC: .4byte gLCDControlBuffer
_080CC2D0: .4byte gUnknown_08B11D0C
_080CC2D4: .4byte gUnknown_08B118C4
_080CC2D8: .4byte gGenericBuffer
_080CC2DC: .4byte gBG1TilemapBuffer
_080CC2E0: .4byte gUnknown_08B11C0C
_080CC2E4: .4byte gBG0TilemapBuffer
_080CC2E8: .4byte gPaletteBuffer
_080CC2EC: .4byte 0x01000100
_080CC2F0: .4byte 0x000003FF

	THUMB_FUNC_END PrepareHealthAndSafetyScreen

	THUMB_FUNC_START sub_80CC2F4
sub_80CC2F4: @ 0x080CC2F4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r3, #1
	str r3, [r4, #0x30]
	ldr r0, _080CC328  @ gUnknown_08B125F4
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #0
	movs r2, #1
	bl sub_80CBEF8
	ldr r0, [r4, #0x30]
	cmp r0, #0x1d
	ble _080CC31E
	movs r0, #0x5a
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080CC31E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC328: .4byte gUnknown_08B125F4

	THUMB_FUNC_END sub_80CC2F4

	THUMB_FUNC_START sub_80CC32C
sub_80CC32C: @ 0x080CC32C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x30]
	cmp r3, #0
	bne _080CC368
	ldr r2, _080CC39C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	str r3, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetKeyStatus_IgnoreMask
_080CC368:
	ldr r2, [r5, #0x30]
	adds r1, r2, #1
	str r1, [r5, #0x30]
	adds r0, r1, #0
	cmp r1, #0
	bge _080CC378
	adds r0, r2, #0
	adds r0, #0x40
_080CC378:
	asrs r0, r0, #6
	lsls r0, r0, #6
	subs r0, r1, r0
	asrs r0, r0, #1
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r1, #0
	blt _080CC3A0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	b _080CC3B0
	.align 2, 0
_080CC39C: .4byte gLCDControlBuffer
_080CC3A0:
	negs r3, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetSpecialColorEffectsParameters
_080CC3B0:
	ldr r1, [r5, #0x30]
	ldr r0, _080CC420  @ 0x00000E0F
	cmp r1, r0
	bgt _080CC3C6
	ldr r0, _080CC424  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	ldr r0, _080CC428  @ 0x000003FF
	ands r0, r1
	cmp r0, #0
	beq _080CC416
_080CC3C6:
	movs r4, #0
	str r4, [r5, #0x30]
	ldr r2, _080CC42C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	bl Proc_Break
_080CC416:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CC420: .4byte 0x00000E0F
_080CC424: .4byte gKeyStatusPtr
_080CC428: .4byte 0x000003FF
_080CC42C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CC32C

	THUMB_FUNC_START sub_80CC430
sub_80CC430: @ 0x080CC430
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r3, #1
	str r3, [r4, #0x30]
	ldr r0, _080CC464  @ gUnknown_08B125F4
	movs r1, #0x1e
	subs r3, r1, r3
	str r1, [sp]
	movs r1, #0
	movs r2, #1
	bl sub_80CBEF8
	ldr r0, [r4, #0x30]
	cmp r0, #0x1d
	ble _080CC45C
	movs r0, #0x28
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080CC45C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC464: .4byte gUnknown_08B125F4

	THUMB_FUNC_END sub_80CC430

.align 2, 0
