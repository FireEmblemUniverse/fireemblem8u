
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_809FDA0
sub_809FDA0: @ 0x0809FDA0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809FDCC  @ 0x0000DF80
	movs r5, #0x30
	movs r4, #3
_0809FDAA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809FDD0  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809FDAA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDCC: .4byte 0x0000DF80
_0809FDD0: .4byte gObject_32x16

	THUMB_FUNC_END sub_809FDA0

	THUMB_FUNC_START sub_809FDD4
sub_809FDD4: @ 0x0809FDD4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809FE10  @ sub_809FDA0
	bl StartParallelWorker
	ldr r0, _0809FE14  @ gUnknown_08A1951C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809FE18  @ gUnknown_08A19524
	ldr r1, [r1]
	bl GetStringFromIndexInBuffer
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FE10: .4byte sub_809FDA0
_0809FE14: .4byte gUnknown_08A1951C
_0809FE18: .4byte gUnknown_08A19524

	THUMB_FUNC_END sub_809FDD4

	THUMB_FUNC_START sub_809FE1C
sub_809FE1C: @ 0x0809FE1C
	push {lr}
	ldr r0, _0809FE4C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _0809FE2E
	movs r2, #0
_0809FE2E:
	cmp r2, #0xc
	bne _0809FE38
	ldr r1, _0809FE50  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_0809FE38:
	cmp r2, #0x34
	beq _0809FE40
	cmp r2, #0
	bne _0809FE48
_0809FE40:
	ldr r1, _0809FE50  @ 0x04000050
	ldr r2, _0809FE54  @ 0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_0809FE48:
	pop {r0}
	bx r0
	.align 2, 0
_0809FE4C: .4byte 0x04000006
_0809FE50: .4byte 0x04000050
_0809FE54: .4byte 0x00000242

	THUMB_FUNC_END sub_809FE1C

	THUMB_FUNC_START sub_809FE58
sub_809FE58: @ 0x0809FE58
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END sub_809FE58

	THUMB_FUNC_START sub_809FE68
sub_809FE68: @ 0x0809FE68
	push {r4, r5, lr}
	ldr r4, _0809FEE4  @ gUnknown_02013648
	ldr r1, _0809FEE8  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _0809FEEC  @ Pal_UIFont
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl Text_Init3
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r5, #0
	movs r1, #0
	bl Text_80046B4
	ldr r0, _0809FEF0  @ 0x0000059C
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0809FEF4  @ 0x0000059B
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0809FEF8  @ 0x0000059D
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FEE4: .4byte gUnknown_02013648
_0809FEE8: .4byte 0x06011000
_0809FEEC: .4byte Pal_UIFont
_0809FEF0: .4byte 0x0000059C
_0809FEF4: .4byte 0x0000059B
_0809FEF8: .4byte 0x0000059D

	THUMB_FUNC_END sub_809FE68

	THUMB_FUNC_START sub_809FEFC
sub_809FEFC: @ 0x0809FEFC
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809FF5C  @ 0x00008840
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x5b
	movs r2, #8
	movs r3, #4
	bl sub_809A31C
	ldr r4, _0809FF60  @ gObject_32x16
	ldr r0, _0809FF64  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF68  @ 0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF6C  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF70  @ 0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF5C: .4byte 0x00008840
_0809FF60: .4byte gObject_32x16
_0809FF64: .4byte 0x0000B088
_0809FF68: .4byte 0x0000B08C
_0809FF6C: .4byte 0x0000B080
_0809FF70: .4byte 0x0000B084

	THUMB_FUNC_END sub_809FEFC

	THUMB_FUNC_START sub_809FF74
sub_809FF74: @ 0x0809FF74
	push {lr}
	sub sp, #4
	ldr r3, _0809FFA0  @ gObject_32x16
	ldr r0, _0809FFA4  @ 0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _0809FFA8  @ gObject_8x16
	ldr r0, _0809FFAC  @ 0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x48
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809FFA0: .4byte gObject_32x16
_0809FFA4: .4byte 0x0000B090
_0809FFA8: .4byte gObject_8x16
_0809FFAC: .4byte 0x0000B094

	THUMB_FUNC_END sub_809FF74

	THUMB_FUNC_START sub_809FFB0
sub_809FFB0: @ 0x0809FFB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080A0008  @ gUnknown_02022F10
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r4, #0
	beq _080A0022
	adds r0, r4, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809FFE2
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A000C
_0809FFE2:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	b _080A0018
	.align 2, 0
_080A0008: .4byte gUnknown_02022F10
_080A000C:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl sub_8004B88
_080A0018:
	ldr r0, _080A0030  @ gUnknown_02022F1E
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
_080A0022:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0030: .4byte gUnknown_02022F1E

	THUMB_FUNC_END sub_809FFB0

	THUMB_FUNC_START sub_80A0034
sub_80A0034: @ 0x080A0034
	push {r4, r5, lr}
	ldr r4, _080A0074  @ gUnknown_02022E90
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r5, r4, r0
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004B88
	ldr r0, _080A0078  @ 0x0000028E
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0074: .4byte gUnknown_02022E90
_080A0078: .4byte 0x0000028E

	THUMB_FUNC_END sub_80A0034

	THUMB_FUNC_START sub_80A007C
sub_80A007C: @ 0x080A007C
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetFont
	ldr r4, _080A00D4  @ gUnknown_02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	ldr r3, _080A00D8  @ gUnknown_02013660
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl DrawTextInline
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A00D4: .4byte gUnknown_02022D10
_080A00D8: .4byte gUnknown_02013660

	THUMB_FUNC_END sub_80A007C

	THUMB_FUNC_START sub_80A00DC
