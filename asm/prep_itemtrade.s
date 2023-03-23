
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_809B538
sub_809B538: @ 0x0809B538
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B538

	THUMB_FUNC_START sub_809B564
sub_809B564: @ 0x0809B564
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809B5C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809B5E8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809B582
	b _0809B744
_0809B582:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809B5B0
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B5B0
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809B5B0
	movs r0, #5
	cmp r2, #5
	beq _0809B5AE
	adds r0, r2, #1
_0809B5AE:
	adds r2, r0, #0
_0809B5B0:
	cmp r2, #0
	bgt _0809B5B6
	b _0809B744
_0809B5B6:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _0809B5CC
	adds r0, r1, #0
	subs r0, #8
	b _0809B5CE
	.align 2, 0
_0809B5C8: .4byte gKeyStatusPtr
_0809B5CC:
	subs r0, r2, #1
_0809B5CE:
	str r0, [r4, #0x34]
	ldr r0, _0809B5E4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B5DE
	b _0809B738
_0809B5DE:
	movs r0, #0x67
	b _0809B734
	.align 2, 0
_0809B5E4: .4byte gPlaySt
_0809B5E8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809B658
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809B5FC
	b _0809B744
_0809B5FC:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809B62A
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B62A
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809B62A
	movs r0, #5
	cmp r2, #5
	beq _0809B628
	adds r0, r2, #1
_0809B628:
	adds r2, r0, #0
_0809B62A:
	cmp r2, #0
	bgt _0809B630
	b _0809B744
_0809B630:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _0809B640
	adds r0, r1, #0
	adds r0, #8
	b _0809B642
_0809B640:
	adds r0, r2, #7
_0809B642:
	str r0, [r4, #0x34]
	ldr r0, _0809B654  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B738
	movs r0, #0x67
	b _0809B734
	.align 2, 0
_0809B654: .4byte gPlaySt
_0809B658:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B6C4
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809B694
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B694
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809B694
	movs r0, #5
	cmp r3, #5
	beq _0809B692
	adds r0, r3, #1
_0809B692:
	adds r3, r0, #0
_0809B694:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _0809B6A4
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b _0809B726
_0809B6A4:
	ldr r0, _0809B6C0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b _0809B726
	.align 2, 0
_0809B6C0: .4byte gKeyStatusPtr
_0809B6C4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809B700
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B700
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809B700
	movs r0, #5
	cmp r3, #5
	beq _0809B6FE
	adds r0, r3, #1
_0809B6FE:
	adds r3, r0, #0
_0809B700:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _0809B712
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b _0809B726
_0809B712:
	ldr r0, _0809B73C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
_0809B726:
	ldr r0, _0809B740  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B738
	movs r0, #0x66
_0809B734:
	bl m4aSongNumStart
_0809B738:
	movs r0, #1
	b _0809B746
	.align 2, 0
_0809B73C: .4byte gKeyStatusPtr
_0809B740: .4byte gPlaySt
_0809B744:
	movs r0, #0
_0809B746:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809B564

	THUMB_FUNC_START sub_809B74C
sub_809B74C: @ 0x0809B74C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov r9, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _0809B820
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_0809B786:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0809B7A2
	mov r0, sl
	adds r1, r6, #0
	bl CanUnitUseItemPrepScreen
	b _0809B7AA
_0809B7A2:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_0809B7AA:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r9
	bl Text_Clear
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _0809B7C8
	movs r2, #1
_0809B7C8:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r9
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl DrawTextInline
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _0809B7E4
	movs r7, #2
_0809B7E4:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl DrawDecNumber
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	movs r0, #8
	add r9, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _0809B786
_0809B820:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B74C

	THUMB_FUNC_START sub_809B830
sub_809B830: @ 0x0809B830
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0809B866
_0809B844:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _0809B844
_0809B866:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B830

	THUMB_FUNC_START sub_809B86C
sub_809B86C: @ 0x0809B86C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _0809B964  @ gUnknown_08205C44
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809B968  @ gUnknown_08A181E8
	ldrh r0, [r0]
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetupFaceGfxData
	ldr r3, _0809B96C  @ gLCDControlBuffer
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
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
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
	ldr r0, _0809B970  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	ldr r0, _0809B974  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_0809B932:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Allocate
	adds r0, r6, #0
	movs r1, #7
	bl Text_Allocate
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809B932
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x40]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0809B978
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x34]
	b _0809B992
	.align 2, 0
