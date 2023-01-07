	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START PrepUnit_DrawUnitListNames
PrepUnit_DrawUnitListNames: @ 0x0809A580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov r9, r2
_0809A5A0:
	mov r0, r8
	adds r4, r0, r7
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _0809A61A
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	movs r6, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A5D2
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A5D2
	movs r6, #4
	b _0809A5DE
_0809A5D2:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809A5DE
	movs r6, #1
_0809A5DE:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _0809A63C  @ gUnknown_02013598
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, r9
	lsls r1, r1, #1
	ldr r2, _0809A640  @ gBG2TilemapBuffer
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl DrawTextInline
_0809A61A:
	movs r0, #7
	add r9, r0
	adds r7, #1
	cmp r7, #1
	ble _0809A5A0
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A63C: .4byte gUnknown_02013598
_0809A640: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END PrepUnit_DrawUnitListNames

	THUMB_FUNC_START sub_809A644
sub_809A644: @ 0x0809A644
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _0809A668  @ gUnknown_02023CC8
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809A668: .4byte gUnknown_02023CC8

	THUMB_FUNC_END sub_809A644

	THUMB_FUNC_START PrepUnit_DrawSMSAndObjs
PrepUnit_DrawSMSAndObjs: @ 0x0809A66C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	b _0809A6AE
_0809A67A:
	asrs r0, r6, #1
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _0809A6AC
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutUnitSprite
_0809A6AC:
	adds r6, #1