sub_80A00DC: @ 0x080A00DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080A0300  @ gLCDControlBuffer
	ldrb r1, [r5]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	bl SetupBackgrounds
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
	ldrb r2, [r5, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
	bl ResetFaces
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
	ldr r0, _080A0304  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #8
	bl PutImg_PrepPopupWindow
	ldr r0, _080A0308  @ gUnknown_08A1BBD0
	ldr r4, _080A030C  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A0310  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _080A0314  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x48
	bl StartFace2
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldrb r0, [r5, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	mov r0, r9
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r9
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #2
	adds r3, r7, #0
	bl StartHelpPromptSprite
	movs r0, #0xa5
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r7, #0
	bl sub_80984A8
	movs r0, #0xa5
	movs r1, #0x80
	bl sub_80984CC
	ldr r4, _080A0318  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl Text_Init
	bl sub_809FE68
	adds r4, #0x10
	movs r5, #4
_080A029E:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A029E
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _080A031C  @ sub_809FE1C
	bl SetPrimaryHBlankHandler
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080A0320  @ gUnknown_02022EEC
	ldr r1, _080A0324  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809B74C
	bl sub_80A007C
	ldr r0, _080A0328  @ sub_809FF74
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r1, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	bl sub_80A0034
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0300: .4byte gLCDControlBuffer
_080A0304: .4byte 0x06014000
_080A0308: .4byte gUnknown_08A1BBD0
_080A030C: .4byte gGenericBuffer
_080A0310: .4byte gBG1TilemapBuffer
_080A0314: .4byte 0x00000503
_080A0318: .4byte gUnknown_02013660
_080A031C: .4byte sub_809FE1C
_080A0320: .4byte gUnknown_02022EEC
_080A0324: .4byte gUnknown_02013670
_080A0328: .4byte sub_809FF74

	THUMB_FUNC_END sub_80A00DC

	THUMB_FUNC_START sub_80A032C
sub_80A032C: @ 0x080A032C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080A035C  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A0372
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A0360
	subs r0, #1
	strb r0, [r2]
	b _080A03A2
	.align 2, 0
_080A035C: .4byte gKeyStatusPtr
_080A0360:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	subs r0, r3, #1
	strb r0, [r2]
	b _080A03A2
_080A0372:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080A0394
	adds r0, r1, #1
	strb r0, [r2]
	b _080A03A2
_080A0394:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	strb r5, [r2]
_080A03A2:
	ldr r0, _080A03B8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A03B4
	movs r0, #0x66
	bl m4aSongNumStart
_080A03B4:
	movs r0, #1
	b _080A03BE
	.align 2, 0
_080A03B8: .4byte gRAMChapterData
_080A03BC:
	movs r0, #0
_080A03BE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A032C

	THUMB_FUNC_START sub_80A03C4
sub_80A03C4: @ 0x080A03C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A0418  @ gUnknown_02022EEC
	ldr r1, _080A041C  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809B74C
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	movs r0, #0
	bl sub_80ACA84
	ldr r0, _080A0420  @ sub_809FEFC
	bl GetParallelWorker
	bl Proc_End
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #0
	adds r1, r4, #0
	bl sub_809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0418: .4byte gUnknown_02022EEC
_080A041C: .4byte gUnknown_02013670
_080A0420: .4byte sub_809FEFC

	THUMB_FUNC_END sub_80A03C4

	THUMB_FUNC_START sub_80A0424
sub_80A0424: @ 0x080A0424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A044C
	ldr r0, _080A0448  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0518
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x34]
	b _080A056A
	.align 2, 0
_080A0448: .4byte gKeyStatusPtr
_080A044C:
	ldr r0, _080A0484  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0488
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _080A0472
	b _080A056A
_080A0472:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _080A056A
	.align 2, 0
_080A0484: .4byte gKeyStatusPtr
_080A0488:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A04F0
	ldr r1, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A04BA
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A04CE
_080A04BA:
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0x85
	lsls r2, r2, #4
	movs r0, #0x10
	adds r3, r4, #0
	bl sub_8097DA8
	b _080A056A
_080A04CE:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A04EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A056A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A056A
	.align 2, 0
_080A04EC: .4byte gRAMChapterData
_080A04F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A0518
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A0514  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A056A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A056A
	.align 2, 0
_080A0514: .4byte gRAMChapterData
_080A0518:
	adds r0, r4, #0
	bl sub_80A032C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A056A
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A056A
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A056A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_080A056A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0424

	THUMB_FUNC_START sub_80A0570
sub_80A0570: @ 0x080A0570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _080A05B8  @ sub_809FEFC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl sub_80AC9D4
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl ShowPrepScreenHandCursor
	movs r0, #1
	adds r1, r4, #0
	bl sub_809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A05B8: .4byte sub_809FEFC

	THUMB_FUNC_END sub_80A0570

	THUMB_FUNC_START sub_80A05BC
sub_80A05BC: @ 0x080A05BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8024E20
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _080A0628  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0602
	movs r0, #0xb9
	bl m4aSongNumStart
_080A0602:
	bl sub_80A0034
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _080A0634
	ldr r0, _080A062C  @ gUnknown_02022EEC
	ldr r1, _080A0630  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809B74C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080A0646
	.align 2, 0
_080A0628: .4byte gRAMChapterData
_080A062C: .4byte gUnknown_02022EEC
_080A0630: .4byte gUnknown_02013670
_080A0634:
	ldrb r1, [r5]
	cmp r0, r1
	bne _080A063E
	subs r0, #1
	strb r0, [r5]
_080A063E:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080A0646:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A05BC

	THUMB_FUNC_START sub_80A064C
sub_80A064C: @ 0x080A064C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _080A0670  @ gKeyStatusPtr
	ldr r3, [r6]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A0674
	cmp r5, #0
	bne _080A0680
	adds r0, r1, #0
	bl sub_80A05BC
	b _080A06E6
	.align 2, 0
_080A0670: .4byte gKeyStatusPtr
_080A0674:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080A06A0
_080A0680:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A069C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06E6
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A06E6
	.align 2, 0
_080A069C: .4byte gRAMChapterData
_080A06A0:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A06AC
	strb r2, [r4]
_080A06AC:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A06BC
	movs r0, #1
	strb r0, [r4]
_080A06BC:
	ldrb r0, [r4]
	cmp r5, r0
	beq _080A06E6
	ldr r0, _080A06EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06D4
	movs r0, #0x67
	bl m4aSongNumStart
_080A06D4:
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl ShowPrepScreenHandCursor
_080A06E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A06EC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A064C

	THUMB_FUNC_START sub_80A06F0
sub_80A06F0: @ 0x080A06F0
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_8098500
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A06F0

	THUMB_FUNC_START sub_80A070C
sub_80A070C: @ 0x080A070C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0720  @ gUnknown_08A19528
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0720: .4byte gUnknown_08A19528

	THUMB_FUNC_END sub_80A070C

	THUMB_FUNC_START sub_80A0724
sub_80A0724: @ 0x080A0724
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _080A0754  @ 0x06011000
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_808F128
	movs r0, #0x7c
	bl sub_808E9D8
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A0754: .4byte 0x06011000

	THUMB_FUNC_END sub_80A0724

	THUMB_FUNC_START sub_80A0758
sub_80A0758: @ 0x080A0758
	bx lr

	THUMB_FUNC_END sub_80A0758

	THUMB_FUNC_START __malloc_unlock_2
__malloc_unlock_2: @ 0x080A075C
	bx lr

	THUMB_FUNC_END __malloc_unlock_2

	THUMB_FUNC_START sub_80A0760
sub_80A0760: @ 0x080A0760
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl sub_80A0A34
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_80A0A70
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0760

	THUMB_FUNC_START sub_80A078C
sub_80A078C: @ 0x080A078C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	ldr r6, _080A084C  @ gUnknown_02013498
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	ldr r0, _080A0850  @ gUnknown_02022F28
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	movs r4, #0
_080A07B4:
	adds r0, r6, #0
	bl Text_Clear
	ldr r1, _080A0854  @ gUnknown_08A196D0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _080A0858  @ gBG0TilemapBuffer
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, r9
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A07FE
	movs r2, #1
_080A07FE:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl DrawTextInline
	adds r4, #1
	cmp r4, #3
	ble _080A07B4
	ldr r0, _080A084C  @ gUnknown_02013498
	adds r6, r0, #0
	adds r6, #0xf0
	adds r0, r6, #0
	bl Text_Clear
	ldr r0, _080A085C  @ gUnknown_08A196BC
	ldr r0, [r0, #0xc]
	bl GetStringFromIndex
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A084C: .4byte gUnknown_02013498
_080A0850: .4byte gUnknown_02022F28
_080A0854: .4byte gUnknown_08A196D0
_080A0858: .4byte gBG0TilemapBuffer
_080A085C: .4byte gUnknown_08A196BC

	THUMB_FUNC_END sub_80A078C

	THUMB_FUNC_START sub_80A0860
sub_80A0860: @ 0x080A0860
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _080A08F0  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A0884
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080A0884
	subs r0, r4, #1
	strb r0, [r3]
_080A0884:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _080A08A2
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A08A2
	adds r0, r1, #1
	strb r0, [r3]
_080A08A2:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A08BA
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _080A08BA
	adds r0, r1, #2
	strb r0, [r3]
_080A08BA:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A08D2
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _080A08D2
	subs r0, r1, #2
	strb r0, [r3]
_080A08D2:
	ldrb r3, [r3]
	cmp r4, r3
	beq _080A08F8
	ldr r0, _080A08F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A08EA
	movs r0, #0x65
	bl m4aSongNumStart
_080A08EA:
	movs r0, #1
	b _080A08FA
	.align 2, 0
_080A08F0: .4byte gKeyStatusPtr
_080A08F4: .4byte gRAMChapterData
_080A08F8:
	movs r0, #0
_080A08FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0860

	THUMB_FUNC_START sub_80A0900
sub_80A0900: @ 0x080A0900
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F270
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0900

	THUMB_FUNC_START sub_80A0924
sub_80A0924: @ 0x080A0924
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	blt _080A093E
	cmp r1, #1
	ble _080A093E
	cmp r1, #2
	bne _080A093E
	movs r1, #4
	bl Proc_Goto
_080A093E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0924

	THUMB_FUNC_START StartPrepSupportScreen
StartPrepSupportScreen: @ 0x080A0944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0958  @ gUnknown_08A1962C
	bl Proc_StartBlocking
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0958: .4byte gUnknown_08A1962C

	THUMB_FUNC_END StartPrepSupportScreen

	THUMB_FUNC_START sub_80A095C
sub_80A095C: @ 0x080A095C
	push {lr}
	cmp r0, #1
	beq _080A0976
	cmp r0, #1
	bgt _080A096C
	cmp r0, #0
	beq _080A0972
	b _080A0986
_080A096C:
	cmp r0, #2
	beq _080A097C
	b _080A0986
_080A0972:
	movs r0, #1
	b _080A0988
_080A0976:
	bl sub_80A0A34
	b _080A0980
_080A097C:
	bl sub_80A0A70
_080A0980:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A0988
_080A0986:
	movs r0, #0
_080A0988:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A095C

	THUMB_FUNC_START sub_80A098C
sub_80A098C: @ 0x080A098C
	push {lr}
	ldr r0, _080A09A4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09A4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A098C

	THUMB_FUNC_START sub_80A09A8
sub_80A09A8: @ 0x080A09A8
	push {lr}
	ldr r0, _080A09C0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09C0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09A8

	THUMB_FUNC_START sub_80A09C4
sub_80A09C4: @ 0x080A09C4
	push {lr}
	ldr r0, _080A09DC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09DC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09C4

	THUMB_FUNC_START sub_80A09E0
sub_80A09E0: @ 0x080A09E0
	push {lr}
	ldr r0, _080A09F8  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09F8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09E0

	THUMB_FUNC_START sub_80A09FC
sub_80A09FC: @ 0x080A09FC
	push {lr}
	ldr r0, _080A0A14  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A0A14: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09FC

	THUMB_FUNC_START sub_80A0A18
sub_80A0A18: @ 0x080A0A18
	push {lr}
	bl sub_80A098C
	cmp r0, #0
	beq _080A0A2E
	bl sub_80A09A8
	cmp r0, #0
	bne _080A0A2E
	movs r0, #1
	b _080A0A30
_080A0A2E:
	movs r0, #0
_080A0A30:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A18

	THUMB_FUNC_START sub_80A0A34
sub_80A0A34: @ 0x080A0A34
	push {lr}
	ldr r0, _080A0A50  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A0A4A
	bl sub_80A098C
	cmp r0, #0
	bne _080A0A54
_080A0A4A:
	movs r0, #0
	b _080A0A56
	.align 2, 0
_080A0A50: .4byte gRAMChapterData
_080A0A54:
	movs r0, #1
_080A0A56:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A34

	THUMB_FUNC_START sub_80A0A5C
sub_80A0A5C: @ 0x080A0A5C
	push {lr}
	bl sub_80A09FC
	cmp r0, #1
	beq _080A0A6A
	movs r0, #0
	b _080A0A6C
_080A0A6A:
	movs r0, #1
_080A0A6C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A5C

	THUMB_FUNC_START sub_80A0A70
sub_80A0A70: @ 0x080A0A70
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A0A70

	THUMB_FUNC_START sub_80A0A74
sub_80A0A74: @ 0x080A0A74
	push {lr}
	ldr r0, _080A0A88  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x61
	bgt _080A0A8C
	movs r0, #0
	b _080A0A8E
	.align 2, 0
_080A0A88: .4byte gRAMChapterData
_080A0A8C:
	movs r0, #1
_080A0A8E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A74

	THUMB_FUNC_START sub_80A0A94
sub_80A0A94: @ 0x080A0A94
	ldr r0, _080A0A9C  @ gUnknown_020136F0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0A9C: .4byte gUnknown_020136F0

	THUMB_FUNC_END sub_80A0A94

	THUMB_FUNC_START sub_80A0AA0
sub_80A0AA0: @ 0x080A0AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A0AB4  @ gUnknown_020136F0
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A0AB8
	adds r0, r1, #1
	b _080A0ABA
	.align 2, 0
_080A0AB4: .4byte gUnknown_020136F0
_080A0AB8:
	movs r0, #0
_080A0ABA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0AA0

	THUMB_FUNC_START sub_80A0AC0
sub_80A0AC0: @ 0x080A0AC0
	push {lr}
	cmp r0, #0
	bne _080A0ACA
	ldr r0, _080A0AD0  @ gUnknown_020136F0
	ldr r0, [r0]
_080A0ACA:
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080A0AD0: .4byte gUnknown_020136F0

	THUMB_FUNC_END sub_80A0AC0

	THUMB_FUNC_START sub_80A0AD4
sub_80A0AD4: @ 0x080A0AD4
	ldr r2, _080A0AE8  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A0AE8: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0AD4

	THUMB_FUNC_START sub_80A0AEC
sub_80A0AEC: @ 0x080A0AEC
	ldr r2, _080A0B00  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A0B00: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0AEC

	THUMB_FUNC_START sub_80A0B04
sub_80A0B04: @ 0x080A0B04
	ldr r2, _080A0B1C  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_080A0B1C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B04

	THUMB_FUNC_START sub_80A0B20
sub_80A0B20: @ 0x080A0B20
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _080A0B40  @ gCharacterData
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0B40: .4byte gCharacterData

	THUMB_FUNC_END sub_80A0B20

	THUMB_FUNC_START sub_80A0B44
sub_80A0B44: @ 0x080A0B44
	ldr r1, _080A0B54  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080A0B54: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B44

	THUMB_FUNC_START sub_80A0B58
sub_80A0B58: @ 0x080A0B58
	ldr r1, _080A0B68  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_080A0B68: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B58

	THUMB_FUNC_START sub_80A0B6C
sub_80A0B6C: @ 0x080A0B6C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080A0B72:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080A0BA0
	ldr r3, [r2]
	cmp r3, #0
	beq _080A0BA0
	ldr r0, [r2, #0xc]
	ldr r1, _080A0B9C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0BA0
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _080A0BA0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _080A0BB2
	.align 2, 0
_080A0B9C: .4byte 0x00010004
_080A0BA0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0B72
	ldr r2, _080A0BB8  @ gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_080A0BB2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0BB8: .4byte gCharacterData

	THUMB_FUNC_END sub_80A0B6C

	THUMB_FUNC_START sub_80A0BBC
sub_80A0BBC: @ 0x080A0BBC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80847F8
	adds r1, r0, #0
	ldrh r0, [r1]
	ldr r2, _080A0BE0  @ 0x0000FFFF
	cmp r0, r2
	beq _080A0BEC
_080A0BCE:
	ldrh r0, [r1]
	cmp r0, r4
	beq _080A0BDA
	ldrh r0, [r1, #2]
	cmp r0, r4
	bne _080A0BE4
_080A0BDA:
	movs r0, #1
	b _080A0BEE
	.align 2, 0
_080A0BE0: .4byte 0x0000FFFF
_080A0BE4:
	adds r1, #0x10
	ldrh r0, [r1]
	cmp r0, r2
	bne _080A0BCE
_080A0BEC:
	movs r0, #0
_080A0BEE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0BBC

	THUMB_FUNC_START sub_80A0BF4
sub_80A0BF4: @ 0x080A0BF4
	push {r4, r5, r6, r7, lr}
	bl sub_80847F8
	adds r6, r0, #0
	ldrh r0, [r6]
	ldr r1, _080A0C3C  @ 0x0000FFFF
	cmp r0, r1
	beq _080A0C34
	adds r7, r1, #0
_080A0C06:
	ldrh r0, [r6]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r0, [r6, #2]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r4, [r6]
	ldrh r5, [r6, #2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A3468
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A3724
	adds r6, #0x10
	ldrh r0, [r6]
	cmp r0, r7
	bne _080A0C06
_080A0C34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0C3C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80A0BF4

	THUMB_FUNC_START sub_80A0C40
sub_80A0C40: @ 0x080A0C40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _080A0DC0  @ gUnknown_08A196FC
	ldr r1, [r7]
	ldr r2, _080A0DC4  @ 0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _080A0DC8  @ gUnknown_020136F0
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A0C72
	b _080A0DD8
_080A0C72:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _080A0DCC  @ 0x01000010
	bl CpuSet
	movs r4, #1
_080A0C80:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080A0CB0
	ldr r2, [r0]
	cmp r2, #0
	beq _080A0CB0
	ldr r0, [r0, #0xc]
	ldr r1, _080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0CB0
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_080A0CB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0C80
	movs r4, #1
	ldr r0, _080A0DC8  @ gUnknown_020136F0
	mov sl, r0
_080A0CBC:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _080A0DB6
	ldr r2, [r5]
	cmp r2, #0
	beq _080A0DB6
	ldr r0, [r5, #0xc]
	ldr r1, _080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0DB6
	ldrb r0, [r2, #4]
	bl sub_80A1B6C
	cmp r0, #0
	beq _080A0DB6
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _080A0DAE
	ldr r7, _080A0DC8  @ gUnknown_020136F0
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	mov r8, r0
_080A0D30:
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_80A0B20
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A0B6C
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, r9
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _080A0D30
_080A0DAE:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_080A0DB6:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _080A0DBE
	b _080A0CBC
_080A0DBE:
	b _080A0EAE
	.align 2, 0
_080A0DC0: .4byte gUnknown_08A196FC
_080A0DC4: .4byte 0x01000600
_080A0DC8: .4byte gUnknown_020136F0
_080A0DCC: .4byte 0x01000010
_080A0DD0: .4byte 0x00010004
_080A0DD4: .4byte gCharacterData+0x2C
_080A0DD8:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl LoadGeneralGameMetadata
	ldr r0, _080A0E50  @ 0x0000026A
	bl GetStringFromIndex
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _080A0E54  @ gCharacterData
	mov r8, r1
_080A0DF4:
	adds r0, r6, #0
	mov r1, sl
	bl GGM_IsCharacterKnown
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _080A0EA8
	adds r0, r6, #0
	bl sub_80A1B6C
	cmp r0, #0
	beq _080A0EA8
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_80A35EC
	movs r0, #0
	mov r9, r0
	b _080A0E98
	.align 2, 0
_080A0E50: .4byte 0x0000026A
_080A0E54: .4byte gCharacterData
_080A0E58:
	ldr r0, [r5]
	mov r1, r9
	bl sub_80A0B20
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, r9
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl GGM_IsCharacterKnown
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, r9
	strb r0, [r1]
	movs r1, #1
	add r9, r1
_080A0E98:
	adds r0, r6, #0
	bl sub_80A1B6C
	cmp r9, r0
	blt _080A0E58
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_080A0EA8:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _080A0DF4
_080A0EAE:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0C40

	THUMB_FUNC_START sub_80A0EC0
sub_80A0EC0: @ 0x080A0EC0
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A0EF4
	movs r4, #1
_080A0ED0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A0EEC
	ldr r0, [r1]
	cmp r0, #0
	beq _080A0EEC
	adds r0, r1, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_080A0EEC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0ED0
	b _080A0F1C
_080A0EF4:
	movs r4, #0
	ldr r0, _080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	bge _080A0F1C
	movs r5, #0
_080A0F00:
	ldr r0, _080A0F2C  @ gUnknown_08A196FC
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r5, #0x18
	adds r4, #1
	ldr r0, _080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	blt _080A0F00
_080A0F1C:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0F28: .4byte gUnknown_020136F0
_080A0F2C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0EC0

	THUMB_FUNC_START sub_80A0F30
sub_80A0F30: @ 0x080A0F30
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _080A0F3C  @ gCharacterData+0x2C
	b _080A0F4C
	.align 2, 0
_080A0F3C: .4byte gCharacterData+0x2C
_080A0F40:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A0AD4
	adds r6, r6, r0
	adds r4, #1
_080A0F4C:
	adds r0, r5, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _080A0F40
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0F30

	THUMB_FUNC_START sub_80A0F6C
sub_80A0F6C: @ 0x080A0F6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0F88
	adds r0, r6, #0
	bl sub_80A0F30
	cmp r0, #5
	beq _080A0FCA
	b _080A0FD0
_080A0F88:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl sub_80A0F30
	mov r9, r0
	adds r0, r6, #0
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _080A0FC6
_080A0FA6:
	adds r0, r6, #0
	bl sub_80A0B44
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80A0B20
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80A3468
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _080A0FA6
_080A0FC6:
	cmp r8, r9
	bne _080A0FCE
_080A0FCA:
	movs r0, #2
	b _080A0FDA
_080A0FCE:
	mov r0, r9
_080A0FD0:
	cmp r0, #0
	beq _080A0FD8
	movs r0, #1
	b _080A0FDA
_080A0FD8:
	movs r0, #0
_080A0FDA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0F6C

	THUMB_FUNC_START sub_80A0FE8
sub_80A0FE8: @ 0x080A0FE8
	push {r4, r5, r6, r7, lr}
	ldr r6, _080A10A4  @ gUnknown_02013590
	bl sub_80A3544
	adds r7, r0, #0
	adds r4, r6, #0
	subs r4, #8
	adds r0, r4, #0
	movs r1, #0x10
	bl Text_Init
	adds r0, r6, #0
	movs r1, #9
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _080A10A8  @ 0x000005AD
	bl GetStringFromIndex
	adds r5, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	ldr r5, _080A10AC  @ gUnknown_02023136
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_Draw
	adds r0, r6, #0
	bl Text_Clear
	movs r4, #0
	cmp r7, #0x64
	bne _080A1044
	movs r4, #4
_080A1044:
	ldr r0, _080A10B0  @ 0x000005AA
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	adds r0, r6, #0
	movs r1, #0x34
	bl Text_SetXCursor
	movs r1, #2
	cmp r7, #0x64
	bne _080A1066
	movs r1, #4
_080A1066:
	adds r0, r6, #0
	bl Text_SetColorId
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_AppendNumberOr2Dashes
	movs r4, #0
	cmp r7, #0x64
	bne _080A107C
	movs r4, #4
_080A107C:
	ldr r0, _080A10B4  @ 0x000005AE
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x3c
	adds r2, r4, #0
	bl Text_InsertString
	ldr r0, _080A10B8  @ 0xFFFFFC18
	adds r1, r5, r0
	adds r0, r6, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A10A4: .4byte gUnknown_02013590
_080A10A8: .4byte 0x000005AD
_080A10AC: .4byte gUnknown_02023136
_080A10B0: .4byte 0x000005AA
_080A10B4: .4byte 0x000005AE
_080A10B8: .4byte 0xFFFFFC18

	THUMB_FUNC_END sub_80A0FE8

	THUMB_FUNC_START sub_80A10BC
sub_80A10BC: @ 0x080A10BC
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	THUMB_FUNC_END sub_80A10BC

	THUMB_FUNC_START sub_80A10D0
sub_80A10D0: @ 0x080A10D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A10F0  @ gUnknown_08A1DD0C
	ldr r1, _080A10F4  @ 0x06017800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A10F8  @ gUnknown_08A1E0D8
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A10F0: .4byte gUnknown_08A1DD0C
_080A10F4: .4byte 0x06017800
_080A10F8: .4byte gUnknown_08A1E0D8

	THUMB_FUNC_END sub_80A10D0

	THUMB_FUNC_START sub_80A10FC
sub_80A10FC: @ 0x080A10FC
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _080A1138  @ gUnknown_08A19700
	ldr r0, [r0, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xfc
	lsls r4, r4, #4
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldr r3, _080A113C  @ gUnknown_08A19726
	movs r0, #0x87
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1138: .4byte gUnknown_08A19700
_080A113C: .4byte gUnknown_08A19726

	THUMB_FUNC_END sub_80A10FC

	THUMB_FUNC_START sub_80A1140
sub_80A1140: @ 0x080A1140
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080A115C  @ gUnknown_08A1973C
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A115C: .4byte gUnknown_08A1973C

	THUMB_FUNC_END sub_80A1140

	THUMB_FUNC_START sub_80A1160
sub_80A1160: @ 0x080A1160
	push {lr}
	ldr r0, _080A1170  @ gUnknown_08A1973C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A1170: .4byte gUnknown_08A1973C

	THUMB_FUNC_END sub_80A1160

	THUMB_FUNC_START sub_80A1174
sub_80A1174: @ 0x080A1174
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl sub_80A0A94
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _080A11CE
_080A118A:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x24
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x24
	cmp r0, #0x52
	bhi _080A11C8
	adds r0, r6, #0
	bl sub_80A0B58
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
_080A11C8:
	adds r6, #1
	cmp r6, r7
	blt _080A118A
_080A11CE:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1174

	THUMB_FUNC_START sub_80A11E0
sub_80A11E0: @ 0x080A11E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _080A1268
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A1202
	adds r0, #0xf
_080A1202:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x24
	bgt _080A121C
	cmp r1, #0
	bne _080A1216
	str r1, [r4, #0x34]
	b _080A121C
_080A1216:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A121C:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A122E
	adds r0, #0xf
_080A122E:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x73
	ble _080A1268
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _080A125A
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	b _080A1264
_080A125A:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #4
_080A1264:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A1268:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A11E0

	THUMB_FUNC_START sub_80A1270
sub_80A1270: @ 0x080A1270
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r7, _080A14D0  @ gLCDControlBuffer
	ldrb r1, [r7]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl SetupBackgrounds
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
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	mov r9, r0
	mov r0, r9
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	orrs r0, r2
	strb r0, [r7, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #1
	negs r1, r1
	bl LoadUiFrameGraphicsTo
	bl LoadObjUIGfx
	movs r0, #0xe
	bl LoadIconPalettes
	adds r0, r6, #0
	bl sub_80A11E0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #2
	bl BG_SetPosition
	ldr r1, _080A14D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	movs r5, #0
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	bl SetupMapSpritesPalettes
	bl ResetUnitSprites
	adds r0, r6, #0
	bl sub_80A0EC0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A14D8  @ gUnknown_08A1DB80
	ldr r4, _080A14DC  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A14E0  @ gUnknown_020235AA
	movs r2, #0x90
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080A14E4  @ gUnknown_08A1A8E4
	ldr r1, _080A14E8  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A14EC  @ gUnknown_08A1B174
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrb r0, [r7, #1]
	movs r1, #0x20
	mov ip, r1
	mov r2, ip
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x26
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x86
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r8, r0
	ldrb r1, [r0]
	mov r2, r9
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	mov r7, r9
	orrs r0, r7
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, ip
	orrs r1, r2
	mov r7, r8
	strb r1, [r7]
	orrs r0, r2
	strb r0, [r5]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	ldr r5, _080A14F0  @ gUnknown_02013498
	movs r4, #0x14
_080A140A:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080A140A
	bl sub_80A0FE8
	bl sub_80A0A94
	cmp r0, #0
	beq _080A1476
	adds r0, r6, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A1456
	adds r1, #0xf
_080A1456:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl ShowPrepScreenHandCursor
	movs r0, #0xc0
	movs r1, #1
	movs r2, #9
	adds r3, r6, #0
	bl StartHelpPromptSprite
_080A1476:
	movs r0, #0x88
	movs r1, #9
	movs r2, #0xb
	adds r3, r6, #0
	bl sub_80A1140
	ldr r0, _080A14F4  @ sub_80A1174
	adds r1, r6, #0
	bl StartParallelWorker
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #4
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd8
	movs r2, #0x2d
	bl sub_8097748
	ldrh r4, [r6, #0x34]
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	bl sub_8097668
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A14C8
	adds r1, #0xf
_080A14C8:
	asrs r4, r1, #4
	adds r5, r6, #0
	adds r5, #0x43
	b _080A1502
	.align 2, 0
_080A14D0: .4byte gLCDControlBuffer
_080A14D4: .4byte 0x0000FFD8
_080A14D8: .4byte gUnknown_08A1DB80
_080A14DC: .4byte gGenericBuffer
_080A14E0: .4byte gUnknown_020235AA
_080A14E4: .4byte gUnknown_08A1A8E4
_080A14E8: .4byte 0x06013800
_080A14EC: .4byte gUnknown_08A1B174
_080A14F0: .4byte gUnknown_02013498
_080A14F4: .4byte sub_80A1174
_080A14F8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A199C
	adds r4, #1
_080A1502:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A150A
	adds r0, #0xf
_080A150A:
	asrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	blt _080A14F8
	adds r0, r6, #0
	bl NewGreenTextColorManager
	movs r0, #0
	strb r0, [r5]
	ldr r0, _080A154C  @ 0x06014800
	movs r1, #0xa
	bl LoadDialogueBoxGfx
	ldr r2, _080A1550  @ gLCDControlBuffer
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
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A154C: .4byte 0x06014800
_080A1550: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A1270

	THUMB_FUNC_START sub_80A1554
sub_80A1554: @ 0x080A1554
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F270
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_80A1160
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1554

	THUMB_FUNC_START sub_80A157C
sub_80A157C: @ 0x080A157C
	push {lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A157C

	THUMB_FUNC_START sub_80A15B0
sub_80A15B0: @ 0x080A15B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_80A0A94
	cmp r0, #0
	bne _080A15C6
	b _080A18D8
_080A15C6:
	adds r0, r6, #0
	adds r0, #0x40
	movs r7, #0
	ldrsb r7, [r0, r7]
	mov r8, r0
	cmp r7, #0
	beq _080A15D6
	b _080A1864
_080A15D6:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r4, _080A1620  @ gKeyStatusPtr
	ldr r2, [r4]
	ldrh r5, [r2, #6]
	adds r3, r6, #0
	adds r3, #0x41
	movs r0, #4
	strb r0, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A15FA
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_080A15FA:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r9, r0
	cmp r1, #0
	beq _080A1624
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A16DC
	bl CloseHelpBox
	mov r1, r9
	strb r7, [r1]
	b _080A1900
	.align 2, 0
_080A1620: .4byte gKeyStatusPtr
_080A1624:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A1684
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A1654
	adds r0, #0xf
_080A1654:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x24
	ldr r5, _080A1680  @ gCharacterData
	adds r0, r7, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, r9
	strb r0, [r1]
	b _080A1900
	.align 2, 0
_080A1680: .4byte gCharacterData
_080A1684:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A16B0
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A16AC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A16A2
	b _080A1900
_080A16A2:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A1900
	.align 2, 0
_080A16AC: .4byte gRAMChapterData
_080A16B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A16DC
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A16D8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A16CE
	b _080A1900
_080A16CE:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A1900
	.align 2, 0
_080A16D8: .4byte gRAMChapterData
_080A16DC:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _080A16F6
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _080A16F6
	subs r0, r4, #1
	str r0, [r6, #0x38]
_080A16F6:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _080A1722
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _080A1722
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl sub_80A0A94
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _080A1722
	bl sub_80A0A94
	subs r0, #1
	str r0, [r6, #0x38]
_080A1722:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _080A1734
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _080A1734
	subs r0, #3
	str r0, [r6, #0x38]
_080A1734:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _080A174E
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl sub_80A0A94
	cmp r4, r0
	bge _080A174E
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_080A174E:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _080A1756
	b _080A185A
_080A1756:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A1766
	adds r0, #0xf
_080A1766:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080A17A4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1784
	movs r0, #0x65
	bl m4aSongNumStart
_080A1784:
	cmp r4, #0xf
	bgt _080A17A8
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _080A17A8
	cmp r1, #0
	bge _080A1794
	adds r1, #0xf
_080A1794:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_80A199C
	movs r0, #0xff
	b _080A17D4
	.align 2, 0
_080A17A4: .4byte gRAMChapterData
_080A17A8:
	cmp r4, #0x4f
	ble _080A17EA
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _080A17EA
	cmp r1, #0
	bge _080A17C8
	adds r1, #0xf
_080A17C8:
	asrs r1, r1, #4
	adds r1, #6
	adds r0, r6, #0
	bl sub_80A199C
	movs r0, #1
_080A17D4:
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl SetPrepScreenHandXPos
	b _080A1804
_080A17EA:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowPrepScreenHandCursor
_080A1804:
	mov r1, r9
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A185A
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r9, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _080A182E
	adds r4, #0xf
_080A182E:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x24
	subs r4, r4, r0
	ldr r5, _080A18D0  @ gCharacterData
	adds r0, r7, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r9
	adds r1, r4, #0
	bl StartHelpBox
_080A185A:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A1900
_080A1864:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080A187A
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_080A187A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080A188E
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	adds r0, r0, r1
	str r0, [r6, #0x34]
_080A188E:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080A189C
	mov r0, r8
	strb r1, [r0]
_080A189C:
	ldrh r4, [r6, #0x34]
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	ldr r1, _080A18D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	b _080A1900
	.align 2, 0
_080A18D0: .4byte gCharacterData
_080A18D4: .4byte 0x0000FFD8
_080A18D8:
	ldr r0, _080A1910  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A1900
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A1914  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1900
	movs r0, #0x6b
	bl m4aSongNumStart
_080A1900:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1910: .4byte gKeyStatusPtr
_080A1914: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A15B0

	THUMB_FUNC_START sub_80A1918
sub_80A1918: @ 0x080A1918
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl sub_80A2C08
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1918

	THUMB_FUNC_START sub_80A1930
sub_80A1930: @ 0x080A1930
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A1952
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x43
	movs r2, #0xc0
	movs r3, #0x18
	bl sub_80029E8
	b _080A1964
_080A1952:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl sub_80029E8
_080A1964:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1930

	THUMB_FUNC_START sub_80A196C
sub_80A196C: @ 0x080A196C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A1980  @ gUnknown_08A1975C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A1980: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A196C

	THUMB_FUNC_START sub_80A1984
sub_80A1984: @ 0x080A1984
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A1998  @ gUnknown_08A1975C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A1998: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A1984

	THUMB_FUNC_START sub_80A199C
sub_80A199C: @ 0x080A199C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0x15
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080A1A10  @ gUnknown_02013498
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_080A19D0:
	adds r0, r5, #0
	bl Text_Clear
	bl sub_80A0A94
	cmp r6, r0
	bge _080A1A66
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_80A0F6C
	cmp r0, #1
	beq _080A1A1E
	cmp r0, #1
	bgt _080A1A14
	cmp r0, #0
	beq _080A1A1A
	b _080A1A28
	.align 2, 0
_080A1A10: .4byte gUnknown_02013498
_080A1A14:
	cmp r0, #2
	beq _080A1A24
	b _080A1A28
_080A1A1A:
	movs r0, #1
	b _080A1A26
_080A1A1E:
	movs r1, #0
	mov r9, r1
	b _080A1A28
_080A1A24:
	movs r0, #4
_080A1A26:
	mov r9, r0
_080A1A28:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	mov r1, r9
	bl Text_SetColorId
	adds r0, r6, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A1A88  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _080A1A8C  @ gBG2TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
_080A1A66:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _080A19D0
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A88: .4byte gCharacterData
_080A1A8C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80A199C

	THUMB_FUNC_START sub_80A1A90
sub_80A1A90: @ 0x080A1A90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A1AA8  @ gUnknown_08A1975C
	bl Proc_Find
	cmp r0, #0
	beq _080A1AA0
	str r4, [r0, #0x3c]
_080A1AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1AA8: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A1A90

	THUMB_FUNC_START sub_80A1AAC
sub_80A1AAC: @ 0x080A1AAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl sub_80A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80A0B20
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_8083790
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A1AAC

	THUMB_FUNC_START sub_80A1AE4
sub_80A1AE4: @ 0x080A1AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _080A1B58  @ gBG1TilemapBuffer
	mov sl, r1
	ldr r6, _080A1B5C  @ gBG2TilemapBuffer
	mov r9, r6
	ldr r7, _080A1B60  @ gUnknown_020136F4
	ldr r1, _080A1B64  @ gBG0TilemapBuffer
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_080A1B08:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _080A1B68  @ gUnknown_020146F4
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_080A1B18:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _080A1B18
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _080A1B08
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B58: .4byte gBG1TilemapBuffer
_080A1B5C: .4byte gBG2TilemapBuffer
_080A1B60: .4byte gUnknown_020136F4
_080A1B64: .4byte gBG0TilemapBuffer
_080A1B68: .4byte gUnknown_020146F4

	THUMB_FUNC_END sub_80A1AE4

	THUMB_FUNC_START sub_80A1B6C
sub_80A1B6C: @ 0x080A1B6C
	push {lr}
	ldr r2, _080A1B84  @ gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080A1B88
	ldrb r0, [r0, #0x15]
	b _080A1B8A
	.align 2, 0
_080A1B84: .4byte gCharacterData
_080A1B88:
	movs r0, #0
_080A1B8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A1B6C

	THUMB_FUNC_START sub_80A1B90
sub_80A1B90: @ 0x080A1B90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r4, _080A1C6C  @ 0x000001FF
	ands r1, r4
	ldr r3, _080A1C70  @ gUnknown_08A1983C
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r4
	ldr r3, _080A1C74  @ gUnknown_08A19850
	ldr r5, _080A1C78  @ 0x0000E280
	str r5, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #5
	ands r1, r4
	ldr r3, _080A1C7C  @ gUnknown_08A19700
	ldr r0, _080A1C80  @ 0x0000ABC0
	str r0, [sp]
	movs r0, #4
	movs r2, #0x67
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x14
	ands r1, r4
	ldr r3, _080A1C84  @ gUnknown_08A1985E
	str r5, [sp]
	movs r0, #4
	movs r2, #0x6f
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc
	ands r1, r4
	ldr r3, _080A1C88  @ gUnknown_08A19872
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r4
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A1C60
	adds r5, r2, #0
_080A1C1A:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x3f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A1C2E
	movs r3, #0xd0
	lsls r3, r3, #8
_080A1C2E:
	cmp r0, #2
	bne _080A1C36
	movs r3, #0xf0
	lsls r3, r3, #8
_080A1C36:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4d
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutUnitSpriteForClassId
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1C1A
_080A1C60:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C6C: .4byte 0x000001FF
_080A1C70: .4byte gUnknown_08A1983C
_080A1C74: .4byte gUnknown_08A19850
_080A1C78: .4byte 0x0000E280
_080A1C7C: .4byte gUnknown_08A19700
_080A1C80: .4byte 0x0000ABC0
_080A1C84: .4byte gUnknown_08A1985E
_080A1C88: .4byte gUnknown_08A19872

	THUMB_FUNC_END sub_80A1B90

	THUMB_FUNC_START sub_80A1C8C
sub_80A1C8C: @ 0x080A1C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r9, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _080A1D20  @ gUnknown_08205C90
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r9
	adds r0, #0x3f
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A1D28
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1CC6:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _080A1CC6
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1CE8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _080A1CE8
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1D0A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A1D0A
	b _080A1E68
	.align 2, 0
_080A1D20: .4byte gUnknown_08205C90
_080A1D24: .4byte gBG2TilemapBuffer
_080A1D28:
	movs r7, #0
	mov r2, r9
	ldr r0, [r2, #0x2c]
	bl sub_80A0B44
	str r0, [sp, #0x14]
	mov r3, r9
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	str r0, [sp, #0x18]
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A1D48
	movs r7, #1
_080A1D48:
	mov r4, r9
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _080A1DD8  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _080A1DDC  @ gUnknown_02023CC8
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, r9
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _080A1DD8  @ gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_80A3468
	cmp r0, #2
	bne _080A1E24
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov r9, r4
	lsls r4, r0, #1
_080A1DCA:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _080A1DE0
	movs r7, #4
	b _080A1DE8
	.align 2, 0
_080A1DD8: .4byte gCharacterData
_080A1DDC: .4byte gUnknown_02023CC8
_080A1DE0:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A1DE8
	movs r7, #0
_080A1DE8:
	ldr r3, _080A1E20  @ gBG2TilemapBuffer
	adds r0, r4, r3
	mov r1, r9
	adds r1, #4
	mov r9, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _080A1DCA
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	b _080A1E68
	.align 2, 0
_080A1E20: .4byte gBG2TilemapBuffer
_080A1E24:
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_080A1E38:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _080A1E44
	movs r7, #4
	b _080A1E4C
_080A1E44:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A1E4C
	movs r7, #0
_080A1E4C:
	ldr r0, _080A1E78  @ gBG2TilemapBuffer
	adds r0, r4, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A1E38
_080A1E68:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E78: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80A1C8C

	THUMB_FUNC_START sub_80A1E7C
sub_80A1E7C: @ 0x080A1E7C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, _080A1F54  @ 0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _080A1F58  @ Pal_UIFont
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add r6, sp, #0x18
	adds r0, r6, #0
	bl Text_Init3
	mov r0, sp
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r6, #0
	movs r1, #0
	bl Text_80046B4
	ldr r4, _080A1F5C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A1EEC
	movs r4, #1
_080A1EEC:
	ldr r0, _080A1F60  @ 0x000005AB
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl Text_InsertString
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A1F08
	movs r4, #1
_080A1F08:
	ldr r0, _080A1F64  @ 0x000005AC
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x60
	adds r2, r4, #0
	bl Text_InsertString
	ldrb r0, [r5]
	bl sub_80AEBEC
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x60
	adds r0, r6, #0
	bl Text_SetXCursor
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne _080A1F36
	movs r1, #1
_080A1F36:
	adds r0, r6, #0
	bl Text_SetColorId
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_AppendNumberOr2Dashes
	movs r0, #0
	bl SetFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F54: .4byte 0x06015000
_080A1F58: .4byte Pal_UIFont
_080A1F5C: .4byte gCharacterData
_080A1F60: .4byte 0x000005AB
_080A1F64: .4byte 0x000005AC

	THUMB_FUNC_END sub_80A1E7C

	THUMB_FUNC_START sub_80A1F68
sub_80A1F68: @ 0x080A1F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A1FF4
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A203E
	movs r1, #0x3f
	adds r1, r1, r6
	mov sl, r1
_080A1F94:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0B20
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov r9, r4
	adds r4, r1, #0
_080A1FAE:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A1FE2
	ldr r0, [r1]
	cmp r0, #0
	beq _080A1FE2
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _080A1FE2
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _080A1FE2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A1FDE
	movs r0, #2
	b _080A1FE0
_080A1FDE:
	movs r0, #1
_080A1FE0:
	strb r0, [r4]
_080A1FE2:
	adds r5, #1
	cmp r5, #0x3f
	ble _080A1FAE
	mov r4, r9
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1F94
	b _080A203E
_080A1FF4:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _080A203E
	adds r7, r1, #0
_080A200A:
	adds r0, r6, #0
	adds r0, #0x3f
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0B04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2034
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AD4
	ldrb r1, [r7]
	adds r1, r1, r0
	strb r1, [r7]
_080A2034:
	adds r4, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A200A
_080A203E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1F68

	THUMB_FUNC_START sub_80A204C
sub_80A204C: @ 0x080A204C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A2074
	adds r7, r5, #0
	adds r7, #0x46
	adds r6, r0, #0
_080A2060:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AD4
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A2060
_080A2074:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A204C

	THUMB_FUNC_START sub_80A207C
sub_80A207C: @ 0x080A207C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _080A20A2
	ldr r0, [r4, #0x2c]
	bl sub_80A0F30
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _080A20EE
_080A20A2:
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	mov r9, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _080A20E0
	mov r6, r8
_080A20C2:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl sub_80A0B20
	adds r1, r0, #0
	mov r0, r9
	bl sub_80A3468
	ldrb r1, [r6]
	adds r1, r1, r0
	strb r1, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _080A20C2
_080A20E0:
	ldr r0, [r4, #0x2c]
	bl sub_80A0F30
	mov r2, r8
	ldrb r1, [r2]
	subs r1, r1, r0
	strb r1, [r2]
_080A20EE:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A207C

	THUMB_FUNC_START sub_80A20FC
sub_80A20FC: @ 0x080A20FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _080A2124
_080A2108:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AEC
	adds r1, r5, #0
	adds r1, #0x4d
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r4, #1
_080A2124:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A2108
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _080A2146
_080A213C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A1C8C
	adds r4, #1
_080A2146:
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A213C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A20FC

	THUMB_FUNC_START sub_80A2154
sub_80A2154: @ 0x080A2154
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_080A215C:
	cmp r5, #0
	blt _080A21C8
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _080A21C8
	adds r0, r7, #0
	adds r0, #0x3f
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A21C4
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	cmp r0, #0
	ble _080A21C4
	adds r6, r7, #0
	adds r6, #0x39
	ldrb r0, [r6]
	movs r1, #0xe3
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	cmp r4, r0
	blt _080A21C8
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	ldrb r2, [r6]
	movs r1, #0xfc
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _080A21C8
_080A21C4:
	adds r5, r5, r4
	b _080A215C
_080A21C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2154

	THUMB_FUNC_START sub_80A21D0
sub_80A21D0: @ 0x080A21D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A1F68
	adds r0, r4, #0
	bl sub_80A204C
	adds r0, r4, #0
	bl sub_80A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A2154
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A21D0

	THUMB_FUNC_START sub_80A221C
sub_80A221C: @ 0x080A221C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080A2270  @ gUnknown_02022C28
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_080A223A:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080A223A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2270: .4byte gUnknown_02022C28

	THUMB_FUNC_END sub_80A221C

	THUMB_FUNC_START sub_80A2274
sub_80A2274: @ 0x080A2274
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080A2418  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r2
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl SetupMapSpritesPalettes
	bl sub_80A221C
	movs r0, #0xd
	bl LoadIconPalettes
	adds r0, r5, #0
	bl NewGreenTextColorManager
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2340
	ldr r2, _080A241C  @ gRAMChapterData
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	movs r0, #1
	bl sub_80AD594
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2340
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowPrepScreenHandCursor
_080A2340:
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
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
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	bl EndSlidingWallEffectMaybe
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A2420  @ gUnknown_08A1DC1C
	ldr r4, _080A2424  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A2428  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r4, _080A242C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r2, [r0, #6]
	ldr r1, _080A2430  @ gUnknown_02022CEC
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	bl PutFace80x72
	adds r0, r5, #0
	bl sub_80A20FC
	adds r0, r5, #0
	bl sub_80A1E7C
	ldr r0, _080A2434  @ gUnknown_08A1DD0C
	ldr r1, _080A2438  @ 0x06017800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A243C  @ gUnknown_08A1E0D8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2440  @ Pal_MapBattleInfoNum
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2444  @ sub_80A1B90
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2418: .4byte gLCDControlBuffer
_080A241C: .4byte gRAMChapterData
_080A2420: .4byte gUnknown_08A1DC1C
_080A2424: .4byte gGenericBuffer
_080A2428: .4byte gBG1TilemapBuffer
_080A242C: .4byte gCharacterData
_080A2430: .4byte gUnknown_02022CEC
_080A2434: .4byte gUnknown_08A1DD0C
_080A2438: .4byte 0x06017800
_080A243C: .4byte gUnknown_08A1E0D8
_080A2440: .4byte Pal_MapBattleInfoNum
_080A2444: .4byte sub_80A1B90

	THUMB_FUNC_END sub_80A2274

	THUMB_FUNC_START sub_80A2448
sub_80A2448: @ 0x080A2448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080A247C  @ gKeyStatusPtr
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A2484
	ldr r0, _080A2480  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2470
	movs r0, #0x6b
	bl m4aSongNumStart
_080A2470:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _080A25EA
	.align 2, 0
_080A247C: .4byte gKeyStatusPtr
_080A2480: .4byte gRAMChapterData
_080A2484:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A249A
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _080A25EA
_080A249A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A24AE
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _080A25EA
_080A24AE:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A24BE
	b _080A25EA
_080A24BE:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A24CA
	b _080A25D0
_080A24CA:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _080A24FC
	ldr r0, _080A24F8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A24EC
	movs r0, #0x6a
	bl m4aSongNumStart
_080A24EC:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _080A25EA
	.align 2, 0
_080A24F8: .4byte gRAMChapterData
_080A24FC:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A2516
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _080A2516
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_080A2516:
	ldr r0, _080A25C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A2550
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_80A0AD4
	subs r0, #1
	cmp r4, r0
	bge _080A2550
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_080A2550:
	ldr r4, _080A25C8  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A2572
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	negs r2, r2
	adds r0, r6, #0
	bl sub_80A2154
_080A2572:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A2590
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_80A2154
_080A2590:
	ldrb r1, [r5]
	cmp r7, r1
	beq _080A25EA
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowPrepScreenHandCursor
	ldr r0, _080A25CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A25EA
	movs r0, #0x65
	bl m4aSongNumStart
	b _080A25EA
	.align 2, 0
_080A25C8: .4byte gKeyStatusPtr
_080A25CC: .4byte gRAMChapterData
_080A25D0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A25EA
	ldr r0, _080A25F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A25EA
	movs r0, #0x6c
	bl m4aSongNumStart
_080A25EA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A25F4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A2448

	THUMB_FUNC_START sub_80A25F8
sub_80A25F8: @ 0x080A25F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r3, _080A26A4  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadLegacyUiFrameGraphics
	bl LoadObjUIGfx
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_80A0B20
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r5]
	movs r2, #3
	ands r2, r0
	adds r2, #1
	adds r0, r4, #0
	bl sub_8083764
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A26A4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A25F8

	THUMB_FUNC_START sub_80A26A8
sub_80A26A8: @ 0x080A26A8
	push {r4, r5, lr}
	sub sp, #4
	adds r0, #0x3a
	movs r5, #0
	strb r5, [r0]
	bl HidePrepScreenHandCursor
	ldr r2, _080A2728  @ gLCDControlBuffer
	ldrb r1, [r2, #0xc]
	movs r3, #4
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	bl sub_80A1AE4
	ldr r0, _080A272C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A271E
	movs r0, #0xc8
	bl m4aSongNumStart
_080A271E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2728: .4byte gLCDControlBuffer
_080A272C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A26A8

	THUMB_FUNC_START sub_80A2730
sub_80A2730: @ 0x080A2730
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _080A27A0  @ gBG2TilemapBuffer
	mov sl, r0
_080A2744:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _080A27B4
	adds r3, r4, #1
	mov r9, r3
	ldr r2, _080A27A4  @ gUnknown_020136F4
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _080A27A8  @ gBG0TilemapBuffer
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _080A27AC  @ gBG1TilemapBuffer
	mov r8, r0
	movs r4, #0x13
_080A2770:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _080A27B0  @ gUnknown_02013EF4
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A2770
	b _080A27DC
	.align 2, 0
_080A27A0: .4byte gBG2TilemapBuffer
_080A27A4: .4byte gUnknown_020136F4
_080A27A8: .4byte gBG0TilemapBuffer
_080A27AC: .4byte gBG1TilemapBuffer
_080A27B0: .4byte gUnknown_02013EF4
_080A27B4:
	adds r1, r4, #1
	mov r9, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _080A27F8  @ gBG1TilemapBuffer
	adds r1, r0, r4
	ldr r4, _080A27FC  @ gBG0TilemapBuffer
	adds r0, r0, r4
	movs r4, #0x13
_080A27CA:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A27CA
_080A27DC:
	mov r4, r9
	cmp r4, #0x1d
	ble _080A2744
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A27F8: .4byte gBG1TilemapBuffer
_080A27FC: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80A2730

	THUMB_FUNC_START sub_80A2800
sub_80A2800: @ 0x080A2800
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	negs r0, r5
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_80A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A2864
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_80A0AA0
	str r0, [r7, #0x2c]
_080A2864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2800

	THUMB_FUNC_START sub_80A286C
sub_80A286C: @ 0x080A286C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	mov r0, r8
	str r5, [r0, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_80A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r7]
	cmp r0, #0xa
	bne _080A28D4
	mov r0, r8
	bl Proc_Break
_080A28D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A286C

	THUMB_FUNC_START sub_80A28E0
sub_80A28E0: @ 0x080A28E0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	negs r5, r5
	adds r0, r5, #0
	bl sub_80A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A2944
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_80A0AC0
	str r0, [r7, #0x2c]
_080A2944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A28E0

	THUMB_FUNC_START sub_80A294C
sub_80A294C: @ 0x080A294C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	mov r1, r8
	str r0, [r1, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_80A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r7]
	cmp r0, #0xa
	bne _080A29B6
	mov r0, r8
	bl Proc_Break
_080A29B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A294C

	THUMB_FUNC_START sub_80A29C0
sub_80A29C0: @ 0x080A29C0
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	ldr r6, _080A2A94  @ gBG0TilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A2A98  @ gBG1TilemapBuffer
	mov r8, r0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A2A9C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0
	mov r9, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A1F68
	adds r0, r4, #0
	bl sub_80A204C
	adds r0, r4, #0
	bl sub_80A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A2154
	ldr r0, _080A2AA0  @ gUnknown_08A1DC1C
	ldr r5, _080A2AA4  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #5
	mov r0, r8
	adds r1, r5, #0
	bl CallARM_FillTileRect
	ldr r5, _080A2AA8  @ gCharacterData
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #6]
	adds r6, #0x44
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl sub_80A20FC
	adds r0, r4, #0
	bl sub_80A1E7C
	bl sub_80A1AE4
	adds r4, #0x3a
	mov r0, r9
	strb r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A94: .4byte gBG0TilemapBuffer
_080A2A98: .4byte gBG1TilemapBuffer
_080A2A9C: .4byte gBG2TilemapBuffer
_080A2AA0: .4byte gUnknown_08A1DC1C
_080A2AA4: .4byte gGenericBuffer
_080A2AA8: .4byte gCharacterData

	THUMB_FUNC_END sub_80A29C0

	THUMB_FUNC_START sub_80A2AAC
sub_80A2AAC: @ 0x080A2AAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080A2B58  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r3, #3
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r4
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r3
	strb r0, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0xc
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
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2B50
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2B50
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowPrepScreenHandCursor
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_080A2B50:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B58: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A2AAC

	THUMB_FUNC_START sub_80A2B5C
sub_80A2B5C: @ 0x080A2B5C
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_80A1A90
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2B5C

	THUMB_FUNC_START sub_80A2B7C
sub_80A2B7C: @ 0x080A2B7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl sub_80A1AAC
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A2BB8
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #9
	movs r2, #0x80
	movs r3, #0x10
	bl sub_80029E8
	b _080A2BC8
_080A2BB8:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl sub_80029E8
_080A2BC8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2B7C

	THUMB_FUNC_START sub_80A2BD0
sub_80A2BD0: @ 0x080A2BD0
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A2BEE
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #9
	movs r1, #0x80
	movs r3, #0x10
	bl sub_80029E8
	b _080A2C00
_080A2BEE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	adds r1, r2, #0
	movs r3, #0x10
	bl sub_80029E8
_080A2C00:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2BD0

	THUMB_FUNC_START sub_80A2C08
sub_80A2C08: @ 0x080A2C08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A2C28  @ gUnknown_08A19880
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C28: .4byte gUnknown_08A19880

	THUMB_FUNC_END sub_80A2C08

	THUMB_FUNC_START sub_80A2C2C
sub_80A2C2C: @ 0x080A2C2C
	ldr r0, _080A2C34  @ gUnknown_0203E884
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080A2C34: .4byte gUnknown_0203E884

	THUMB_FUNC_END sub_80A2C2C

	THUMB_FUNC_START sub_80A2C38
sub_80A2C38: @ 0x080A2C38
	bx lr

	THUMB_FUNC_END sub_80A2C38

.align 2, 0
