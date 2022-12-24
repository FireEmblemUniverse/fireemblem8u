	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80952CC
sub_80952CC: @ 0x080952CC
	bx lr

	THUMB_FUNC_END sub_80952CC

	THUMB_FUNC_START __malloc_unlock_1
__malloc_unlock_1: @ 0x080952D0
	bx lr

	THUMB_FUNC_END __malloc_unlock_1

	THUMB_FUNC_START sub_80952D4
sub_80952D4: @ 0x080952D4
	push {lr}
	ldr r1, _080952E8  @ gUnknown_0203E87C
	movs r2, #0
	adds r0, r1, #4
_080952DC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080952DC
	pop {r0}
	bx r0
	.align 2, 0
_080952E8: .4byte gUnknown_0203E87C

	THUMB_FUNC_END sub_80952D4

	THUMB_FUNC_START sub_80952EC
sub_80952EC: @ 0x080952EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _08095304  @ gUnknown_0203E87C
_080952F6:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08095308
	strb r3, [r1]
	b _0809530E
	.align 2, 0
_08095304: .4byte gUnknown_0203E87C
_08095308:
	adds r2, #1
	cmp r2, #4
	ble _080952F6
_0809530E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80952EC

	THUMB_FUNC_START sub_8095314
sub_8095314: @ 0x08095314
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08095344  @ gUnknown_0203E87C
	adds r4, r3, #0
_08095320:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08095348
	adds r2, r1, #0
	cmp r1, #3
	bgt _0809533C
	adds r1, r1, r4
