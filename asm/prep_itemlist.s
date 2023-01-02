
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_809EB78
sub_809EB78: @ 0x0809EB78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EBA4  @ ProcScr_AtMenu
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r4, #0x36]
	movs r0, #0xff
	strh r0, [r4, #0x34]
	ldr r0, _0809EBA8  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EBB4
	bl sub_80C4048
	cmp r0, #0
	beq _0809EBAC
	adds r0, #0x2a
	b _0809EBB8
	.align 2, 0
_0809EBA4: .4byte ProcScr_AtMenu
_0809EBA8: .4byte gGMData
_0809EBAC:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	b _0809EBBE
_0809EBB4:
	adds r0, r2, #0
	adds r0, #0x31
_0809EBB8:
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
_0809EBBE:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x31
	movs r0, #0
	movs r1, #4
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r3, #0
	adds r1, #0x1a
	adds r0, r4, #0
	adds r0, #0x38
	movs r2, #8
_0809EBDA:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809EBDA
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809EB78

	THUMB_FUNC_START sub_809EBF0
sub_809EBF0: @ 0x0809EBF0
	push {r4, lr}
	sub sp, #8
	ldr r4, _0809EC2C  @ gUnknown_02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0809EC30  @ 0x000005A9
	bl GetStringFromIndex
	ldr r2, _0809EC34  @ gUnknown_020136D8
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC2C: .4byte gUnknown_02022D10
_0809EC30: .4byte 0x000005A9
_0809EC34: .4byte gUnknown_020136D8

	THUMB_FUNC_END sub_809EBF0

	THUMB_FUNC_START sub_809EC38
sub_809EC38: @ 0x0809EC38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _0809EC84  @ gUnknown_02022D18
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _0809EC88  @ gUnknown_02013668
	adds r0, r7, #0
	bl Text_Clear
	ldr r0, _0809EC8C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r4
	bgt _0809EC94
	ldr r0, _0809EC90  @ 0x00000536
	bl GetStringFromIndex
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _0809ECBA
	.align 2, 0
_0809EC84: .4byte gUnknown_02022D18
_0809EC88: .4byte gUnknown_02013668
_0809EC8C: .4byte gUnknown_02012F56
_0809EC90: .4byte 0x00000536
_0809EC94:
	ldr r0, _0809ECC4  @ gUnknown_020122D4
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne _0809ECC8
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_0809ECBA:
	movs r3, #0
	bl DrawTextInline
	b _0809ECE8
	.align 2, 0
_0809ECC4: .4byte gUnknown_020122D4
_0809ECC8:
	adds r0, r4, #0
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
_0809ECE8:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809EC38

	THUMB_FUNC_START sub_809ECFC
sub_809ECFC: @ 0x0809ECFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameClock
	ldr r2, _0809ED74  @ gPaletteBuffer
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809ED78  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809ED7C  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, _0809ED80  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809ED84  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809ED88  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl sub_80976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ED74: .4byte gPaletteBuffer
_0809ED78: .4byte gUnknown_08A1BD60
_0809ED7C: .4byte 0x0000029A
_0809ED80: .4byte gUnknown_08A19608
_0809ED84: .4byte gUnknown_08A195F8
_0809ED88: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809ECFC

	THUMB_FUNC_START sub_809ED8C
sub_809ED8C: @ 0x0809ED8C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0809F0C0  @ gLCDControlBuffer
	mov r8, r0
	ldrb r1, [r0]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
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
	mov r0, r8
	ldrb r2, [r0, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	mov r2, r8
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r5, #2
	orrs r0, r5
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
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
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #0x17
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0809F0C4  @ 0x06012000
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
	ldr r0, _0809F0C8  @ gUnknown_08A1B9EC
	ldr r4, _0809F0CC  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809F0D0  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #1]
	mov r1, r8
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
	adds r2, #0x34
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _0809F0D4  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #6
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl Text_Init
	adds r4, #0x10
	movs r5, #4
_0809EF2C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809EF2C
	movs r2, #0x33
	adds r2, r2, r7
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _0809F0D8  @ gUnknown_02013698
	movs r5, #7
_0809EF4A:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809EF4A
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r0, _0809F0DC  @ gUnknown_02022D86
	mov r9, r0
	adds r1, r4, #0
	movs r2, #6
	bl sub_809D8D4
	ldr r0, _0809F0E0  @ gUnknown_08A19CCC
	ldr r1, _0809F0E4  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809F0E8  @ gUnknown_08A1A084
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl sub_8097748
	bl sub_8097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_809F5F4
	ldr r5, _0809F0D8  @ gUnknown_02013698
	ldr r1, _0809F0EC  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_809D300
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, r9
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809B74C
	bl sub_809EBF0
	adds r0, r7, #0
	bl sub_80ACCE0
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl sub_80ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80ACD7C
	movs r0, #3
	bl sub_80ACD60
	ldr r0, _0809F0F0  @ sub_809ECFC
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, _0809F0F4  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartFace2
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
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
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _0809F0F8  @ gBG0TilemapBuffer
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	bl sub_809EC38
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F0C0: .4byte gLCDControlBuffer
_0809F0C4: .4byte 0x06012000
_0809F0C8: .4byte gUnknown_08A1B9EC
_0809F0CC: .4byte gGenericBuffer
_0809F0D0: .4byte gBG1TilemapBuffer
_0809F0D4: .4byte gUnknown_02013660
_0809F0D8: .4byte gUnknown_02013698
_0809F0DC: .4byte gUnknown_02022D86
_0809F0E0: .4byte gUnknown_08A19CCC
_0809F0E4: .4byte 0x06015000
_0809F0E8: .4byte gUnknown_08A1A084
_0809F0EC: .4byte gUnknown_02023CC6
_0809F0F0: .4byte sub_809ECFC
_0809F0F4: .4byte 0x00000203
_0809F0F8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_809ED8C

	THUMB_FUNC_START sub_809F0FC
sub_809F0FC: @ 0x0809F0FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809F120  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809F124
	bl sub_80C4048
	cmp r0, #0
	beq _0809F134
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x2a
	b _0809F132
	.align 2, 0
_0809F120: .4byte gGMData
_0809F124:
	ldr r0, _0809F14C  @ ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
_0809F132:
	strb r1, [r0]
_0809F134:
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndBG3Slider_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F14C: .4byte ProcScr_AtMenu

	THUMB_FUNC_END sub_809F0FC

	THUMB_FUNC_START sub_809F150
sub_809F150: @ 0x0809F150
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ResetIconGraphics_
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl sub_809F370
	ldr r0, _0809F1F0  @ gUnknown_02013698
	ldr r1, _0809F1F4  @ gUnknown_02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809D300
	ldr r0, _0809F1F8  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809F1FC  @ sub_809EC38
	movs r1, #2
	adds r2, r4, #0
	bl sub_80ACE20
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F210
	ldr r0, _0809F200  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809F208
	ldr r2, _0809F204  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _0809F20E
	.align 2, 0
_0809F1F0: .4byte gUnknown_02013698
_0809F1F4: .4byte gUnknown_02023CC6
_0809F1F8: .4byte gUnknown_02022EEC
_0809F1FC: .4byte sub_809EC38
_0809F200: .4byte gUnknown_02012F56
_0809F204: .4byte gUnknown_020122D4
_0809F208:
	bl CloseHelpBox
	movs r0, #0xff
_0809F20E:
	strh r0, [r4, #0x36]
_0809F210:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F150

	THUMB_FUNC_START sub_809F218
sub_809F218: @ 0x0809F218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809F24A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
_0809F24A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _0809F266
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809F25C
	movs r0, #8
	b _0809F25E
_0809F25C:
	subs r0, #1
_0809F25E:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809F150
_0809F266:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809F28A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
_0809F28A:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809F2BA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809F2BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F218

	THUMB_FUNC_START sub_809F2C4
sub_809F2C4: @ 0x0809F2C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809F2F6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_0809F2F6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _0809F312
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809F308
	movs r0, #0
	b _0809F30A
_0809F308:
	adds r0, #1
_0809F30A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809F150
_0809F312:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809F336
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
_0809F336:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809F366
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809F366:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F2C4

	THUMB_FUNC_START sub_809F370
sub_809F370: @ 0x0809F370
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809F398  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809F39C
	mov r3, ip
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809F3BA
	.align 2, 0
_0809F398: .4byte gUnknown_02012F56
_0809F39C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _0809F3BA
	strh r0, [r4]
_0809F3BA:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809F3D8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809F3D8
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809F3D8:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F370

	THUMB_FUNC_START sub_809F3F4
sub_809F3F4: @ 0x0809F3F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl ResetIconGraphics_
	ldr r0, _0809F48C  @ gUnknown_02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809D418
	ldr r0, _0809F490  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _0809F446
	ldr r0, _0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809F446:
	cmp r7, #0
	ble _0809F460
	ldr r0, _0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809F460:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F48C: .4byte gUnknown_02023CC6
_0809F490: .4byte gUnknown_02022EEC
_0809F494: .4byte gUnknown_02013698

	THUMB_FUNC_END sub_809F3F4

	THUMB_FUNC_START sub_809F498
sub_809F498: @ 0x0809F498
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _0809F4B6
	ldr r0, _0809F4CC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809F4D4
_0809F4B6:
	ldr r0, _0809F4D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F4C4
	b _0809F5E2
_0809F4C4:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809F5E2
	.align 2, 0
_0809F4CC: .4byte gUnknown_02012F56
_0809F4D0: .4byte gRAMChapterData
_0809F4D4:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _0809F5B8  @ gUnknown_020122D4
	mov r9, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	strh r4, [r0, #2]
	bl sub_80982B8
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r6, #0
	bl sub_809F370
	bl ResetIconGraphics_
	ldr r0, _0809F5BC  @ gUnknown_02022EEC
	ldr r4, _0809F5C0  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809F5C4  @ gUnknown_02023CC6
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809F56E
	ldr r0, _0809F5C8  @ sub_809EC38
	movs r1, #1
	adds r2, r6, #0
	bl sub_80ACE20
_0809F56E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0809F5D0
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809F5CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F5E2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809F5E2
	.align 2, 0
_0809F5B8: .4byte gUnknown_020122D4
_0809F5BC: .4byte gUnknown_02022EEC
_0809F5C0: .4byte gUnknown_02013670
_0809F5C4: .4byte gUnknown_02023CC6
_0809F5C8: .4byte sub_809EC38
_0809F5CC: .4byte gRAMChapterData
_0809F5D0:
	ldr r0, _0809F5F0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F5E2
	movs r0, #0x6a
	bl m4aSongNumStart
_0809F5E2:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F5F0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809F498

	THUMB_FUNC_START sub_809F5F4
sub_809F5F4: @ 0x0809F5F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _0809F620
	cmp r3, #0
	beq _0809F620
	adds r0, r3, #1
	strh r0, [r4]
_0809F620:
	mov r4, ip
	adds r4, #0x33
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809F654
	ldr r0, _0809F684  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809F654
	subs r0, r5, #1
	strh r0, [r6]
_0809F654:
	mov r0, ip
	bl sub_809F370
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F684: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809F5F4

	THUMB_FUNC_START sub_809F688
sub_809F688: @ 0x0809F688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	movs r1, #0x38
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r9, r1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r0
	ldrh r0, [r7]
	movs r2, #0xf
	mov sl, r2
	mov r1, sl
	ands r1, r0
	mov sl, r1
	cmp r1, #0
	beq _0809F6C0
	b _0809F908
_0809F6C0:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F6CC
	cmp r0, #0xff
	beq _0809F6CC
	b _0809F7C0
_0809F6CC:
	ldr r1, _0809F708  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _0809F714
	ldr r0, _0809F70C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809F724
	ldr r1, _0809F710  @ gUnknown_020122D4
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, r9
	lsls r1, r0, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F708: .4byte gKeyStatusPtr
_0809F70C: .4byte gUnknown_02012F56
_0809F710: .4byte gUnknown_020122D4
_0809F714:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809F794
	ldr r0, _0809F73C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809F744
_0809F724:
	ldr r0, _0809F740  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F732
	b _0809FA7A
_0809F732:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809FA7A
	.align 2, 0
_0809F73C: .4byte gUnknown_02012F56
_0809F740: .4byte gRAMChapterData
_0809F744:
	ldr r0, _0809F76C  @ gUnknown_020122D4
	mov r2, r9
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809F770
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl sub_80AC9D4
	adds r0, r4, #0
	movs r1, #7
	b _0809F774
	.align 2, 0
_0809F76C: .4byte gUnknown_020122D4
_0809F770:
	adds r0, r4, #0
	movs r1, #6
_0809F774:
	bl Proc_Goto
	ldr r0, _0809F790  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F786
	b _0809FA7A
_0809F786:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809FA7A
	.align 2, 0
_0809F790: .4byte gRAMChapterData
_0809F794:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809F7E0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _0809F7BC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F7B6
	movs r0, #0x6b
	bl m4aSongNumStart
_0809F7B6:
	mov r0, sl
	strh r0, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F7BC: .4byte gRAMChapterData
_0809F7C0:
	ldr r2, _0809F7DC  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809F7E0
	bl CloseHelpBox
	mov r1, sl
	strh r1, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F7DC: .4byte gKeyStatusPtr
_0809F7E0:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809F828
	movs r0, #0
	bl sub_80ACDA4
	ldr r0, _0809F824  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F80A
	movs r0, #0x67
	bl m4aSongNumStart
_0809F80A:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809F218
	b _0809FA7A
	.align 2, 0
_0809F824: .4byte gRAMChapterData
_0809F828:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809F864
	movs r0, #1
	bl sub_80ACDA4
	ldr r0, _0809F860  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F848
	movs r0, #0x67
	bl m4aSongNumStart
_0809F848:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_809F2C4
	b _0809FA7A
	.align 2, 0
_0809F860: .4byte gRAMChapterData
_0809F864:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809F878
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _0809F87E
_0809F878:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_0809F87E:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809F8AC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x33
	adds r5, r4, #0
	adds r5, #0x38
	cmp r0, #0
	beq _0809F8C8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809F8C8
_0809F8AC:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0809F8C8
	subs r0, r1, #1
	strh r0, [r3]
_0809F8C8:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809F8EA
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809F966
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809F966
_0809F8EA:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _0809F904  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809F966
	adds r0, r1, #1
	strh r0, [r2]
	b _0809F966
	.align 2, 0
_0809F904: .4byte gUnknown_02012F56
_0809F908:
	mov r1, r9
	lsls r0, r1, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809F926
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_0809F926:
	ldrb r0, [r6]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809F94E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_0809F94E:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	mov r5, r8
_0809F966:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp r9, r0
	bne _0809F974
	b _0809FA7A
_0809F974:
	ldr r7, _0809F9F0  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _0809F9F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F990
	movs r0, #0x66
	bl m4aSongNumStart
_0809F990:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r7
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0809F9B0
	adds r0, r4, #0
	bl sub_809EC38
_0809F9B0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _0809F9F8
	cmp r3, #0
	beq _0809F9F8
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F9E2
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809F9E2:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b _0809FA30
	.align 2, 0
_0809F9F0: .4byte gUnknown_020122D4
_0809F9F4: .4byte gRAMChapterData
_0809F9F8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809FA3C
	ldr r0, _0809FA38  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809FA3C
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FA28
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809FA28:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809FA30:
	adds r0, r4, #0
	bl sub_809F3F4
	b _0809FA7A
	.align 2, 0
_0809FA38: .4byte gUnknown_02012F56
_0809FA3C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FA5C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809FA5C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
_0809FA7A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F688

	THUMB_FUNC_START sub_809FA88
sub_809FA88: @ 0x0809FA88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r1, #0
	cmp r5, #5
	bne _0809FAA6
	movs r5, #4
	b _0809FAAE
_0809FAA6:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FAAE
	subs r5, #1
_0809FAAE:
	cmp r1, #0
	beq _0809FB2C
	ldr r2, _0809FAD4  @ gKeyStatusPtr
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x30
	cmp r0, #0
	beq _0809FAE4
	ldrb r0, [r3]
	cmp r0, #0
	beq _0809FAD8
	subs r0, #1
	strb r0, [r3]
	b _0809FAE4
	.align 2, 0
_0809FAD4: .4byte gKeyStatusPtr
_0809FAD8:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FAE4
	strb r5, [r3]
_0809FAE4:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r4, #0x80
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FB0A
	ldrb r0, [r3]
	cmp r0, r5
	bge _0809FAFC
	adds r0, #1
	b _0809FB08
_0809FAFC:
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FB0A
	movs r0, #0
_0809FB08:
	strb r0, [r3]
_0809FB0A:
	ldrb r3, [r3]
	cmp ip, r3
	beq _0809FB2C
	ldr r0, _0809FB28  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FB22
	movs r0, #0x66
	bl m4aSongNumStart
_0809FB22:
	movs r0, #1
	b _0809FB2E
	.align 2, 0
_0809FB28: .4byte gRAMChapterData
_0809FB2C:
	movs r0, #0
_0809FB2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809FA88

	THUMB_FUNC_START sub_809FB34
sub_809FB34: @ 0x0809FB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _0809FB50
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _0809FB56
_0809FB50:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_0809FB56:
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809FB34

	THUMB_FUNC_START sub_809FB70
sub_809FB70: @ 0x0809FB70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r1, r1, #1
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _0809FC0C  @ gUnknown_020122D4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_80982B8
	cmp r5, #0
	bne _0809FBB6
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
_0809FBB6:
	adds r0, r6, #0
	bl sub_809F370
	ldr r0, _0809FC10  @ gUnknown_02022EEC
	ldr r4, _0809FC14  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809FC18  @ gUnknown_02023CC6
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809FC1C  @ sub_809EC38
	movs r1, #1
	adds r2, r6, #0
	bl sub_80ACE20
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _0809FC20  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FC06
	movs r0, #0x6a
	bl m4aSongNumStart
_0809FC06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC0C: .4byte gUnknown_020122D4
_0809FC10: .4byte gUnknown_02022EEC
_0809FC14: .4byte gUnknown_02013670
_0809FC18: .4byte gUnknown_02023CC6
_0809FC1C: .4byte sub_809EC38
_0809FC20: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809FB70

	THUMB_FUNC_START sub_809FC24
sub_809FC24: @ 0x0809FC24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809FC4C
	ldr r0, _0809FC48  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FD0C
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _0809FD4E
	.align 2, 0
_0809FC48: .4byte gKeyStatusPtr
_0809FC4C:
	ldr r0, _0809FC80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FC84
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _0809FD4E
	.align 2, 0
_0809FC80: .4byte gKeyStatusPtr
_0809FC84:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FCE0
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _0809FCC4  @ gUnknown_020122D4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r3, [r2]
	lsls r3, r3, #1
	adds r2, #5
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl sub_8097F44
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FCCC
	movs r1, #1
	negs r1, r1
	ldr r2, _0809FCC8  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8097DA8
	b _0809FD4E
	.align 2, 0
_0809FCC4: .4byte gUnknown_020122D4
_0809FCC8: .4byte 0x0000088B
_0809FCCC:
	movs r0, #0
	bl sub_80ACA84
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_809FB70
	b _0809FD4E
_0809FCE0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809FD0C
	movs r0, #0
	bl sub_80ACA84
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _0809FD08  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FD4E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809FD4E
	.align 2, 0
_0809FD08: .4byte gRAMChapterData
_0809FD0C:
	adds r0, r5, #0
	bl sub_809FA88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FD4E
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809FD4E
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809FD4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809FC24

	THUMB_FUNC_START sub_809FD54
sub_809FD54: @ 0x0809FD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r0, r0, r1
	ldrh r4, [r0]
	lsls r4, r4, #2
	ldr r0, _0809FD84  @ gUnknown_020122D4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_809BE60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD84: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809FD54

	THUMB_FUNC_START StartPrepItemListScreenProc
StartPrepItemListScreenProc: @ 0x0809FD88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FD9C  @ ProcScr_PrepItemListScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD9C: .4byte ProcScr_PrepItemListScreen

	THUMB_FUNC_END StartPrepItemListScreenProc

.align 2, 0