_0809B964: .4byte gUnknown_08205C44
_0809B968: .4byte gUnknown_08A181E8
_0809B96C: .4byte gLCDControlBuffer
_0809B970: .4byte 0x06014000
_0809B974: .4byte gUnknown_02013510
_0809B978:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809B98C
	movs r0, #8
	mov r2, r8
	str r0, [r2, #0x34]
	b _0809B992
_0809B98C:
	movs r0, #0
	mov r3, r8
	str r0, [r3, #0x34]
_0809B992:
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	negs r4, r4
	ldr r0, _0809BB24  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartFace2
	mov r1, r8
	ldr r0, [r1, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _0809BB28  @ 0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartFace2
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r2, r8
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _0809BB2C  @ gBG0TilemapBuffer
	mov r9, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, r9
	movs r2, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, r9
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl DrawTextInline
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, r9
	ldr r4, _0809BB30  @ gUnknown_02013510
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, r9
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	mov r0, r8
	bl sub_80AC9C0
	mov r0, r8
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #0xc8
	movs r1, #0x93
	movs r2, #2
	mov r3, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r4, #1
	negs r4, r4
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BB24: .4byte 0x00000203
_0809BB28: .4byte 0x00000202
_0809BB2C: .4byte gBG0TilemapBuffer
_0809BB30: .4byte gUnknown_02013510

	THUMB_FUNC_END sub_809B86C

	THUMB_FUNC_START sub_809BB34
sub_809BB34: @ 0x0809BB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _0809BB60
	ldr r0, _0809BB5C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BB54
	b _0809BDB8
_0809BB54:
	bl CloseHelpBox
	movs r0, #0xff
	b _0809BE18
	.align 2, 0
_0809BB5C: .4byte gKeyStatusPtr
_0809BB60:
	ldr r0, _0809BB9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BBA0
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _0809BB90
	b _0809BE1A
_0809BB90:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _0809BE10
	.align 2, 0
_0809BB9C: .4byte gKeyStatusPtr
_0809BBA0:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _0809BBA8
	b _0809BD00
_0809BBA8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BBB2
	b _0809BCB8
_0809BBB2:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl sub_8097EA0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809BBF4
	movs r1, #1
	negs r1, r1
	ldr r2, _0809BBF0  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r6, #0
	bl sub_8097DA8
	b _0809BE1A
	.align 2, 0
_0809BBF0: .4byte 0x0000088B
_0809BBF4:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl sub_809B538
	ldr r4, _0809BC58  @ gUnknown_02022EEC
	ldr r5, _0809BC5C  @ gUnknown_02013510
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809B74C
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _0809BC60
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _0809BC74
	.align 2, 0
_0809BC58: .4byte gUnknown_02022EEC
_0809BC5C: .4byte gUnknown_02013510
_0809BC60:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _0809BC76
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_0809BC74:
	str r0, [r6, #0x38]
_0809BC76:
	ldr r0, _0809BCB4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BC88
	movs r0, #0x6a
	bl m4aSongNumStart
_0809BC88:
	movs r0, #0
	bl sub_80ACA84
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	b _0809BE1A
	.align 2, 0
_0809BCB4: .4byte gPlaySt
_0809BCB8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809BCC2
	b _0809BDB8
_0809BCC2:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldr r0, _0809BCFC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BCF4
	movs r0, #0x6b
	bl m4aSongNumStart
_0809BCF4:
	movs r0, #0
	bl sub_80ACA84
	b _0809BE1A
	.align 2, 0
_0809BCFC: .4byte gPlaySt
_0809BD00:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BD90
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl sub_80AC9D4
	cmp r4, #4
	bgt _0809BD50
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _0809BD58
_0809BD50:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_0809BD58:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldr r0, _0809BD8C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BE1A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809BE1A
	.align 2, 0
_0809BD8C: .4byte gPlaySt
_0809BD90:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809BDB8
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _0809BDB4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BE1A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809BE1A
	.align 2, 0
_0809BDB4: .4byte gPlaySt
_0809BDB8:
	adds r0, r6, #0
	bl sub_809B564
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BE1A
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _0809BE1A
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809BE1A
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_0809BE10:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_0809BE18:
	str r0, [r6, #0x3c]
_0809BE1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809BB34

	THUMB_FUNC_START sub_809BE24
sub_809BE24: @ 0x0809BE24
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809BE24

	THUMB_FUNC_START StartPrepItemTradeScreenProc
StartPrepItemTradeScreenProc: @ 0x0809BE3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809BE5C  @ ProcScr_PrepItemTradeScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	negs r1, r1
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE5C: .4byte ProcScr_PrepItemTradeScreen

	THUMB_FUNC_END StartPrepItemTradeScreenProc

	THUMB_FUNC_START sub_809BE60
sub_809BE60: @ 0x0809BE60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0809BE7C  @ ProcScr_PrepItemTradeScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE7C: .4byte ProcScr_PrepItemTradeScreen

	THUMB_FUNC_END sub_809BE60

.align 2, 0