_08095330:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble _08095330
_0809533C:
	movs r0, #0
	strb r0, [r3, #4]
	b _0809534E
	.align 2, 0
_08095344: .4byte gUnknown_0203E87C
_08095348:
	adds r1, #1
	cmp r1, #4
	ble _08095320
_0809534E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095314

	THUMB_FUNC_START sub_8095354
sub_8095354: @ 0x08095354
	ldr r1, _08095360  @ gUnknown_020121CC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08095360: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095354

	THUMB_FUNC_START sub_8095364
sub_8095364: @ 0x08095364
	ldr r2, _08095370  @ gUnknown_020121CC
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08095370: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095364

	THUMB_FUNC_START sub_8095374
sub_8095374: @ 0x08095374
	ldr r0, _08095380  @ gUnknown_020121CC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08095380: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095374

	THUMB_FUNC_START sub_8095384
sub_8095384: @ 0x08095384
	ldr r1, _08095390  @ gUnknown_020121CC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_08095390: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095384

	THUMB_FUNC_START sub_8095394
sub_8095394: @ 0x08095394
	push {lr}
	ldr r0, _080953A8  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080953AC
	bl sub_80C4088
	b _080953B6
	.align 2, 0
_080953A8: .4byte gGMData
_080953AC:
	ldr r0, _080953BC  @ gUnknown_020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
_080953B6:
	pop {r1}
	bx r1
	.align 2, 0
_080953BC: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095394

	THUMB_FUNC_START sub_80953C0
sub_80953C0: @ 0x080953C0
	push {lr}
	adds r2, r0, #0
	ldr r0, _080953D8  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080953DC
	adds r0, r2, #0
	bl sub_80C409C
	b _080953E6
	.align 2, 0
_080953D8: .4byte gGMData
_080953DC:
	ldr r0, _080953EC  @ gUnknown_020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
_080953E6:
	pop {r0}
	bx r0
	.align 2, 0
_080953EC: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_80953C0

	THUMB_FUNC_START IsCharacterForceDeployed
IsCharacterForceDeployed: @ 0x080953F0
	push {r4, lr}
	adds r4, r0, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095414
	bl GetChapterThing
	cmp r0, #0
	bne _08095414
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl IsCharacterForceDeployed_
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08095416
_08095414:
	movs r0, #0
_08095416:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsCharacterForceDeployed

	THUMB_FUNC_START sub_809541C
sub_809541C: @ 0x0809541C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_08095422:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809544A
	ldr r2, [r0]
	cmp r2, #0
	beq _0809544A
	ldr r0, [r0, #0xc]
	ldr r1, _08095458  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809544A
	ldrb r0, [r2, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809544A
	adds r5, #1
_0809544A:
	adds r4, #1
	cmp r4, #0x3f
	ble _08095422
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08095458: .4byte 0x00010004

	THUMB_FUNC_END sub_809541C

	THUMB_FUNC_START SomeLeftoverFunctionThatReturns0
SomeLeftoverFunctionThatReturns0: @ 0x0809545C
	movs r0, #0
	bx lr

	THUMB_FUNC_END SomeLeftoverFunctionThatReturns0

	THUMB_FUNC_START IsUnitInCurrentRoster
IsUnitInCurrentRoster: @ 0x08095460
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _08095488  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08095490
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0809548C
	movs r0, #1
	b _08095492
	.align 2, 0
_08095488: .4byte 0x00010004
_0809548C:
	movs r0, #8
	str r0, [r2, #0xc]
_08095490:
	movs r0, #0
_08095492:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitInCurrentRoster

	THUMB_FUNC_START sub_8095498
sub_8095498: @ 0x08095498
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r2, r0, #0
	adds r2, #0x2f
	strb r6, [r2]
	ldr r0, _080954F8  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080954EE
	movs r4, #0
	adds r5, r2, #0
_080954B4:
	adds r0, r4, #0
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080954CA
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080954CA:
	adds r4, #1
	cmp r4, #3
	ble _080954B4
	movs r0, #2
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080954DE
	movs r6, #1
_080954DE:
	ldr r1, _080954FC  @ PrepScreenMenu_OnSupport
	ldr r3, _08095500  @ 0x00000577
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl SetPrepScreenMenuItem
_080954EE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080954F8: .4byte gRAMChapterData
_080954FC: .4byte PrepScreenMenu_OnSupport
_08095500: .4byte 0x00000577

	THUMB_FUNC_END sub_8095498

	THUMB_FUNC_START sub_8095504
sub_8095504: @ 0x08095504
	push {lr}
	ldr r0, _08095518  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7d
	beq _0809551C
	movs r0, #1
	b _0809551E
	.align 2, 0
_08095518: .4byte gRAMChapterData
_0809551C:
	movs r0, #0
_0809551E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095504

	THUMB_FUNC_START AtMenu_InitPrepScreenMenu
AtMenu_InitPrepScreenMenu: @ 0x08095524
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl StartPrepScreenMenu
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _080955CC
	ldr r1, _0809557C  @ PrepScreenMenu_OnPickUnits
	ldr r3, _08095580  @ 0x00000574
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08095584  @ PrepScreenMenu_OnItems
	ldr r3, _08095588  @ 0x00000576
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	adds r0, r5, #0
	bl sub_8095498
	bl sub_8095504
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08095590
	ldr r1, _0809558C  @ PrepScreenMenu_OnCheckMap
	movs r3, #0xaf
	lsls r3, r3, #3
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl SetPrepScreenMenuItem
	b _080955A0
	.align 2, 0
_0809557C: .4byte PrepScreenMenu_OnPickUnits
_08095580: .4byte 0x00000574
_08095584: .4byte PrepScreenMenu_OnItems
_08095588: .4byte 0x00000576
_0809558C: .4byte PrepScreenMenu_OnCheckMap
_08095590:
	ldr r1, _080955C0  @ PrepScreenMenu_OnCheckMap
	movs r3, #0xaf
	lsls r3, r3, #3
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl SetPrepScreenMenuItem
_080955A0:
	movs r4, #0
	bl sub_8094FF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080955AE
	movs r4, #1
_080955AE:
	ldr r1, _080955C4  @ PrepScreenMenu_OnSave
	ldr r3, _080955C8  @ 0x00000579
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	bl SetPrepScreenMenuItem
	b _080955F8
	.align 2, 0
_080955C0: .4byte PrepScreenMenu_OnCheckMap
_080955C4: .4byte PrepScreenMenu_OnSave
_080955C8: .4byte 0x00000579
_080955CC:
	ldr r1, _08095630  @ PrepScreenMenu_OnPickUnits
	ldr r3, _08095634  @ 0x00000574
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08095638  @ PrepScreenMenu_OnItems
	ldr r3, _0809563C  @ 0x00000576
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08095640  @ sub_8095284
	ldr r3, _08095644  @ 0x0000075C
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl SetPrepScreenMenuItem
_080955F8:
	ldr r0, _08095648  @ PrepScreenMenu_OnBPress
	bl sub_8096FD0
	ldr r0, _0809564C  @ PrepScreenMenu_OnStartPress
	bl sub_8096FEC
	ldr r0, _08095650  @ gBG0TilemapBuffer
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _08095654  @ gBG1TilemapBuffer
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TileMap_FillRect
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095658
	movs r0, #1
	movs r1, #5
	bl sub_8097200
	b _08095660
	.align 2, 0
_08095630: .4byte PrepScreenMenu_OnPickUnits
_08095634: .4byte 0x00000574
_08095638: .4byte PrepScreenMenu_OnItems
_0809563C: .4byte 0x00000576
_08095640: .4byte sub_8095284
_08095644: .4byte 0x0000075C
_08095648: .4byte PrepScreenMenu_OnBPress
_0809564C: .4byte PrepScreenMenu_OnStartPress
_08095650: .4byte gBG0TilemapBuffer
_08095654: .4byte gBG1TilemapBuffer
_08095658:
	movs r0, #1
	movs r1, #6
	bl sub_8097200
_08095660:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl sub_80970CC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_InitPrepScreenMenu

	THUMB_FUNC_START sub_8095674
sub_8095674: @ 0x08095674
	push {r4, r5, lr}
	movs r5, #0
	b _08095696
_0809567A:
	bl GetLastStatScreenUid
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8095354
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _08095694
	adds r0, r5, #0
	b _080956A0
_08095694:
	adds r5, #1
_08095696:
	bl sub_8095374
	cmp r5, r0
	blt _0809567A
	movs r0, #0
_080956A0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095674

	THUMB_FUNC_START sub_80956A8
sub_80956A8: @ 0x080956A8
	push {r4, r5, lr}
	movs r5, #0
	b _080956C6
_080956AE:
	adds r0, r5, #0
	bl sub_8095354
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl sub_8095394
	cmp r4, r0
	bne _080956C4
	adds r0, r5, #0
	b _080956D0
_080956C4:
	adds r5, #1
_080956C6:
	bl sub_8095374
	cmp r5, r0
	blt _080956AE
	movs r0, #0
_080956D0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80956A8

	THUMB_FUNC_START ReorderPlayerUnitsBasedOnDeployment
ReorderPlayerUnitsBasedOnDeployment: @ 0x080956D8
	push {r4, lr}
	ldr r0, _08095740  @ gUnknown_020111CC
	bl InitUnitStack
	movs r4, #1
_080956E2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08095704
	ldr r0, [r2]
	cmp r0, #0
	beq _08095704
	ldr r0, [r2, #0xc]
	ldr r1, _08095744  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08095704
	adds r0, r2, #0
	bl PushUnit
_08095704:
	adds r4, #1
	cmp r4, #0x3f
	ble _080956E2
	movs r4, #1
_0809570C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809572E
	ldr r0, [r2]
	cmp r0, #0
	beq _0809572E
	ldr r0, [r2, #0xc]
	ldr r1, _08095744  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0809572E
	adds r0, r2, #0
	bl PushUnit
_0809572E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809570C
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095740: .4byte gUnknown_020111CC
_08095744: .4byte 0x0001000C

	THUMB_FUNC_END ReorderPlayerUnitsBasedOnDeployment

	THUMB_FUNC_START SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x08095748
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0809580C  @ gUnknown_020111CC
	bl InitUnitStack
	movs r5, #1
_0809575A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08095794
	ldr r0, [r4]
	cmp r0, #0
	beq _08095794
	ldr r0, [r4, #0xc]
	ldr r1, _08095810  @ 0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095794
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095794
	adds r0, r4, #0
	bl PushUnit
_08095794:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809575A
	movs r5, #1
_0809579C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080957CE
	ldr r0, [r4]
	cmp r0, #0
	beq _080957CE
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080957C8
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080957CE
_080957C8:
	adds r0, r4, #0
	bl PushUnit
_080957CE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809579C
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_080957DA:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08095832
	ldr r0, [r4]
	cmp r0, #0
	beq _08095832
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095832
	adds r0, r4, #0
	bl SomeLeftoverFunctionThatReturns0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095818
	ldr r0, [r4, #0xc]
	ldr r1, _08095814  @ gUnknown_02000008
	b _0809582E
	.align 2, 0
_0809580C: .4byte gUnknown_020111CC
_08095810: .4byte 0xFDFFFFFF
_08095814: .4byte gUnknown_02000008
_08095818:
	cmp r7, r6
	ble _0809582A
	ldr r0, [r4, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _08095832
_0809582A:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0809582E:
	orrs r0, r1
	str r0, [r4, #0xc]
_08095832:
	adds r5, #1
	cmp r5, #0x3f
	ble _080957DA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END SortPlayerUnitsForPrepScreen

	THUMB_FUNC_START sub_8095840
sub_8095840: @ 0x08095840
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #1
_08095848:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov r8, r4
	cmp r5, #0
	beq _080958AC
	ldr r0, [r5]
	cmp r0, #0
	beq _080958AC
	movs r7, #0
	ldr r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl GetUnitItemCount
	cmp r7, r0
	bge _080958A2
	adds r4, r5, #0
	adds r4, #0x1e
	adds r6, r0, #0
_08095878:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0xb7
	beq _08095894
	cmp r0, #0xb7
	bgt _08095890
	cmp r0, #0x84
	bgt _0809589A
	cmp r0, #0x81
	blt _0809589A
	b _08095894
_08095890:
	cmp r0, #0xcc
	bne _0809589A
_08095894:
	movs r0, #0
	strh r0, [r4]
	movs r7, #1
_0809589A:
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bne _08095878
_080958A2:
	cmp r7, #0
	beq _080958AC
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_080958AC:
	mov r4, r8
	cmp r4, #0x3f
	ble _08095848
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095840

	THUMB_FUNC_START sub_80958BC
sub_80958BC: @ 0x080958BC
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #1
_080958C2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080958EA
	ldr r0, [r4]
	cmp r0, #0
	beq _080958EA
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080958EA
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8095364
	adds r6, #1
_080958EA:
	adds r5, #1
	cmp r5, #0x3f
	ble _080958C2
	adds r0, r6, #0
	bl sub_8095384
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80958BC

	THUMB_FUNC_START sub_80958FC
sub_80958FC: @ 0x080958FC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _08095918
_08095904:
	adds r0, r4, #0
	bl sub_8095354
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _08095916
	adds r0, r4, #0
	b _08095922
_08095916:
	adds r4, #1
_08095918:
	bl sub_8095374
	cmp r4, r0
	blt _08095904
	movs r0, #0
_08095922:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80958FC

	THUMB_FUNC_START sub_8095928
sub_8095928: @ 0x08095928
	push {r4, lr}
	bl SMS_ClearUsageTable
	movs r4, #0
	b _0809595E
_08095932:
	adds r0, r4, #0
	bl sub_8095354
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0809594C
	movs r0, #3
	negs r0, r0
	ands r1, r0
	b _08095950
_0809594C:
	movs r0, #0xa
	orrs r1, r0
_08095950:
	str r1, [r2, #0xc]
	adds r0, r2, #0
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	adds r4, #1
_0809595E:
	bl sub_8095374
	cmp r4, r0
	blt _08095932
	bl SMS_FlushIndirect
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095928

	THUMB_FUNC_START sub_8095970
sub_8095970: @ 0x08095970
	push {r4, r5, r6, lr}
	movs r5, #0
	bl GetChapterAllyUnitCount
	adds r6, r0, #0
	movs r4, #0
	b _080959A0
_0809597E:
	adds r0, r4, #0
	bl sub_8095354
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r3, #8
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0809599E
	cmp r5, r6
	blt _0809599C
	orrs r1, r3
	str r1, [r2, #0xc]
	b _0809599E
_0809599C:
	adds r5, #1
_0809599E:
	adds r4, #1
_080959A0:
	bl sub_8095374
	cmp r4, r0
	blt _0809597E
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095970

	THUMB_FUNC_START AtMenu_AutoCapDeployPrepScreenUnits
AtMenu_AutoCapDeployPrepScreenUnits: @ 0x080959B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	movs r6, #0
	adds r7, r1, #0
	b _080959FC
_080959CA:
	adds r0, r6, #0
	bl sub_8095354
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r5, #8
	ands r0, r5
	cmp r0, #0
	bne _080959F4
	adds r2, r4, #0
	adds r2, #0x2b
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080959F0
	str r5, [r3, #0xc]
	b _080959F4
_080959F0:
	adds r0, #1
	strb r0, [r2]
_080959F4:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	adds r6, #1
_080959FC:
	bl sub_8095374
	cmp r6, r0
	blt _080959CA
	adds r2, r4, #0
	adds r2, #0x29
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r2]
	ldrb r1, [r0]
	cmp r2, r1
	bcs _08095A16
	strb r2, [r0]
_08095A16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_AutoCapDeployPrepScreenUnits

	THUMB_FUNC_START sub_8095A1C
sub_8095A1C: @ 0x08095A1C
	push {lr}
	ldr r0, _08095A34  @ gUnknown_08A006E4
	bl Proc_EndEach
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl sub_8086BB8
	pop {r0}
	bx r0
	.align 2, 0
_08095A34: .4byte gUnknown_08A006E4

	THUMB_FUNC_END sub_8095A1C

	THUMB_FUNC_START EndBG3Slider_
EndBG3Slider_: @ 0x08095A38
	push {lr}
	bl EndBG3Slider
	pop {r0}
	bx r0

	THUMB_FUNC_END EndBG3Slider_

	THUMB_FUNC_START Prep_DrawChapterGoal
Prep_DrawChapterGoal: @ 0x08095A44
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08095AA0  @ 0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _08095AA4  @ gUnknown_0859EF00
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add r4, sp, #0x18
	adds r0, r4, #0
	bl Text_Init3
	mov r0, sp
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	bl GetChapterThing
	adds r5, r4, #0
	cmp r0, #2
	beq _08095AAC
	ldr r0, _08095AA8  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8a
	ldrh r0, [r0]
	b _08095AB0
	.align 2, 0
_08095AA0: .4byte 0x06010000
_08095AA4: .4byte gUnknown_0859EF00
_08095AA8: .4byte gRAMChapterData
_08095AAC:
	movs r0, #0xcf
	lsls r0, r0, #1
_08095AB0:
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END Prep_DrawChapterGoal

	THUMB_FUNC_START sub_8095AD8
sub_8095AD8: @ 0x08095AD8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_80953C0
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095AFA
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b _08095B02
_08095AFA:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x2a
_08095B02:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095AD8

	THUMB_FUNC_START sub_8095B30
sub_8095B30: @ 0x08095B30
	push {r4, r5, lr}
	ldr r5, _08095B5C  @ gUnknown_020111A4
	movs r4, #4
_08095B36:
	adds r0, r5, #0
	bl Text_Clear
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08095B36
	ldr r0, _08095B60  @ gUnknown_02023E42
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095B5C: .4byte gUnknown_020111A4
_08095B60: .4byte gUnknown_02023E42

	THUMB_FUNC_END sub_8095B30

	THUMB_FUNC_START sub_8095B64
sub_8095B64: @ 0x08095B64
	push {r4, lr}
	ldr r4, _08095B80  @ gUnknown_020111A4
	bl GetStringFromIndex
_08095B6C:
	adds r1, r0, #0
_08095B6E:
	ldrb r0, [r1]
	cmp r0, #0
	beq _08095B8C
	cmp r0, #1
	bne _08095B84
	adds r4, #8
	adds r1, #1
	b _08095B6E
	.align 2, 0
_08095B80: .4byte gUnknown_020111A4
_08095B84:
	adds r0, r4, #0
	bl Text_AppendChar
	b _08095B6C
_08095B8C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095B64

	THUMB_FUNC_START sub_8095B94
sub_8095B94: @ 0x08095B94
	push {r4, r5, lr}
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	negs r1, r0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r5, #0
	negs r1, r1
	adds r4, r1, #7
_08095BAA:
	lsls r0, r5, #3
	ldr r1, _08095BD0  @ gUnknown_020111A4
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _08095BD4  @ gUnknown_02023CC2
	adds r1, r1, r2
	bl Text_Draw
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _08095BAA
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095BD0: .4byte gUnknown_020111A4
_08095BD4: .4byte gUnknown_02023CC2

	THUMB_FUNC_END sub_8095B94

	THUMB_FUNC_START sub_8095BD8
sub_8095BD8: @ 0x08095BD8
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl sub_8095B30
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095BD8

	THUMB_FUNC_START sub_8095BE8
sub_8095BE8: @ 0x08095BE8
	push {lr}
	ldr r0, [r0, #0x58]
	bl sub_8095B64
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095BE8

	THUMB_FUNC_START sub_8095BF4
sub_8095BF4: @ 0x08095BF4
	push {lr}
	bl sub_8095B94
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095BF4

.align 2, 0