_0809A6AE:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0809A67A
	mov r0, r8
	ldrh r1, [r0, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0809A758
	ldr r1, _0809A754  @ gLCDControlBuffer
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	movs r4, #5
	negs r4, r4
	ands r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r5
	orrs r0, r3
	ands r0, r4
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x36
	ldrb r0, [r4]
	orrs r0, r5
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	strb r0, [r4]
	b _0809A76E
	.align 2, 0
_0809A754: .4byte gLCDControlBuffer
_0809A758:
	ldr r2, _0809A7D0  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
_0809A76E:
	mov r0, r8
	adds r0, #0x37
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _0809A77E
	adds r0, r1, #1
	strb r0, [r7]
_0809A77E:
	movs r5, #0x87
	lsls r5, r5, #8
	movs r4, #4
	movs r6, #2
_0809A786:
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x81
	ldr r3, _0809A7D4  @ gObject_32x16
	bl PutSpriteExt
	adds r5, #4
	adds r4, #0x20
	subs r6, #1
	cmp r6, #0
	bge _0809A786
	ldrb r0, [r7]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809A7EC
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A7EC
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A7DC
	ldr r3, _0809A7D8  @ gUnknown_08A18E62
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
	b _0809A7EC
	.align 2, 0
_0809A7D0: .4byte gLCDControlBuffer
_0809A7D4: .4byte gObject_32x16
_0809A7D8: .4byte gUnknown_08A18E62
_0809A7DC:
	ldr r3, _0809A80C  @ gUnknown_08A18E4E
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
_0809A7EC:
	ldr r3, _0809A810  @ gUnknown_08A18E34
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8f
	bl PutSpriteExt
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A80C: .4byte gUnknown_08A18E4E
_0809A810: .4byte gUnknown_08A18E34

	THUMB_FUNC_END PrepUnit_DrawSMSAndObjs

	THUMB_FUNC_START PrepUnit_InitTexts
PrepUnit_InitTexts: @ 0x0809A814
	push {r4, r5, lr}
	bl Font_InitForUIDefault
	ldr r5, _0809A868  @ gUnknown_02013598
	movs r4, #0xd
_0809A81E:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A81E
	ldr r5, _0809A86C  @ gUnknown_02013608
	movs r4, #4
_0809A832:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A832
	ldr r4, _0809A870  @ gUnknown_02013630
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl Text_Init
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xc
	bl Text_Init
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A868: .4byte gUnknown_02013598
_0809A86C: .4byte gUnknown_02013608
_0809A870: .4byte gUnknown_02013630

	THUMB_FUNC_END PrepUnit_InitTexts

	THUMB_FUNC_START PrepUnit_InitGfx
PrepUnit_InitGfx: @ 0x0809A874
	push {r4, lr}
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #4
	bl LoadIconPalettes
	movs r4, #0xc0
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #8
	bl Prep_DrawChapterGoal
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_80950E8
	ldr r0, _0809A8D8  @ gUnknown_08A1B730
	ldr r1, _0809A8DC  @ 0x06000440
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8E0  @ gUnknown_08A1B7C8
	ldr r4, _0809A8E4  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8E8  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _0809A8EC  @ gUnknown_08A1D510
	ldr r1, _0809A8F0  @ 0x06010800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8F4  @ Pal_MapBattleInfoNum
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A8D8: .4byte gUnknown_08A1B730
_0809A8DC: .4byte 0x06000440
_0809A8E0: .4byte gUnknown_08A1B7C8
_0809A8E4: .4byte gGenericBuffer
_0809A8E8: .4byte gBG1TilemapBuffer
_0809A8EC: .4byte gUnknown_08A1D510
_0809A8F0: .4byte 0x06010800
_0809A8F4: .4byte Pal_MapBattleInfoNum

	THUMB_FUNC_END PrepUnit_InitGfx

	THUMB_FUNC_START sub_809A8F8
sub_809A8F8: @ 0x0809A8F8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl SetupMapSpritesPalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809A928  @ gUnknown_02022C08
	ldr r2, _0809A92C  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl MakePrepUnitList
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl PrepUpdateSMS
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A928: .4byte gUnknown_02022C08
_0809A92C: .4byte 0x01000008

	THUMB_FUNC_END sub_809A8F8

	THUMB_FUNC_START sub_809A930
sub_809A930: @ 0x0809A930
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0809A9E0  @ gUnknown_02022D72
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov r9, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _0809A9E4  @ gUnknown_02013630
	mov r8, r0
	bl Text_Clear
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, r9
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl DrawTextInline
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl sub_8004B0C
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl DrawDecNumber
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9E0: .4byte gUnknown_02022D72
_0809A9E4: .4byte gUnknown_02013630

	THUMB_FUNC_END sub_809A930

	THUMB_FUNC_START sub_809A9E8
sub_809A9E8: @ 0x0809A9E8
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809A930
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A9E8

	THUMB_FUNC_START PrepUnit_DrawUnitItems
PrepUnit_DrawUnitItems: @ 0x0809A9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl ResetIconGraphics_
	ldr r4, _0809AAE4  @ gUnknown_02022DEA
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _0809AACC
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov r9, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_0809AA38:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r9
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _0809AAE8  @ gUnknown_02013608
	adds r5, r1, r0
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AA76
	movs r6, #1
_0809AA76:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _0809AAEC  @ gUnknown_02022CAA
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DrawTextInline
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _0809AAA6
	movs r5, #2
_0809AAA6:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl DrawDecNumber
	movs r0, #0x80
	add sl, r0
	add r9, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _0809AA38
_0809AACC:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AAE4: .4byte gUnknown_02022DEA
_0809AAE8: .4byte gUnknown_02013608
_0809AAEC: .4byte gUnknown_02022CAA

	THUMB_FUNC_END PrepUnit_DrawUnitItems

	THUMB_FUNC_START sub_809AAF0
sub_809AAF0: @ 0x0809AAF0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _0809AB34
	ldr r4, _0809ABBC  @ gUnknown_02013640
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809ABC0  @ 0x000005A1
	bl GetStringFromIndex
	ldr r5, _0809ABC4  @ gUnknown_02022D02
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #6
	bl DrawTextInline
	ldr r0, _0809ABC8  @ 0x000005A2
	bl GetStringFromIndex
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x29
	bl DrawTextInline
_0809AB34:
	ldr r4, _0809ABCC  @ gUnknown_02022D08
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r3, r4, #2
	adds r5, r7, #0
	adds r5, #0x29
	adds r6, r7, #0
	adds r6, #0x2a
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809AB58
	movs r1, #1
_0809AB58:
	ldrb r2, [r6]
	ldrb r0, [r5]
	subs r2, r2, r0
	adds r0, r3, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r3, r4, #0
	adds r3, #0x12
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809AB82
	movs r1, #4
_0809AB82:
	ldrb r2, [r5]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r3, r4, #0
	adds r3, #0x18
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809ABA6
	movs r1, #4
_0809ABA6:
	ldrb r2, [r6]
	adds r0, r3, #0
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ABBC: .4byte gUnknown_02013640
_0809ABC0: .4byte 0x000005A1
_0809ABC4: .4byte gUnknown_02022D02
_0809ABC8: .4byte 0x000005A2
_0809ABCC: .4byte gUnknown_02022D08

	THUMB_FUNC_END sub_809AAF0

	THUMB_FUNC_START sub_809ABD0
sub_809ABD0: @ 0x0809ABD0
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r0, r1
	bls _0809AC20
	adds r0, r1, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl Reset203E87C_WithVal
	ldr r0, _0809AC1C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC0C
	movs r0, #0x6a
	bl m4aSongNumStart
_0809AC0C:
	ldrh r1, [r4, #0x2e]
	lsrs r1, r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _0809AC34
	.align 2, 0
_0809AC1C: .4byte gRAMChapterData
_0809AC20:
	ldr r0, _0809AC3C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC32
	movs r0, #0x6c
	bl m4aSongNumStart
_0809AC32:
	movs r0, #0
_0809AC34:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AC3C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809ABD0

	THUMB_FUNC_START sub_809AC40
sub_809AC40: @ 0x0809AC40
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AC94
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl Modify203E87C
	ldr r0, _0809AC90  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC80
	movs r0, #0x6b
	bl m4aSongNumStart
_0809AC80:
	ldrh r1, [r5, #0x2e]
	lsrs r1, r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _0809ACA8
	.align 2, 0
_0809AC90: .4byte gRAMChapterData
_0809AC94:
	ldr r0, _0809ACB0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ACA6
	movs r0, #0x6c
	bl m4aSongNumStart
_0809ACA6:
	movs r0, #0
_0809ACA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809ACB0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809AC40

	THUMB_FUNC_START sub_809ACB4
sub_809ACB4: @ 0x0809ACB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0809ACF4
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809ACF0  @ 0x00000C52
_0809ACE6:
	adds r3, r4, #0
	bl sub_8097DA8
	b _0809AD88
	.align 2, 0
_0809ACF0: .4byte 0x00000C52
_0809ACF4:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0809AD76
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD34
	adds r0, r5, #0
	bl sub_8097E74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AD34
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809AD30  @ 0x0000088A
	b _0809ACE6
	.align 2, 0
_0809AD30: .4byte 0x0000088A
_0809AD34:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD6C
	adds r0, r5, #0
	bl sub_8097E38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AD6C
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809AD68  @ 0x00000889
	b _0809ACE6
	.align 2, 0
_0809AD68: .4byte 0x00000889
_0809AD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809ABD0
	b _0809AD7E
_0809AD76:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809AC40
_0809AD7E:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD88
	movs r0, #1
	b _0809AD8A
_0809AD88:
	movs r0, #0
_0809AD8A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809ACB4

	THUMB_FUNC_START ShouldPrepUnitMenuScroll
ShouldPrepUnitMenuScroll: @ 0x0809AD90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _0809ADA4
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r1
	ble _0809ADBA
_0809ADA4:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _0809ADBE
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r5
	blt _0809ADBE
_0809ADBA:
	movs r0, #1
	b _0809ADC0
_0809ADBE:
	movs r0, #0
_0809ADC0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldPrepUnitMenuScroll

	THUMB_FUNC_START sub_809ADC8
sub_809ADC8: @ 0x0809ADC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AE0A
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _0809ADFC
	cmp r4, #0
	bne _0809ADF2
	strh r4, [r5, #0x30]
	b _0809ADF8
_0809ADF2:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809ADF8:
	cmp r4, r6
	ble _0809AE0A
_0809ADFC:
	cmp r4, r1
	bne _0809AE04
	subs r0, r4, #5
	b _0809AE06
_0809AE04:
	subs r0, r4, #4
_0809AE06:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809AE0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809ADC8

	THUMB_FUNC_START sub_809AE10
sub_809AE10: @ 0x0809AE10
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _0809AE26
	movs r5, #1
_0809AE26:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809AE30
	movs r0, #2
	orrs r5, r0
_0809AE30:
	adds r0, r5, #0
	bl sub_80ACD60
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809AE10

	THUMB_FUNC_START ProcPrepUnit_OnInit
ProcPrepUnit_OnInit: @ 0x0809AE3C
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_OnInit

	THUMB_FUNC_START ProcPrepUnit_InitScreen
ProcPrepUnit_InitScreen: @ 0x0809AE7C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0809AFF8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, _0809AFFC  @ gLCDControlBuffer
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
	adds r0, r5, #0
	bl sub_809ADC8
	ldr r0, _0809B000  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0809B004  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0809B008  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl PrepUnit_InitTexts
	bl PrepUnit_InitGfx
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl sub_809A8F8
	ldr r0, _0809B00C  @ PrepUnit_DrawSMSAndObjs
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowPrepScreenHandCursor
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8097748
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	movs r0, #0x20
	movs r1, #0x8f
	movs r2, #9
	adds r3, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809A930
	movs r4, #0
_0809AFC4:
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	adds r4, #1
	cmp r4, #5
	ble _0809AFC4
	adds r0, r5, #0
	movs r1, #0
	bl sub_809AAF0
	adds r0, r5, #0
	bl NewGreenTextColorManager
	ldr r0, _0809B010  @ 0x06014800
	movs r1, #5
	bl LoadDialogueBoxGfx
	bl EndSlidingWallEffectMaybe
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AFF8: .4byte gUnknown_08A181E8
_0809AFFC: .4byte gLCDControlBuffer
_0809B000: .4byte gBG0TilemapBuffer
_0809B004: .4byte gBG1TilemapBuffer
_0809B008: .4byte gBG2TilemapBuffer
_0809B00C: .4byte PrepUnit_DrawSMSAndObjs
_0809B010: .4byte 0x06014800

	THUMB_FUNC_END ProcPrepUnit_InitScreen

	THUMB_FUNC_START sub_809B014
sub_809B014: @ 0x0809B014
	push {lr}
	bl Delete6CMenuScroll
	bl EndAllParallelWorkers
	bl sub_80AD2D4
	bl EndPrepScreenHandCursor
	bl EndHelpPromptSprite
	bl sub_80ACDDC
	bl EndBG3Slider_
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B014

	THUMB_FUNC_START ProcPrepUnit_Idle
ProcPrepUnit_Idle: @ 0x0809B038
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809B046
	b _0809B25A
_0809B046:
	ldr r4, _0809B094  @ gKeyStatusPtr
	ldr r2, [r4]
	ldrh r6, [r2, #6]
	adds r3, r5, #0
	adds r3, #0x36
	movs r7, #4
	strb r7, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B066
	ldrh r6, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_0809B066:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809B0BC
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809B09C
	ldr r0, _0809B098  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B08A
	b _0809B2D4
_0809B08A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809B2D4
	.align 2, 0
_0809B094: .4byte gKeyStatusPtr
_0809B098: .4byte gRAMChapterData
_0809B09C:
	ldr r0, _0809B0B8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B0AE
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B0AE:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B0B8: .4byte gRAMChapterData
_0809B0BC:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B0E4
	ldr r0, _0809B0E0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B0D6
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B0D6:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B0E0: .4byte gRAMChapterData
_0809B0E4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B0F8
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809B2D4
_0809B0F8:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B11A
	adds r0, r5, #0
	bl sub_809ACB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809B110
	b _0809B2D4
_0809B110:
	adds r0, r5, #0
	movs r1, #1
	bl sub_809AAF0
	b _0809B2D4
_0809B11A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B144
	ldr r0, _0809B140  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B134
	movs r0, #0x6b
	bl m4aSongNumStart
_0809B134:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B140: .4byte gRAMChapterData
_0809B144:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _0809B15A
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B15A
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_0809B15A:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0809B17E
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809B17E
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _0809B17E
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0809B17E:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _0809B190
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _0809B190
	strh r0, [r5, #0x2e]
_0809B190:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _0809B1AC
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _0809B1AC
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_0809B1AC:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	bne _0809B1B6
	b _0809B2D4
_0809B1B6:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldr r0, _0809B224  @ sub_809A9E8
	movs r1, #1
	adds r2, r5, #0
	bl sub_80ACE20
	ldr r0, _0809B228  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B1DC
	movs r0, #0x65
	bl m4aSongNumStart
_0809B1DC:
	adds r0, r5, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B22C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bcs _0809B1FC
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_0809B1FC:
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bls _0809B210
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, #6
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_0809B210:
	ldrh r0, [r5, #0x2e]
	movs r1, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl SetPrepScreenHandXPos
	b _0809B252
	.align 2, 0
_0809B224: .4byte sub_809A9E8
_0809B228: .4byte gRAMChapterData
_0809B22C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowPrepScreenHandCursor
_0809B252:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809B2D4
_0809B25A:
	ldrh r3, [r5, #0x2e]
	ldrh r2, [r5, #0x2c]
	cmp r3, r2
	bcs _0809B26E
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
_0809B26E:
	cmp r3, r2
	bls _0809B27E
	adds r1, r5, #0
	adds r1, #0x36
	ldrh r0, [r5, #0x30]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
_0809B27E:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B2A4
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809A644
	ldrh r0, [r5, #0x30]
	lsrs r0, r0, #4
	adds r0, #6
	bl sub_809A644
	adds r0, r5, #0
	bl sub_809AE10
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_0809B2A4:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
_0809B2D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_Idle

	THUMB_FUNC_START sub_809B2DC
sub_809B2DC: @ 0x0809B2DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x34]
	adds r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bne _0809B2FA
	adds r0, r4, #0
	bl Proc_Break
_0809B2FA:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B31C
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809A644
_0809B31C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B2DC

	THUMB_FUNC_START sub_809B324
sub_809B324: @ 0x0809B324
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B33C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
_0809B33C:
	ldrh r1, [r4, #0x34]
	subs r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	subs r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _0809B354
	adds r0, r4, #0
	bl Proc_Break
_0809B354:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B324

	THUMB_FUNC_START nullsub_21
nullsub_21: @ 0x0809B36C
	bx lr

	THUMB_FUNC_END nullsub_21

	THUMB_FUNC_START sub_809B370
sub_809B370: @ 0x0809B370
	push {lr}
	bl nullsub_21
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl ShowPrepScreenHandCursor
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B370

	THUMB_FUNC_START sub_809B388
sub_809B388: @ 0x0809B388
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowPrepScreenHandCursor
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B388

	THUMB_FUNC_START sub_809B3B4
sub_809B3B4: @ 0x0809B3B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809B404  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B3D8
	ldr r0, _0809B408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B3D8
	movs r0, #0x6c
	bl m4aSongNumStart
_0809B3D8:
	ldr r0, _0809B404  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B3FE
	ldr r0, _0809B408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B3F8
	movs r0, #0x65
	bl m4aSongNumStart
_0809B3F8:
	adds r0, r4, #0
	bl Proc_Break
_0809B3FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B404: .4byte gKeyStatusPtr
_0809B408: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809B3B4

	THUMB_FUNC_START ProcPrepUnit_OnEnd
ProcPrepUnit_OnEnd: @ 0x0809B40C
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndBG3Slider_
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_OnEnd

	THUMB_FUNC_START ProcPrepUnit_OnGameStart
ProcPrepUnit_OnGameStart: @ 0x0809B438
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_OnGameStart

	THUMB_FUNC_START sub_809B458
sub_809B458: @ 0x0809B458
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	adds r0, r4, #0
	bl sub_80920DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B458

	THUMB_FUNC_START sub_809B478
sub_809B478: @ 0x0809B478
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetLatestUnitIndexInPrepListByCharId
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_0809B48C:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809B4AE
	ldr r0, [r1]
	cmp r0, #0
	beq _0809B4AE
	ldr r0, [r1, #0xc]
	ldr r1, _0809B4BC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0809B4AE
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0809B4AE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809B48C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B4BC: .4byte 0x0001000C

	THUMB_FUNC_END sub_809B478

	THUMB_FUNC_START sub_809B4C0
sub_809B4C0: @ 0x0809B4C0
	ldr r2, _0809B4E0  @ gLCDControlBuffer
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
_0809B4E0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_809B4C0

	THUMB_FUNC_START sub_809B4E4
sub_809B4E4: @ 0x0809B4E4
	ldr r2, _0809B500  @ gLCDControlBuffer
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
_0809B500: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_809B4E4

	THUMB_FUNC_START sub_809B504
sub_809B504: @ 0x0809B504
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenConfig
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B504

	THUMB_FUNC_START sub_809B520
sub_809B520: @ 0x0809B520
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl GetLatestUnitIndexInPrepListByUId
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B520

.align 2, 0
