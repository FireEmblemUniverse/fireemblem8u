	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80B0638
sub_80B0638: @ 0x080B0638
	push {lr}
	sub sp, #4
	ldr r0, _080B066C  @ gUnknown_08A209F0
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #8
	bl PutSpriteExt
	ldr r0, _080B0670  @ gUnknown_08A209E4
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B066C: .4byte gUnknown_08A209F0
_080B0670: .4byte gUnknown_08A209E4

	THUMB_FUNC_END sub_80B0638

	THUMB_FUNC_START sub_80B0674
sub_80B0674: @ 0x080B0674
	push {r4, lr}
	ldr r2, _080B06B4  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	negs r0, r0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080B06B8
	ldrb r1, [r2, #0x1b]
	cmp r1, #1
	bne _080B06A2
	movs r0, #0x10
	orrs r4, r0
_080B06A2:
	cmp r1, #2
	bne _080B06AA
	movs r0, #0x20
	orrs r4, r0
_080B06AA:
	cmp r1, #3
	bne _080B06C2
_080B06AE:
	orrs r4, r3
	b _080B06C2
	.align 2, 0
_080B06B4: .4byte gRAMChapterData
_080B06B8:
	ldrb r0, [r2, #0x1b]
	cmp r0, #3
	beq _080B06AE
	movs r0, #0x20
	orrs r4, r0
_080B06C2:
	movs r0, #1
	orrs r0, r4
	movs r1, #0x18
	bl sub_80895B4
	adds r0, r4, #0
	movs r1, #0x19
	bl sub_80895B4
	bl EnablePaletteSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_8089678
	movs r4, #0xb4
	lsls r4, r4, #4
	ldr r0, _080B06F8  @ gRAMChapterData
	bl sub_8089768
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8089624
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B06F8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B0674

	THUMB_FUNC_START sub_80B06FC
sub_80B06FC: @ 0x080B06FC
	push {r4, r5, lr}
	ldr r0, _080B074C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa0
	bls _080B070E
	movs r5, #0
_080B070E:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080B0746
	cmp r5, #0x63
	bhi _080B0730
	ldr r1, _080B0750  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	ldr r4, _080B0754  @ 0x04000054
	movs r0, #0x64
	subs r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080B0730:
	cmp r5, #0
	bne _080B073C
	ldr r0, _080B0758  @ 0x04000012
	ldr r1, _080B075C  @ gLCDControlBuffer
	ldrh r1, [r1, #0x1e]
	strh r1, [r0]
_080B073C:
	cmp r5, #0x78
	bne _080B0746
	ldr r1, _080B0758  @ 0x04000012
	movs r0, #4
	strh r0, [r1]
_080B0746:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B074C: .4byte 0x04000006
_080B0750: .4byte 0x04000050
_080B0754: .4byte 0x04000054
_080B0758: .4byte 0x04000012
_080B075C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B06FC

	THUMB_FUNC_START sub_80B0760
sub_80B0760: @ 0x080B0760
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	mov r9, r0
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	ldr r0, _080B07D0  @ gUnknown_08A21598
	ldr r1, [r0]
	ldr r2, _080B07D4  @ 0x01000040
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, #2
	mov r3, r9
	strh r3, [r0]
	ldr r4, _080B07D8  @ gUnknown_08A21590
	ldr r1, [r4]
	ldr r2, _080B07DC  @ 0x010000A2
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080B086E
	ldr r0, [r4]
	ldr r1, _080B07E0  @ gUnknown_08A21594
	ldr r1, [r1]
	movs r2, #0x51
	bl CpuFastSet
	movs r0, #0
	mov r8, r0
	movs r7, #0
_080B07AE:
	ldr r2, _080B07D8  @ gUnknown_08A21590
	ldr r0, [r2]
	adds r3, r0, r7
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B0852
	ldrb r1, [r3, #1]
	cmp r1, #1
	beq _080B07EA
	cmp r1, #1
	bgt _080B07E4
	cmp r1, #0
	beq _080B07F6
	b _080B0834
	.align 2, 0
_080B07D0: .4byte gUnknown_08A21598
_080B07D4: .4byte 0x01000040
_080B07D8: .4byte gUnknown_08A21590
_080B07DC: .4byte 0x010000A2
_080B07E0: .4byte gUnknown_08A21594
_080B07E4:
	cmp r1, #2
	beq _080B07F6
	b _080B0834
_080B07EA:
	ldr r0, _080B0820  @ gRAMChapterData
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080B0852
_080B07F6:
	ldr r5, _080B0824  @ gUnknown_08A21598
	ldr r0, [r5]
	mov r1, r9
	lsls r4, r1, #2
	adds r0, r4, r0
	movs r6, #0
	mov r3, r8
	strb r3, [r0]
	bl GetBonusContentClaimFlags
	movs r2, #1
	adds r1, r2, #0
	mov r3, r8
	lsls r1, r3
	ands r1, r0
	cmp r1, #0
	beq _080B0828
	ldr r0, [r5]
	adds r0, r4, r0
	strb r6, [r0, #1]
	b _080B082E
	.align 2, 0
_080B0820: .4byte gRAMChapterData
_080B0824: .4byte gUnknown_08A21598
_080B0828:
	ldr r0, [r5]
	adds r0, r4, r0
	strb r2, [r0, #1]
_080B082E:
	movs r0, #1
	add r9, r0
	ldr r2, _080B0878  @ gUnknown_08A21590
_080B0834:
	ldr r0, [r2]
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _080B0852
	ldr r0, _080B087C  @ gUnknown_08A21594
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #0xfc
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
_080B0852:
	adds r7, #0x14
	movs r1, #1
	add r8, r1
	mov r3, r8
	cmp r3, #0xf
	ble _080B07AE
	ldr r0, _080B0880  @ gUnknown_08A2159C
	ldr r0, [r0]
	mov r1, r9
	str r1, [r0]
	ldr r0, _080B087C  @ gUnknown_08A21594
	ldr r0, [r0]
	bl SaveBonusContentData
_080B086E:
	mov r3, r9
	cmp r3, #0
	beq _080B0884
	movs r0, #1
	b _080B0886
	.align 2, 0
_080B0878: .4byte gUnknown_08A21590
_080B087C: .4byte gUnknown_08A21594
_080B0880: .4byte gUnknown_08A2159C
_080B0884:
	movs r0, #0
_080B0886:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B0760

	THUMB_FUNC_START sub_80B0894
sub_80B0894: @ 0x080B0894
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r4, _080B0938  @ gUnknown_08A215A0
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r6, r1, r0
	lsls r0, r5, #1
	str r0, [sp, #8]
	movs r0, #0x1f
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	ldr r0, _080B093C  @ gUnknown_08A21598
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	str r2, [sp, #0xc]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r3, _080B0940  @ gUnknown_08A21590
	ldr r1, [r3]
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	lsls r7, r0, #2
	adds r1, r1, r7
	ldrb r1, [r1, #2]
	mov r8, r1
	movs r3, #0
	mov r9, r3
	ldr r0, [sp, #8]
	lsls r4, r0, #6
	ldr r1, _080B0944  @ gBG2TilemapBuffer
	adds r1, r1, r4
	mov sl, r1
	mov r0, sl
	movs r1, #0x14
	movs r2, #1
	bl TileMap_FillRect
	adds r0, r6, #0
	bl Text_Clear
	cmp r5, #0x1f
	ble _080B0906
	b _080B0A08
_080B0906:
	ldr r2, _080B0940  @ gUnknown_08A21590
	ldr r0, [r2]
	adds r1, r0, r7
	ldrb r0, [r1]
	movs r2, #3
	ands r2, r0
	cmp r2, #0
	beq _080B0A08
	cmp r2, #1
	bne _080B091E
	movs r3, #4
	mov r9, r3
_080B091E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _080B0928
	movs r2, #1
	mov r9, r2
_080B0928:
	ldrb r0, [r1, #1]
	cmp r0, #0
	blt _080B09CA
	cmp r0, #1
	ble _080B0948
	cmp r0, #2
	beq _080B099C
	b _080B09CA
	.align 2, 0
_080B0938: .4byte gUnknown_08A215A0
_080B093C: .4byte gUnknown_08A21598
_080B0940: .4byte gUnknown_08A21590
_080B0944: .4byte gBG2TilemapBuffer
_080B0948:
	mov r0, r8
	bl GetItemName
	ldr r1, _080B0998  @ gBG2TilemapBuffer
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, r9
	movs r3, #0
	bl DrawTextInline
	ldr r0, _080B0998  @ gBG2TilemapBuffer
	adds r0, #0x14
	adds r5, r4, r0
	mov r4, r9
	cmp r4, #0
	bne _080B0972
	movs r4, #2
_080B0972:
	mov r0, r8
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DrawDecNumber
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl DrawIcon
	b _080B09CA
	.align 2, 0
_080B0998: .4byte gBG2TilemapBuffer
_080B099C:
	mov r0, r8
	bl GetItemName
	ldr r1, _080B0A18  @ gBG2TilemapBuffer
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, r9
	movs r3, #0
	bl DrawTextInline
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl DrawIcon
_080B09CA:
	adds r6, #8
	adds r0, r6, #0
	bl Text_Clear
	ldr r3, [sp, #8]
	lsls r1, r3, #6
	ldr r0, _080B0A1C  @ gUnknown_02023CC0
	adds r5, r1, r0
	mov r2, r9
	cmp r2, #0
	bne _080B09E2
	movs r2, #3
_080B09E2:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080B0A20  @ gUnknown_08A21590
	ldr r3, [sp, #0x10]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #3
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
_080B0A08:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0A18: .4byte gBG2TilemapBuffer
_080B0A1C: .4byte gUnknown_02023CC0
_080B0A20: .4byte gUnknown_08A21590

	THUMB_FUNC_END sub_80B0894

	THUMB_FUNC_START sub_80B0A24
sub_80B0A24: @ 0x080B0A24
	push {r4, r5, lr}
	ldr r1, _080B0A4C  @ gUnknown_08A21598
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl GetBonusContentClaimFlags
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl SetBonusContentClaimFlags
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0A4C: .4byte gUnknown_08A21598

	THUMB_FUNC_END sub_80B0A24

	THUMB_FUNC_START sub_80B0A50
sub_80B0A50: @ 0x080B0A50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	bl ResetUnitSprites
	movs r4, #1
_080B0A5C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B0A98
	ldr r3, [r2]
	cmp r3, #0
	beq _080B0A98
	ldr r0, [r2, #0xc]
	ldr r1, _080B0AB4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080B0A98
	ldrb r0, [r3, #4]
	cmp r0, #1
	beq _080B0A82
	cmp r0, #0xf
	bne _080B0A98
_080B0A82:
	ldr r0, _080B0AB8  @ gUnknown_08A215A4
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	str r2, [r0, #4]
	adds r5, #1
	adds r0, r2, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_080B0A98:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B0A5C
	adds r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	strb r1, [r0]
	bl SetupMapSpritesPalettes
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0AB4: .4byte 0x00010004
_080B0AB8: .4byte gUnknown_08A215A4

	THUMB_FUNC_END sub_80B0A50

	THUMB_FUNC_START sub_80B0ABC
sub_80B0ABC: @ 0x080B0ABC
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r1, #6
	movs r2, #0x18
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B0ABC

	THUMB_FUNC_START sub_80B0ADC
sub_80B0ADC: @ 0x080B0ADC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _080B0D04  @ gUnknown_08B1754C
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _080B0D08  @ gUnknown_08A295B4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B0D0C  @ Img_CommGameBgScreen
	ldr r1, _080B0D10  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B0D14  @ gBG3TilemapBuffer
	ldr r1, _080B0D18  @ gUnknown_08A295D4
	movs r2, #0xc0
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	movs r0, #8
	bl BG_EnableSyncByMask
	bl LoadUiFrameGraphics
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadObjUIGfx
	bl sub_80B0674
	bl sub_80B0ABC
	ldr r0, _080B0D1C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r1, [r0, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r7]
	adds r7, #1
	ldrb r0, [r7]
	orrs r0, r4
	orrs r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r0, ip
	ldrb r2, [r0, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	mov r2, ip
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	mov r2, ip
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl sub_80B0760
	movs r5, #0
	ldr r0, _080B0D20  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	bge _080B0C0C
	ldr r7, _080B0D24  @ gUnknown_08A215A0
_080B0BDE:
	lsls r0, r5, #4
	ldr r4, [r7]
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl Text_Init
	adds r0, r5, #0
	bl sub_80B0894
	adds r5, #1
	cmp r5, #5
	bgt _080B0C0C
	ldr r0, _080B0D20  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	blt _080B0BDE
_080B0C0C:
	adds r0, r6, #0
	adds r0, #0x29
	str r0, [sp]
	movs r1, #0x2e
	adds r1, r1, r6
	mov sl, r1
	movs r2, #0x2a
	adds r2, r2, r6
	mov r8, r2
	movs r0, #0x2b
	adds r0, r0, r6
	mov r9, r0
	ldr r7, _080B0D24  @ gUnknown_08A215A0
	movs r4, #0x60
	movs r5, #1
_080B0C2A:
	ldr r0, [r7]
	adds r0, r0, r4
	movs r1, #6
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B0C2A
	movs r5, #2
	ldr r0, _080B0D24  @ gUnknown_08A215A0
	ldr r0, [r0]
	adds r0, #0x70
	movs r1, #0xf
	bl Text_Init
	ldr r0, _080B0D28  @ sub_80B0638
	adds r1, r6, #0
	bl StartParallelWorker
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _080B0D2C  @ sub_80B06FC
	bl SetPrimaryHBlankHandler
	movs r0, #0
	ldr r1, [sp]
	strb r0, [r1]
	movs r1, #0
	strh r0, [r6, #0x2c]
	mov r2, sl
	strb r1, [r2]
	mov r2, r8
	strb r1, [r2]
	mov r1, r9
	strb r5, [r1]
	str r0, [r6, #0x34]
	ldr r1, _080B0D30  @ 0x0000FFD8
	ldrh r2, [r6, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r0, r6, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r2, [sp]
	ldrb r1, [r2]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
	adds r0, r6, #0
	bl NewGreenTextColorManager
	adds r0, r6, #0
	bl Make6CMenuScroll
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_80976AC
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitPrepSideBarImg
	ldrh r1, [r6, #0x2c]
	ldr r0, _080B0D20  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #8
	movs r3, #5
	bl sub_80976CC
	adds r0, r6, #0
	bl sub_80AC9C0
	adds r0, r6, #0
	bl sub_80B0A50
	ldr r0, _080B0D34  @ 0x06013800
	movs r1, #5
	bl LoadDialogueBoxGfx
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D04: .4byte gUnknown_08B1754C
_080B0D08: .4byte gUnknown_08A295B4
_080B0D0C: .4byte Img_CommGameBgScreen
_080B0D10: .4byte 0x06008000
_080B0D14: .4byte gBG3TilemapBuffer
_080B0D18: .4byte gUnknown_08A295D4
_080B0D1C: .4byte gLCDControlBuffer
_080B0D20: .4byte gUnknown_08A2159C
_080B0D24: .4byte gUnknown_08A215A0
_080B0D28: .4byte sub_80B0638
_080B0D2C: .4byte sub_80B06FC
_080B0D30: .4byte 0x0000FFD8
_080B0D34: .4byte 0x06013800

	THUMB_FUNC_END sub_80B0ADC

	THUMB_FUNC_START sub_80B0D38
sub_80B0D38: @ 0x080B0D38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r4, [r6]
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B0D58
	b _080B0F36
_080B0D58:
	ldr r0, _080B0D94  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080B0E48
	ldr r0, _080B0D98  @ gUnknown_08A21598
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl GetBonusContentClaimFlags
	adds r1, r7, #0
	lsls r1, r4
	ands r1, r0
	cmp r1, #0
	beq _080B0DA0
	movs r1, #1
	negs r1, r1
	ldr r2, _080B0D9C  @ 0x0000088F
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80AEBCC
	b _080B0F82
	.align 2, 0
_080B0D94: .4byte gKeyStatusPtr
_080B0D98: .4byte gUnknown_08A21598
_080B0D9C: .4byte 0x0000088F
_080B0DA0:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B0E2C
	ldr r7, _080B0DC8  @ gUnknown_08A21590
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, r1, r4
	ldrb r0, [r1, #1]
	cmp r0, #0
	bge _080B0DBE
	b _080B0F82
_080B0DBE:
	cmp r0, #1
	ble _080B0DCC
	cmp r0, #2
	beq _080B0DF0
	b _080B0F82
	.align 2, 0
_080B0DC8: .4byte gUnknown_08A21590
_080B0DCC:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080B0DEC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B0DE2
	b _080B0F82
_080B0DE2:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080B0F82
	.align 2, 0
_080B0DEC: .4byte gRAMChapterData
_080B0DF0:
	ldrb r0, [r1, #2]
	cmp r0, #0x9f
	bne _080B0DFC
	ldr r0, _080B0E24  @ 0x00000BB8
	bl sub_8024E20
_080B0DFC:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0xa0
	bne _080B0E0C
	ldr r0, _080B0E28  @ 0x00001388
	bl sub_8024E20
_080B0E0C:
	ldrb r0, [r6]
	bl sub_80B0A24
	ldrb r0, [r6]
	bl sub_80B0894
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B0F82
	.align 2, 0
_080B0E24: .4byte 0x00000BB8
_080B0E28: .4byte 0x00001388
_080B0E2C:
	ldr r0, _080B0E44  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B0E3A
	b _080B0F82
_080B0E3A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080B0F82
	.align 2, 0
_080B0E44: .4byte gRAMChapterData
_080B0E48:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B0E70
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080B0E6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B0E64
	b _080B0F82
_080B0E64:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B0F82
	.align 2, 0
_080B0E6C: .4byte gRAMChapterData
_080B0E70:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B0E7C
	subs r4, #1
_080B0E7C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B0E86
	adds r4, #1
_080B0E86:
	ldrb r0, [r6]
	cmp r0, r4
	beq _080B0F28
	cmp r4, #0
	blt _080B0F82
	ldr r0, _080B0ED0  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r4, r0
	bge _080B0F82
	ldr r0, _080B0ED4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B0EAC
	movs r0, #0x66
	bl m4aSongNumStart
_080B0EAC:
	strb r4, [r6]
	ldrb r2, [r6]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080B0ED8
	cmp r2, #0
	beq _080B0ED8
	movs r0, #0xff
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r6]
	subs r0, #1
	bl sub_80B0894
	b _080B0F28
	.align 2, 0
_080B0ED0: .4byte gUnknown_08A2159C
_080B0ED4: .4byte gRAMChapterData
_080B0ED8:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #4
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0x40
	bne _080B0F10
	ldr r0, _080B0F0C  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080B0F10
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	bl sub_80B0894
	b _080B0F28
	.align 2, 0
_080B0F0C: .4byte gUnknown_08A2159C
_080B0F10:
	ldrb r1, [r2]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
_080B0F28:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B0F82
_080B0F36:
	adds r2, r5, #0
	adds r2, #0x2e
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080B0F48
	ldrh r0, [r5, #0x2c]
	subs r0, #4
	strh r0, [r5, #0x2c]
_080B0F48:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080B0F56
	ldrh r0, [r5, #0x2c]
	adds r0, #4
	strh r0, [r5, #0x2c]
_080B0F56:
	ldrh r1, [r5, #0x2c]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080B0F62
	strb r1, [r2]
_080B0F62:
	ldr r1, _080B0F8C  @ 0x0000FFD8
	ldrh r2, [r5, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r1, [r5, #0x2c]
	ldr r0, _080B0F90  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #8
	movs r3, #5
	bl sub_80976CC
_080B0F82:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F8C: .4byte 0x0000FFD8
_080B0F90: .4byte gUnknown_08A2159C

	THUMB_FUNC_END sub_80B0D38

	THUMB_FUNC_START sub_80B0F94
sub_80B0F94: @ 0x080B0F94
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _080B0FFC
	movs r4, #0x30
_080B0FA8:
	ldr r0, _080B0FD4  @ gUnknown_08A215A4
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B0FD8
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x60
	adds r2, r4, #0
	movs r3, #0xc4
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
	b _080B0FEC
	.align 2, 0
_080B0FD4: .4byte gUnknown_08A215A4
_080B0FD8:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x60
	adds r2, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
_080B0FEC:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _080B0FA8
_080B0FFC:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B0F94

	THUMB_FUNC_START sub_80B1008
sub_80B1008: @ 0x080B1008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080B101A
	bl Proc_End
	movs r0, #0
	str r0, [r4, #0x34]
_080B101A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B1008

	THUMB_FUNC_START sub_80B1020
sub_80B1020: @ 0x080B1020
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldr r0, _080B1138  @ gUnknown_08A215A0
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x60
	ldr r0, [sp, #4]
	adds r0, #0x2b
	ldrb r0, [r0]
	mov sl, r0
	lsls r4, r0, #1
	adds r3, r4, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xb
	movs r1, #5
	movs r2, #0xe
	bl DrawUiFrame2
	ldr r3, _080B113C  @ gLCDControlBuffer
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0x58
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xc8
	strb r0, [r1]
	adds r4, #7
	lsls r4, r4, #3
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x29
	ldrb r2, [r0]
	lsls r2, r2, #4
	ldr r1, [sp, #4]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	subs r0, #0x38
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x28
	movs r3, #1
	bl sub_80AC9D4
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x5c
	movs r2, #0xc
	bl ShowPrepScreenHandCursor
	movs r0, #0
	mov r9, r0
	cmp r9, sl
	bge _080B11C0
	ldr r0, _080B1140  @ gUnknown_02022CC4
	movs r1, #0xc9
	lsls r1, r1, #1
	adds r1, r0, r1
	str r1, [sp, #8]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r3, r0, r3
	str r3, [sp, #0xc]
	movs r0, #0
	mov r8, r0
_080B10EE:
	movs r7, #0
	ldr r1, _080B1144  @ gUnknown_08A215A4
	ldr r0, [r1]
	add r0, r8
	ldr r4, [r0, #4]
	adds r0, r6, #0
	bl Text_Clear
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetXCursor
	mov r0, sl
	subs r0, #1
	cmp r9, r0
	bne _080B1148
	bl GetConvoyItemCount
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080B111A
	movs r7, #1
_080B111A:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParameters
	movs r0, #0xc2
	lsls r0, r0, #2
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
	b _080B1170
	.align 2, 0
_080B1138: .4byte gUnknown_08A215A0
_080B113C: .4byte gLCDControlBuffer
_080B1140: .4byte gUnknown_02022CC4
_080B1144: .4byte gUnknown_08A215A4
_080B1148:
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	cmp r5, #5
	bne _080B1156
	movs r7, #1
_080B1156:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParameters
	ldr r0, [r4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
_080B1170:
	cmp r7, #0
	bne _080B1184
	ldr r3, _080B1180  @ gUnknown_08A215A4
	ldr r0, [r3]
	add r0, r8
	movs r1, #1
	b _080B118C
	.align 2, 0
_080B1180: .4byte gUnknown_08A215A4
_080B1184:
	ldr r1, _080B11DC  @ gUnknown_08A215A4
	ldr r0, [r1]
	add r0, r8
	movs r1, #0
_080B118C:
	strb r1, [r0]
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl Text_Draw
	movs r1, #1
	cmp r7, #0
	bne _080B119E
	movs r1, #2
_080B119E:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl sub_8004B88
	adds r6, #8
	ldr r3, [sp, #8]
	adds r3, #0x80
	str r3, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r0, #0x80
	str r0, [sp, #0xc]
	movs r1, #8
	add r8, r1
	movs r3, #1
	add r9, r3
	cmp r9, sl
	blt _080B10EE
_080B11C0:
	ldr r0, _080B11E0  @ sub_80B0F94
	ldr r1, [sp, #4]
	bl StartParallelWorker
	ldr r1, [sp, #4]
	str r0, [r1, #0x34]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B11DC: .4byte gUnknown_08A215A4
_080B11E0: .4byte sub_80B0F94

	THUMB_FUNC_END sub_80B1020

	THUMB_FUNC_START sub_80B11E4
sub_80B11E4: @ 0x080B11E4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r0, #0x2a
	adds r0, r0, r4
	mov r8, r0
	ldrb r3, [r0]
	ldr r1, _080B122C  @ gUnknown_08A215A4
	mov r9, r1
	ldr r0, [r1]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldr r0, _080B1230  @ gUnknown_08A21598
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r5, [r6]
	lsls r1, r5, #2
	ldr r0, [r0]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080B1234  @ gUnknown_08A21590
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r7, [r1, #2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080B1238
	movs r0, #0
	b _080B127A
	.align 2, 0
_080B122C: .4byte gUnknown_08A215A4
_080B1230: .4byte gUnknown_08A21598
_080B1234: .4byte gUnknown_08A21590
_080B1238:
	adds r0, r5, #0
	bl sub_80B0A24
	ldrb r0, [r6]
	bl sub_80B0894
	mov r0, r8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _080B1260
	adds r0, r7, #0
	bl MakeNewItem
	bl AddItemToConvoy
	b _080B1278
_080B1260:
	mov r0, r9
	ldr r1, [r0]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r4, [r0, #4]
	adds r0, r7, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_080B1278:
	movs r0, #1
_080B127A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B11E4

	THUMB_FUNC_START sub_80B1288
sub_80B1288: @ 0x080B1288
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r4, [r6]
	ldr r0, _080B12B8  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B12CE
	adds r0, r5, #0
	bl sub_80B11E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B12BC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B1344
	.align 2, 0
_080B12B8: .4byte gKeyStatusPtr
_080B12BC:
	movs r1, #1
	negs r1, r1
	movs r2, #0x89
	lsls r2, r2, #4
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80AEBCC
	b _080B1344
_080B12CE:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B12F4
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080B12F0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B1344
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B1344
	.align 2, 0
_080B12F0: .4byte gRAMChapterData
_080B12F4:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B1300
	subs r4, #1
_080B1300:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B130A
	adds r4, #1
_080B130A:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080B1344
	cmp r4, #0
	blt _080B1344
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080B1344
	ldr r0, _080B134C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B1330
	movs r0, #0x66
	bl m4aSongNumStart
_080B1330:
	strb r4, [r6]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x5c
	movs r2, #0xc
	bl ShowPrepScreenHandCursor
_080B1344:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B134C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B1288

	THUMB_FUNC_START sub_80B1350
sub_80B1350: @ 0x080B1350
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80B1008
	ldr r2, _080B13B0  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B13B4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B13B8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl sub_80B0ABC
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	bl sub_80ACA84
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B13B0: .4byte gLCDControlBuffer
_080B13B4: .4byte gBG1TilemapBuffer
_080B13B8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80B1350

	THUMB_FUNC_START sub_80B13BC
sub_80B13BC: @ 0x080B13BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r0, [r6]
	ldr r1, _080B14FC  @ gUnknown_08A21598
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080B1500  @ gUnknown_08A21590
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	str r0, [sp, #0x30]
	adds r1, r1, r0
	ldrb r1, [r1, #2]
	str r1, [sp, #0x2c]
	ldr r0, _080B1504  @ gUnknown_08A215A0
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r2, _080B1508  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080B150C  @ gBG0TilemapBuffer
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B1510  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl sub_80B0ABC
	movs r0, #3
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl sub_80B1008
	bl GetLastUsedGameSaveSlot
	bl SaveGame
	movs r0, #0
	str r0, [r4, #0x30]
	bl sub_80ACA84
	ldrb r1, [r6]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParameters
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	ldr r0, [sp, #0x2c]
	bl GetItemName
	adds r7, r0, #0
	ldr r0, _080B1514  @ 0x00000883
	add r1, sp, #0xc
	bl GetStringFromIndexInBuffer
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetStringTextWidth
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetStringTextWidth
	adds r4, r4, r0
	adds r0, r4, #7
	cmp r0, #0
	bge _080B1498
	adds r0, #7
_080B1498:
	asrs r0, r0, #3
	adds r0, #4
	mov r9, r0
	lsrs r0, r0, #0x1f
	add r0, r9
	asrs r0, r0, #1
	movs r1, #0xf
	subs r1, r1, r0
	mov r8, r1
	adds r0, r5, #0
	adds r1, r7, #0
	bl Text_AppendString
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_AppendString
	mov r0, r8
	lsls r4, r0, #1
	ldr r1, _080B1518  @ 0x00000286
	add r1, sl
	adds r1, r4, r1
	adds r0, r5, #0
	bl Text_Draw
	ldr r0, _080B151C  @ 0x00000282
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r1, _080B1500  @ gUnknown_08A21590
	ldr r0, [r1]
	ldr r2, [sp, #0x30]
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080B154A
	cmp r0, #1
	ble _080B1520
	cmp r0, #2
	beq _080B1538
	b _080B154A
	.align 2, 0
_080B14FC: .4byte gUnknown_08A21598
_080B1500: .4byte gUnknown_08A21590
_080B1504: .4byte gUnknown_08A215A0
_080B1508: .4byte gLCDControlBuffer
_080B150C: .4byte gBG0TilemapBuffer
_080B1510: .4byte gBG1TilemapBuffer
_080B1514: .4byte 0x00000883
_080B1518: .4byte 0x00000286
_080B151C: .4byte 0x00000282
_080B1520:
	ldr r0, _080B1534  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B154A
	movs r0, #0x5a
	bl m4aSongNumStart
	b _080B154A
	.align 2, 0
_080B1534: .4byte gRAMChapterData
_080B1538:
	ldr r0, _080B15D8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B154A
	movs r0, #0xb9
	bl m4aSongNumStart
_080B154A:
	ldr r0, _080B15DC  @ gBG1TilemapBuffer
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	mov r1, r8
	movs r2, #0xa
	mov r3, r9
	bl DrawUiFrame
	ldr r0, _080B15E0  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	mov r2, r8
	lsls r0, r2, #3
	mov r1, ip
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x50
	strb r0, [r1]
	mov r0, r8
	add r0, r9
	lsls r0, r0, #3
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x68
	strb r0, [r1]
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r2, _080B15E4  @ 0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B15D8: .4byte gRAMChapterData
_080B15DC: .4byte gBG1TilemapBuffer
_080B15E0: .4byte gLCDControlBuffer
_080B15E4: .4byte 0x0000FFFC

	THUMB_FUNC_END sub_80B13BC

	THUMB_FUNC_START sub_80B15E8
sub_80B15E8: @ 0x080B15E8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r0, #1
	str r0, [r2, #0x30]
	cmp r0, #0x1e
	ble _080B1610
	ldr r0, _080B160C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B1610
	adds r0, r2, #0
	bl Proc_Break
	b _080B161C
	.align 2, 0
_080B160C: .4byte gKeyStatusPtr
_080B1610:
	ldr r0, [r2, #0x30]
	cmp r0, #0x78
	ble _080B161C
	adds r0, r2, #0
	bl Proc_Break
_080B161C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B15E8

	THUMB_FUNC_START sub_80B1620
sub_80B1620: @ 0x080B1620
	push {lr}
	ldr r0, _080B1660  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B1664  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl sub_80B0ABC
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r2, _080B1668  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0
	.align 2, 0
_080B1660: .4byte gBG0TilemapBuffer
_080B1664: .4byte gBG1TilemapBuffer
_080B1668: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B1620

	THUMB_FUNC_START sub_80B166C
sub_80B166C: @ 0x080B166C
	push {r4, lr}
	adds r4, r0, #0
	bl EndGreenTextColorManager
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B166C

	THUMB_FUNC_START StartBonusClaimScreen
StartBonusClaimScreen: @ 0x080B1688
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B1698  @ gUnknown_08A215A8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B1698: .4byte gUnknown_08A215A8

	THUMB_FUNC_END StartBonusClaimScreen

.align 2, 0
