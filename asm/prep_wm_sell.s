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

.align 2, 0
