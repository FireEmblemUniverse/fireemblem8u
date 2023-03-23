	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START CanUnitPrepScreenUse
CanUnitPrepScreenUse: @ 0x0809839C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _080983CA
_080983AC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _080983C4
	movs r0, #1
	b _080983CC
_080983C4:
	adds r4, #1
	cmp r4, r6
	blt _080983AC
_080983CA:
	movs r0, #0
_080983CC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitPrepScreenUse

	THUMB_FUNC_START sub_80983D4
sub_80983D4: @ 0x080983D4
	push {lr}
	ldr r0, _08098400  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080983E6
	movs r2, #0
_080983E6:
	cmp r2, #0
	bne _080983F0
	ldr r1, _08098404  @ 0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_080983F0:
	cmp r2, #0x48
	bne _080983FA
	ldr r1, _08098404  @ 0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_080983FA:
	pop {r0}
	bx r0
	.align 2, 0
_08098400: .4byte 0x04000006
_08098404: .4byte 0x04000012

	THUMB_FUNC_END sub_80983D4

	THUMB_FUNC_START sub_8098408
sub_8098408: @ 0x08098408
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x34]
	str r0, [r4, #0x48]
	str r0, [r4, #0x44]
	bl HasConvoyAccess_
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8098408

	THUMB_FUNC_START sub_8098448
sub_8098448: @ 0x08098448
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098468  @ gUnknown_08A1B1FC
	ldr r1, _0809846C  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098470  @ gUnknown_08A1B638
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098468: .4byte gUnknown_08A1B1FC
_0809846C: .4byte 0x06013000
_08098470: .4byte gUnknown_08A1B638

	THUMB_FUNC_END sub_8098448

	THUMB_FUNC_START sub_8098474
sub_8098474: @ 0x08098474
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0809849C
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _080984A4  @ gUnknown_08A18928
	ldr r0, [r4, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xb0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809849C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080984A4: .4byte gUnknown_08A18928

	THUMB_FUNC_END sub_8098474

	THUMB_FUNC_START sub_80984A8
sub_80984A8: @ 0x080984A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080984C8  @ gUnknown_08A18944
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080984C8: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984A8

	THUMB_FUNC_START sub_80984CC
sub_80984CC: @ 0x080984CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080984E8  @ gUnknown_08A18944
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080984E8: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984CC

	THUMB_FUNC_START sub_80984EC
sub_80984EC: @ 0x080984EC
	push {lr}
	ldr r0, _080984FC  @ gUnknown_08A18944
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x38]
	pop {r0}
	bx r0
	.align 2, 0
_080984FC: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984EC

	THUMB_FUNC_START sub_8098500
sub_8098500: @ 0x08098500
	push {lr}
	ldr r0, _08098510  @ gUnknown_08A18944
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08098510: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_8098500

	THUMB_FUNC_START sub_8098514
sub_8098514: @ 0x08098514
	push {lr}
	ldr r0, _08098528  @ gUiFramePaletteA
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08098528: .4byte gUiFramePaletteA

	THUMB_FUNC_END sub_8098514

	THUMB_FUNC_START sub_809852C
sub_809852C: @ 0x0809852C
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _0809854A
	ldr r1, [r2, #0x2c]
	ldr r2, [r2, #0x30]
	ldr r3, _08098550  @ gUnknown_08A18964
	movs r0, #0x96
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809854A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098550: .4byte gUnknown_08A18964

	THUMB_FUNC_END sub_809852C

	THUMB_FUNC_START sub_8098554
sub_8098554: @ 0x08098554
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809856C  @ gUnknown_08A1898C
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_0809856C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098554

	THUMB_FUNC_START sub_8098570
sub_8098570: @ 0x08098570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809858C  @ gUnknown_08A1898C
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809858C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098570

	THUMB_FUNC_START sub_8098590
sub_8098590: @ 0x08098590
	push {lr}
	ldr r0, _080985A0  @ gUnknown_08A1898C
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x34]
	pop {r0}
	bx r0
	.align 2, 0
_080985A0: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098590

	THUMB_FUNC_START sub_80985A4
sub_80985A4: @ 0x080985A4
	push {lr}
	ldr r0, _080985B4  @ gUnknown_08A1898C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080985B4: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_80985A4

	THUMB_FUNC_START sub_80985B8
sub_80985B8: @ 0x080985B8
	push {r4, r5, lr}
	ldr r0, _080985F8  @ gUnknown_02013588
	ldr r4, _080985FC  @ gUnknown_0202310E
	adds r1, r4, #0
	bl Text_Draw
	adds r5, r4, #0
	adds r5, #0x10
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004B88
	adds r4, #0x12
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	movs r0, #0xa8
	movs r1, #0x85
	bl sub_80984CC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080985F8: .4byte gUnknown_02013588
_080985FC: .4byte gUnknown_0202310E

	THUMB_FUNC_END sub_80985B8

	THUMB_FUNC_START sub_8098600
sub_8098600: @ 0x08098600
	push {lr}
	ldr r0, _0809861C  @ gUnknown_0202310E
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	bl sub_80984EC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809861C: .4byte gUnknown_0202310E

	THUMB_FUNC_END sub_8098600

	THUMB_FUNC_START sub_8098620
sub_8098620: @ 0x08098620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, _08098970  @ gUnknown_08205C14
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08098974  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, _08098978  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #4
	bl SetupFaceGfxData
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
	ldr r0, _0809897C  @ 0x06017800
	movs r1, #0
	bl SetupDebugFontForOBJ
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
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
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadUiFrameGraphics
	ldr r0, _08098980  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl LoadObjUIGfx
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	adds r1, r7, #0
	adds r1, #0x2a
	movs r4, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	ldr r0, _08098984  @ sub_809A274
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl sub_80AC9C0
	movs r0, #0
	bl SetPrimaryHBlankHandler
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
	ldr r0, _08098988  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	add r4, sp, #0x24
	mov sl, r4
	ldr r5, _0809898C  @ gUnknown_02013498
	movs r4, #0xe
_08098726:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08098726
	movs r0, #0x2b
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _08098990  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08098746:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Init
	adds r0, r6, #0
	movs r1, #7
	bl Text_Init
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08098746
	ldr r4, _08098994  @ gUnknown_02013560
	adds r0, r4, #0
	movs r1, #8
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #8
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #7
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl Text_Init
	ldr r0, _08098998  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r1, #0
	mov r9, r1
	str r1, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r2, r9
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r3, _08098978  @ gLCDControlBuffer
	movs r4, #0x36
	adds r4, r4, r3
	mov ip, r4
	ldrb r2, [r4]
	movs r1, #0x20
	orrs r2, r1
	ldrb r0, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	movs r4, #4
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r6, r3, #0
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6]
	orrs r2, r5
	orrs r2, r3
	movs r0, #5
	negs r0, r0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _0809899C  @ 0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	ldr r1, _080989A0  @ 0x0000FFD8
	ldrh r2, [r7, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetupMapSpritesPalettes
	mov r4, r9
	str r4, [sp, #0x24]
	ldr r1, _080989A4  @ gUnknown_02022C08
	ldr r2, _080989A8  @ 0x01000008
	mov r0, sl
	bl CpuFastSet
	bl ForceSyncUnitSpriteSheet
	ldr r0, _080989AC  @ Img_PrepTextShadow
	ldr r1, _080989B0  @ 0x06013E00
	bl CopyDataWithPossibleUncomp
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl sub_80ACA4C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	bl EndSlidingWallEffectMaybe
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080988E2
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r7, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	mov r2, r8
	ldrb r0, [r2]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _080989B4  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
_080988E2:
	movs r3, #0x80
	lsls r3, r3, #2
	movs r4, #4
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0xe0
	movs r2, #0xb
	bl PrepStartSideBarScroll
	ldrh r4, [r7, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
	bl sub_8097668
	bl PrepUpdateSMS
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r9
	str r1, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080989B8  @ sub_80983D4
	bl SetPrimaryHBlankHandler
	movs r0, #0xa8
	movs r1, #0x85
	movs r2, #0xb
	adds r3, r7, #0
	bl sub_80984A8
	adds r0, r7, #0
	bl sub_8098554
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098970: .4byte gUnknown_08205C14
_08098974: .4byte gUnknown_08A181E8
_08098978: .4byte gLCDControlBuffer
_0809897C: .4byte 0x06017800
_08098980: .4byte gUiFramePaletteD
_08098984: .4byte sub_809A274
_08098988: .4byte gPaletteBuffer
_0809898C: .4byte gUnknown_02013498
_08098990: .4byte gUnknown_02013510
_08098994: .4byte gUnknown_02013560
_08098998: .4byte 0x06014000
_0809899C: .4byte 0x0000FFFC
_080989A0: .4byte 0x0000FFD8
_080989A4: .4byte gUnknown_02022C08
_080989A8: .4byte 0x01000008
_080989AC: .4byte Img_PrepTextShadow
_080989B0: .4byte 0x06013E00
_080989B4: .4byte 0x00000503
_080989B8: .4byte sub_80983D4

	THUMB_FUNC_END sub_8098620

	THUMB_FUNC_START sub_80989BC
sub_80989BC: @ 0x080989BC
	push {lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndAllParallelWorkers
	bl EndPrepScreenHandCursor
	bl sub_80ACB00
	movs r0, #0
	bl sub_8099F50
	movs r0, #1
	bl sub_8099F50
	bl EndBG3Slider_
	bl EndHelpPromptSprite
	bl Delete6CMenuScroll
	bl sub_8098500
	bl sub_80985A4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80989BC

	THUMB_FUNC_START sub_8098A04
sub_8098A04: @ 0x08098A04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _08098A68  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl Text_Clear
	ldr r0, _08098A6C  @ 0x00000583
	bl GetStringFromIndex
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, _08098A70  @ 0x00000584
	bl GetStringFromIndex
	adds r5, #0xc2
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098A68: .4byte gUnknown_02013560
_08098A6C: .4byte 0x00000583
_08098A70: .4byte 0x00000584

	THUMB_FUNC_END sub_8098A04

	THUMB_FUNC_START sub_8098A74
sub_8098A74: @ 0x08098A74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _08098AB0  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r0, #8
	bl Text_Clear
	adds r4, #0x10
	adds r0, r4, #0
	bl Text_Clear
	bl sub_80C4070
	cmp r0, #1
	beq _08098AC8
	cmp r0, #1
	bgt _08098AB4
	cmp r0, #0
	beq _08098ABE
	b _08098ADA
	.align 2, 0
_08098AB0: .4byte gUnknown_02013560
_08098AB4:
	cmp r0, #2
	beq _08098AD0
	cmp r0, #3
	beq _08098AD8
	b _08098ADA
_08098ABE:
	ldr r5, _08098AC4  @ 0x00000672
	b _08098ADA
	.align 2, 0
_08098AC4: .4byte 0x00000672
_08098AC8:
	ldr r5, _08098ACC  @ 0x00000673
	b _08098ADA
	.align 2, 0
_08098ACC: .4byte 0x00000673
_08098AD0:
	ldr r5, _08098AD4  @ 0x00000674
	b _08098ADA
	.align 2, 0
_08098AD4: .4byte 0x00000674
_08098AD8:
	ldr r5, _08098B38  @ 0x00000675
_08098ADA:
	adds r0, r5, #0
	bl GetStringFromIndex
	ldr r4, _08098B3C  @ gUnknown_02013560
	adds r1, r6, #0
	adds r1, #0x80
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	ldr r0, _08098B40  @ 0x00000583
	bl GetStringFromIndex
	adds r2, r4, #0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r6, r3
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	ldr r0, _08098B44  @ 0x00000584
	bl GetStringFromIndex
	adds r4, #0x10
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r6, r2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098B38: .4byte 0x00000675
_08098B3C: .4byte gUnknown_02013560
_08098B40: .4byte 0x00000583
_08098B44: .4byte 0x00000584

	THUMB_FUNC_END sub_8098A74

	THUMB_FUNC_START sub_8098B48
sub_8098B48: @ 0x08098B48
	push {lr}
	sub sp, #4
	ldr r0, _08098B64  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x59
	movs r2, #9
	movs r3, #4
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098B64: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098B48

	THUMB_FUNC_START sub_8098B68
sub_8098B68: @ 0x08098B68
	push {lr}
	sub sp, #4
	bl sub_80C4070
	cmp r0, #3
	bne _08098B8C
	ldr r0, _08098B88  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
	b _08098B9C
	.align 2, 0
_08098B88: .4byte 0x0000A440
_08098B8C:
	ldr r0, _08098BA4  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
_08098B9C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BA4: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098B68

	THUMB_FUNC_START sub_8098BA8
sub_8098BA8: @ 0x08098BA8
	push {lr}
	sub sp, #4
	ldr r0, _08098BC4  @ 0x0000A440
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BC4: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098BA8

	THUMB_FUNC_START sub_8098BC8
sub_8098BC8: @ 0x08098BC8
	push {lr}
	sub sp, #4
	ldr r0, _08098BE4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BE4: .4byte 0x0000A840

	THUMB_FUNC_END sub_8098BC8

	THUMB_FUNC_START sub_8098BE8
sub_8098BE8: @ 0x08098BE8
	push {lr}
	ldr r0, _08098C04  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098C0C
	ldr r0, _08098C08  @ sub_8098B68
	bl GetParallelWorker
	bl Proc_End
	b _08098C16
	.align 2, 0
_08098C04: .4byte gGMData
_08098C08: .4byte sub_8098B68
_08098C0C:
	ldr r0, _08098C30  @ sub_8098B48
	bl GetParallelWorker
	bl Proc_End
_08098C16:
	ldr r0, _08098C34  @ sub_8098BA8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08098C38  @ sub_8098BC8
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08098C30: .4byte sub_8098B48
_08098C34: .4byte sub_8098BA8
_08098C38: .4byte sub_8098BC8

	THUMB_FUNC_END sub_8098BE8

	THUMB_FUNC_START sub_8098C3C
sub_8098C3C: @ 0x08098C3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _08098C80  @ Pals_PrepWindow
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08098C84  @ Img_PrepWindow
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098C88  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098C80: .4byte Pals_PrepWindow
_08098C84: .4byte Img_PrepWindow
_08098C88: .4byte gPlaySt

	THUMB_FUNC_END sub_8098C3C

	THUMB_FUNC_START PutImg_PrepPopupWindow
PutImg_PrepPopupWindow: @ 0x08098C8C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08098CB4  @ Img_PrepPopupWindow
	ldr r1, _08098CB8  @ 0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098CBC  @ gUiFramePaletteD
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098CB4: .4byte Img_PrepPopupWindow
_08098CB8: .4byte 0x06010000
_08098CBC: .4byte gUiFramePaletteD

	THUMB_FUNC_END PutImg_PrepPopupWindow

	THUMB_FUNC_START sub_8098CC0
sub_8098CC0: @ 0x08098CC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl LoadUiFrameGraphics
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	adds r0, r6, #0
	bl sub_809A08C
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
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl PutImg_PrepPopupWindow
	ldr r0, _08098D78  @ gUnknown_08A1B8B8
	ldr r4, _08098D7C  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098D80  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08098D84  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08098D88  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08098D8C  @ gUnknown_02013510
	ldr r7, _08098D90  @ gUnknown_02022EEC
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #2
	bl sub_8099F7C
	ldr r0, _08098D94  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D98
	adds r0, r7, #0
	subs r0, #0x20
	bl sub_8098A74
	b _08098DA0
	.align 2, 0
_08098D78: .4byte gUnknown_08A1B8B8
_08098D7C: .4byte gGenericBuffer
_08098D80: .4byte gBG1TilemapBuffer
_08098D84: .4byte gUiFramePaletteD
_08098D88: .4byte 0x00000503
_08098D8C: .4byte gUnknown_02013510
_08098D90: .4byte gUnknown_02022EEC
_08098D94: .4byte gGMData
_08098D98:
	adds r0, r7, #0
	adds r0, #0x60
	bl sub_8098A04
_08098DA0:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowPrepScreenHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_809A504
	bl sub_80ACAE4
	bl sub_80ACAA4
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r6, #0
	bl StartHelpPromptSprite
	bl sub_8098BE8
	ldr r0, _08098E14  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098E1C
	ldr r0, _08098E18  @ sub_8098B68
	adds r1, r6, #0
	bl StartParallelWorker
	b _08098E24
	.align 2, 0
_08098E14: .4byte gGMData
_08098E18: .4byte sub_8098B68
_08098E1C:
	ldr r0, _08098E3C  @ sub_8098B48
	adds r1, r6, #0
	bl StartParallelWorker
_08098E24:
	bl sub_80985B8
	bl sub_8098590
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098E3C: .4byte sub_8098B48

	THUMB_FUNC_END sub_8098CC0

	THUMB_FUNC_START sub_8098E40
sub_8098E40: @ 0x08098E40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r3, r8
	adds r3, #0x2a
	ldrb r7, [r3]
	ldr r0, _08098F1C  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	mov r4, r8
	adds r4, #0x31
	movs r0, #4
	strb r0, [r4]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098E6E
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r4]
_08098E6E:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08098E80
	ldrb r0, [r3]
	subs r0, #3
	cmp r0, #0
	blt _08098E80
	strb r0, [r3]
_08098E80:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x2a
	cmp r0, #0
	beq _08098E9E
	ldrb r4, [r6]
	adds r4, #3
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08098E9E
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_08098E9E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08098EBA
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098EBA
	subs r0, r4, #1
	strb r0, [r6]
_08098EBA:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _08098EE4
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08098EE4
	adds r4, #1
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08098EE4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08098EE4:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08098FA0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x34]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08098F20
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08098F20
	lsrs r1, r1, #4
	adds r1, #4
	b _08098F34
	.align 2, 0
_08098F1C: .4byte gKeyStatusPtr
_08098F20:
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08098F54
	cmp r7, #0
	beq _08098F54
	lsrs r1, r7, #4
	subs r1, #1
_08098F34:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_809A114
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl SetPrepScreenHandXPos
	b _08098F84
_08098F54:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowPrepScreenHandCursor
_08098F84:
	ldr r0, _08098F9C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F96
	movs r0, #0x65
	bl m4aSongNumStart
_08098F96:
	movs r0, #1
	b _08098FA2
	.align 2, 0
_08098F9C: .4byte gPlaySt
_08098FA0:
	movs r0, #0
_08098FA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098E40

	THUMB_FUNC_START sub_8098FAC
sub_8098FAC: @ 0x08098FAC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _0809904C
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809904C
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	adds r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0809902C
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
_0809902C:
	ldrh r4, [r6, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
_0809904C:
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0xf
	bgt _080990C8
	cmp r1, #0
	beq _080990C8
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	subs r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080990A8
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
_080990A8:
	ldrh r4, [r6, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
_080990C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080990D0: .4byte 0x0000FFD8

	THUMB_FUNC_END sub_8098FAC

	THUMB_FUNC_START sub_80990D4
sub_80990D4: @ 0x080990D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80989BC
	movs r0, #0x31
	bl SetStatScreenConfig
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80990D4

	THUMB_FUNC_START sub_8099100
sub_8099100: @ 0x08099100
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8098620
	bl GetLatestUnitIndexInPrepListByUId
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809A08C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099100

	THUMB_FUNC_START sub_8099120
sub_8099120: @ 0x08099120
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08099132
	b _0809930E
_08099132:
	ldr r0, _0809914C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099150
	adds r0, r6, #0
	bl Proc_Break
	b _08099314
	.align 2, 0
_0809914C: .4byte gKeyStatusPtr
_08099150:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0809915C
	b _08099288
_0809915C:
	ldr r0, _080991A4  @ gGMData
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08099202
	bl sub_80C4070
	cmp r0, #2
	beq _080991A8
	cmp r0, #3
	bne _080991FC
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08099230
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08099230
	ldrb r0, [r4]
	adds r0, #1
	b _08099234
	.align 2, 0
_080991A4: .4byte gGMData
_080991A8:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080991E0
	ldr r0, _080991DC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080991D0
	movs r0, #0x6a
	bl m4aSongNumStart
_080991D0:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	b _08099314
	.align 2, 0
_080991DC: .4byte gPlaySt
_080991E0:
	ldr r0, _080991F8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080991EE
	b _08099314
_080991EE:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_080991F8: .4byte gPlaySt
_080991FC:
	adds r0, r6, #0
	movs r1, #0xd
	b _0809926A
_08099202:
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08099230
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08099230
	ldrb r0, [r4]
	adds r0, #1
	b _08099234
_08099230:
	ldrb r0, [r4]
	subs r0, #1
_08099234:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	adds r0, r6, #0
	movs r1, #2
_0809926A:
	bl Proc_Goto
	ldr r0, _08099284  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099314
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_08099284: .4byte gPlaySt
_08099288:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080992CC
	ldr r0, _080992C4  @ gGMData
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080992A8
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_080992A8:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	ldr r0, _080992C8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099314
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_080992C4: .4byte gGMData
_080992C8: .4byte gPlaySt
_080992CC:
	adds r0, r6, #0
	bl sub_8098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809930E
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809931C  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08099320  @ gUnknown_02013510
	ldr r5, _08099324  @ gUnknown_02022EEC
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
_0809930E:
	adds r0, r6, #0
	bl sub_8098FAC
_08099314:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809931C: .4byte 0x00000503
_08099320: .4byte gUnknown_02013510
_08099324: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_8099120

	THUMB_FUNC_START sub_8099328
sub_8099328: @ 0x08099328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov r8, r1
	mov sl, r2
	mov r0, r8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _08099454  @ gUnknown_02013560
	adds r0, r7, #0
	bl Text_Clear
	bl PrepGetUnitAmount
	movs r4, #0
	cmp r0, #1
	bgt _08099358
	movs r4, #1
_08099358:
	ldr r0, _08099458  @ 0x00000594
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	bl PrepGetUnitAmount
	movs r4, #0
	cmp r0, #1
	bgt _08099376
	movs r4, #1
_08099376:
	ldr r0, _0809945C  @ 0x00000595
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertString
	mov r1, r8
	adds r1, #0x40
	adds r0, r7, #0
	bl Text_Draw
	adds r5, r7, #0
	adds r5, #8
	adds r0, r5, #0
	bl Text_Clear
	mov r0, sl
	bl CanUnitPrepScreenUse
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080993AC
	movs r4, #1
_080993AC:
	ldr r0, _08099460  @ 0x00000596
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	movs r6, #0
	mov r4, r9
	adds r4, #0x2c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080993CE
	movs r6, #1
_080993CE:
	ldr r0, _08099464  @ 0x0000059A
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	adds r2, r6, #0
	bl Text_InsertString
	mov r1, r8
	adds r1, #0xc0
	adds r0, r5, #0
	bl Text_Draw
	adds r5, r7, #0
	adds r5, #0x10
	adds r0, r5, #0
	bl Text_Clear
	movs r6, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08099400
	movs r6, #1
_08099400:
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl Text_InsertString
	ldr r0, _08099468  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099470
	adds r6, r5, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0809943E
	mov r0, sl
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809943E
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08099440
_0809943E:
	movs r5, #1
_08099440:
	ldr r0, _0809946C  @ 0x00000597
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x20
	adds r2, r5, #0
	bl Text_InsertString
	b _080994A2
	.align 2, 0
_08099454: .4byte gUnknown_02013560
_08099458: .4byte 0x00000594
_0809945C: .4byte 0x00000595
_08099460: .4byte 0x00000596
_08099464: .4byte 0x0000059A
_08099468: .4byte gGMData
_0809946C: .4byte 0x00000597
_08099470:
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08099490
	ldr r0, _0809948C  @ 0x00000599
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #1
	bl Text_InsertString
	b _080994A2
	.align 2, 0
_0809948C: .4byte 0x00000599
_08099490:
	ldr r0, _080994BC  @ 0x00000599
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertString
_080994A2:
	ldr r0, _080994C0  @ gUnknown_02013570
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	bl Text_Draw
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080994BC: .4byte 0x00000599
_080994C0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_8099328

	THUMB_FUNC_START sub_80994C4
sub_80994C4: @ 0x080994C4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2b
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r6, r0, #0
	adds r4, #0x32
	movs r1, #0
	mov r8, r1
	movs r0, #1
	strb r0, [r4]
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r5, _080995B8  @ gUnknown_02013510
	ldr r7, _080995BC  @ gUnknown_02022EEC
	mov r2, r9
	ldrb r0, [r2]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0
	bl sub_8099F7C
	ldr r0, _080995C0  @ gUnknown_08A1B8B8
	ldr r4, _080995C4  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080995C8  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #0
	movs r1, #0x1f
	bl sub_8098570
	adds r0, r6, #0
	bl GetUnitPortraitId
	ldr r3, _080995CC  @ 0xFFFFFEC0
	adds r1, r7, r3
	movs r2, #0x9c
	lsls r2, r2, #2
	mov r3, r8
	str r3, [sp]
	movs r3, #3
	bl PutFaceChibi
	adds r5, #0x80
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r6]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080995D0  @ 0xFFFFFECC
	adds r1, r7, r0
	mov r2, r8
	str r2, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	subs r0, #0xb6
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r7, #0
	subs r0, #0xae
	movs r1, #3
	movs r2, #0x1d
	bl sub_8004B0C
	adds r0, r7, #0
	subs r0, #0xb0
	movs r2, #8
	ldrsb r2, [r6, r2]
	movs r1, #2
	bl DrawDecNumber
	adds r0, r7, #0
	subs r0, #0xaa
	ldrb r2, [r6, #9]
	movs r1, #2
	bl DrawDecNumber
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080995B8: .4byte gUnknown_02013510
_080995BC: .4byte gUnknown_02022EEC
_080995C0: .4byte gUnknown_08A1B8B8
_080995C4: .4byte gGenericBuffer
_080995C8: .4byte gBG1TilemapBuffer
_080995CC: .4byte 0xFFFFFEC0
_080995D0: .4byte 0xFFFFFECC

	THUMB_FUNC_END sub_80994C4

	THUMB_FUNC_START sub_80995D4
sub_80995D4: @ 0x080995D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0809963C  @ gUnknown_02022F06
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl PutImg_PrepPopupWindow
	adds r0, r6, #0
	bl sub_80994C4
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099640
	bl sub_80ACAC8
	b _08099644
	.align 2, 0
_0809963C: .4byte gUnknown_02022F06
_08099640:
	bl sub_80ACAE4
_08099644:
	bl sub_8098BE8
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80995D4

	THUMB_FUNC_START sub_8099654
sub_8099654: @ 0x08099654
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080996A8  @ gUnknown_02022F0E
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8099328
	ldr r0, _080996AC  @ sub_8098BC8
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2e
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowPrepScreenHandCursor
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996A8: .4byte gUnknown_02022F0E
_080996AC: .4byte sub_8098BC8

	THUMB_FUNC_END sub_8099654

	THUMB_FUNC_START sub_80996B0
sub_80996B0: @ 0x080996B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_809A504
	ldr r0, _080996E0  @ gUnknown_02013510
	ldr r1, _080996E4  @ gUnknown_02022EEC
	adds r2, r5, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996E0: .4byte gUnknown_02013510
_080996E4: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_80996B0

	THUMB_FUNC_START sub_80996E8
sub_80996E8: @ 0x080996E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08099704
	b _08099930
_08099704:
	ldr r0, _08099734  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099754
	mov r1, r8
	strb r1, [r4]
	ldr r0, _08099738  @ gGMData
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809973C
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	b _08099A4C
	.align 2, 0
_08099734: .4byte gKeyStatusPtr
_08099738: .4byte gGMData
_0809973C:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099750  @ gUnknown_08A188F8
	b _08099A54
	.align 2, 0
_08099750: .4byte gUnknown_08A188F8
_08099754:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809975E
	b _080998F0
_0809975E:
	mov r0, r8
	cmp r0, #5
	bls _08099766
	b _080998D4
_08099766:
	lsls r0, r0, #2
	ldr r1, _08099770  @ _08099774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08099770: .4byte _08099774
_08099774: @ jump table
	.4byte _0809978C @ case 0
	.4byte _0809979C @ case 1
	.4byte _080997AC @ case 2
	.4byte _080997C8 @ case 3
	.4byte _08099854 @ case 4
	.4byte _08099868 @ case 5
_0809978C:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _08099796
	b _080998D4
_08099796:
	adds r0, r5, #0
	movs r1, #4
	b _080998B4
_0809979C:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _080997A6
	b _080998D4
_080997A6:
	adds r0, r5, #0
	movs r1, #8
	b _080998B4
_080997AC:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl CanUnitPrepScreenUse
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080997C2
	b _080998D4
_080997C2:
	adds r0, r5, #0
	movs r1, #9
	b _080998B4
_080997C8:
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _080997F8
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080997F8
	subs r1, #9
	ldr r2, _080997F4  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8097DA8
	b _08099A90
	.align 2, 0
_080997F4: .4byte 0x0000088B
_080997F8:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	bl sub_809A538
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	ldr r4, _0809984C  @ gUnknown_02022F0E
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8099328
	ldr r5, _08099850  @ gUnknown_02013510
	subs r4, #0x22
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080998B8
	.align 2, 0
_0809984C: .4byte gUnknown_02022F0E
_08099850: .4byte gUnknown_02013510
_08099854:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r0, r5, #0
	movs r1, #0xa
	b _080998B4
_08099868:
	ldr r0, _080998A4  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080998A8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	cmp r0, #0
	ble _080998D4
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080998D4
	adds r0, r5, #0
	movs r1, #0xb
	b _080998B4
	.align 2, 0
_080998A4: .4byte gGMData
_080998A8:
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080998D4
	adds r0, r5, #0
	movs r1, #0xc
_080998B4:
	bl Proc_Goto
_080998B8:
	ldr r0, _080998D0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080998C6
	b _08099A90
_080998C6:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099A90
	.align 2, 0
_080998D0: .4byte gPlaySt
_080998D4:
	ldr r0, _080998EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080998E2
	b _08099A90
_080998E2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099A90
	.align 2, 0
_080998EC: .4byte gPlaySt
_080998F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099948
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl sub_80ACA84
	ldr r0, _0809992C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099920
	movs r0, #0x6b
	bl m4aSongNumStart
_08099920:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08099A90
	.align 2, 0
_0809992C: .4byte gPlaySt
_08099930:
	ldr r0, _0809996C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099948
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_08099948:
	ldr r2, _0809996C  @ gKeyStatusPtr
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x20
	adds r0, r7, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _0809997E
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08099970
	subs r0, r3, #1
	b _0809997C
	.align 2, 0
_0809996C: .4byte gKeyStatusPtr
_08099970:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809997E
	adds r0, r3, #1
_0809997C:
	strb r0, [r4]
_0809997E:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999A8
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _0809999A
	adds r0, r3, #1
	b _080999A6
_0809999A:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999A8
	subs r0, r3, #1
_080999A6:
	strb r0, [r4]
_080999A8:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999CE
	ldrb r3, [r4]
	cmp r3, #1
	bls _080999C0
	subs r0, r3, #2
	b _080999CC
_080999C0:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999CE
	adds r0, r3, #4
_080999CC:
	strb r0, [r4]
_080999CE:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080999F4
	ldrb r3, [r4]
	cmp r3, #3
	bhi _080999E6
	adds r0, r3, #2
	b _080999F2
_080999E6:
	ldrh r1, [r2, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080999F4
	subs r0, r3, #4
_080999F2:
	strb r0, [r4]
_080999F4:
	adds r6, r4, #0
	ldrb r1, [r6]
	cmp r8, r1
	beq _08099A90
	ldr r0, _08099A64  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099A0E
	movs r0, #0x65
	bl m4aSongNumStart
_08099A0E:
	ldrb r1, [r6]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowPrepScreenHandCursor
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08099A90
	ldr r0, _08099A68  @ gGMData
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08099A70
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
_08099A4C:
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099A6C  @ gUnknown_08A18910
_08099A54:
	ldrb r2, [r6]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08099A90
	.align 2, 0
_08099A64: .4byte gPlaySt
_08099A68: .4byte gGMData
_08099A6C: .4byte gUnknown_08A18910
_08099A70:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099A9C  @ gUnknown_08A188F8
	ldrb r2, [r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08099A90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A9C: .4byte gUnknown_08A188F8

	THUMB_FUNC_END sub_80996E8

	THUMB_FUNC_START sub_8099AA0
sub_8099AA0: @ 0x08099AA0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _08099AF0  @ gUnknown_02013510
	ldr r5, _08099AF4  @ gUnknown_02022EEC
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8099F7C
	adds r4, #0x28
	adds r5, #0x1e
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099AF0: .4byte gUnknown_02013510
_08099AF4: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_8099AA0

	THUMB_FUNC_START sub_8099AF8
sub_8099AF8: @ 0x08099AF8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08099C3C  @ gBG0TilemapBuffer
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _08099C40  @ gUnknown_08A1B8B8
	ldr r5, _08099C44  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _08099C48  @ gBG1TilemapBuffer
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _08099C4C  @ gUnknown_08A1B990
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08099C50  @ 0x0000025E
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	mov r1, r8
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	mov r6, r8
	adds r6, #0x2a
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	mov r2, r8
	ldrh r0, [r2, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowPrepScreenHandCursor
	mov r0, r8
	movs r1, #0
	bl sub_809A504
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08099C54  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08099C58  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_8099E98
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _08099C5C  @ sub_8099AA0
	movs r1, #1
	mov r2, r8
	bl StartParallelFiniteLoop
	bl sub_80ACAE4
	bl sub_8098590
	bl EndHelpPromptSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099C3C: .4byte gBG0TilemapBuffer
_08099C40: .4byte gUnknown_08A1B8B8
_08099C44: .4byte gGenericBuffer
_08099C48: .4byte gBG1TilemapBuffer
_08099C4C: .4byte gUnknown_08A1B990
_08099C50: .4byte 0x0000025E
_08099C54: .4byte 0x00000503
_08099C58: .4byte 0x00000502
_08099C5C: .4byte sub_8099AA0

	THUMB_FUNC_END sub_8099AF8

	THUMB_FUNC_START sub_8099C60
sub_8099C60: @ 0x08099C60
	push {lr}
	bl sub_8098BE8
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099C60

	THUMB_FUNC_START sub_8099C70
sub_8099C70: @ 0x08099C70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08099C82
	b _08099D9C
_08099C82:
	ldr r0, _08099C9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099CA0
	adds r0, r6, #0
	bl Proc_Break
	b _08099DA2
	.align 2, 0
_08099C9C: .4byte gKeyStatusPtr
_08099CA0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099D10
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r1, r0, #0
	ldrb r0, [r5]
	ldrb r4, [r4]
	cmp r0, r4
	beq _08099CF8
	cmp r7, #0
	bgt _08099CD8
	cmp r1, #0
	ble _08099CF8
_08099CD8:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099CF4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099CF4: .4byte gPlaySt
_08099CF8:
	ldr r0, _08099D0C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099D0C: .4byte gPlaySt
_08099D10:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099D40
	movs r0, #1
	bl sub_8099F50
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _08099D3C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099D3C: .4byte gPlaySt
_08099D40:
	adds r0, r6, #0
	bl sub_8098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099D9C
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08099DAC  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08099DB0  @ gUnknown_02013538
	ldr r5, _08099DB4  @ gUnknown_02022F0A
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_8099F7C
	subs r4, #0x28
	subs r5, #0x1e
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
_08099D9C:
	adds r0, r6, #0
	bl sub_8098FAC
_08099DA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099DAC: .4byte 0x00000502
_08099DB0: .4byte gUnknown_02013538
_08099DB4: .4byte gUnknown_02022F0A

	THUMB_FUNC_END sub_8099C70

	THUMB_FUNC_START StartPrepItemTradeScreen
StartPrepItemTradeScreen: @ 0x08099DB8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80989BC
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl StartPrepItemTradeScreenProc
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartPrepItemTradeScreen

	THUMB_FUNC_START sub_8099DE8
sub_8099DE8: @ 0x08099DE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemUseScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099DE8

	THUMB_FUNC_START StartPrepItemSupply
StartPrepItemSupply: @ 0x08099E00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemSupplyProc
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartPrepItemSupply

	THUMB_FUNC_START sub_8099E18
sub_8099E18: @ 0x08099E18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartWorldMapSellScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E18

	THUMB_FUNC_START StartPrepItemListScreen
StartPrepItemListScreen: @ 0x08099E30
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemListScreenProc
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartPrepItemListScreen

	THUMB_FUNC_START sub_8099E48
sub_8099E48: @ 0x08099E48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r1, _08099E64  @ gUnknown_08A188E4
	adds r2, r4, #0
	bl StartArmoryScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099E64: .4byte gUnknown_08A188E4

	THUMB_FUNC_END sub_8099E48

	THUMB_FUNC_START sub_8099E68
sub_8099E68: @ 0x08099E68
	push {lr}
	adds r2, r0, #0
	ldr r0, _08099E94  @ gGMData
	ldrb r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08099E8E
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08099E8E
	movs r0, #0
	bl sub_80C409C
_08099E8E:
	pop {r0}
	bx r0
	.align 2, 0
_08099E94: .4byte gGMData

	THUMB_FUNC_END sub_8099E68

	THUMB_FUNC_START sub_8099E98
sub_8099E98: @ 0x08099E98
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r0, _08099EF8  @ ProcScr_PrepItemScreen
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x44
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _08099EFC
	cmp r0, #0
	beq _08099ED6
	adds r0, r4, #0
	bl EndFaceById
_08099ED6:
	cmp r6, #0
	beq _08099F18
	adds r0, r6, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, r9
	str r0, [sp]
	adds r0, r4, #0
	bl StartFace2
	b _08099F18
	.align 2, 0
_08099EF8: .4byte ProcScr_PrepItemScreen
_08099EFC:
	cmp r6, #0
	beq _08099F18
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8006618
	adds r0, r4, #0
	mov r1, r9
	bl SetFaceDisplayBitsById
_08099F18:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	mov r1, r9
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E98

	THUMB_FUNC_START sub_8099F50
sub_8099F50: @ 0x08099F50
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_8099E98
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099F50

	THUMB_FUNC_START StartPrepItemScreen
StartPrepItemScreen: @ 0x08099F68
	push {lr}
	adds r1, r0, #0
	ldr r0, _08099F78  @ ProcScr_PrepItemScreen
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_08099F78: .4byte ProcScr_PrepItemScreen

	THUMB_FUNC_END StartPrepItemScreen

	THUMB_FUNC_START sub_8099F7C
sub_8099F7C: @ 0x08099F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08099FAE
	bl ResetIconGraphics
_08099FAE:
	mov r0, r8
	cmp r0, #0
	beq _0809A07C
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov r9, r1
	cmp r9, r0
	bge _0809A07C
	adds r0, r4, #0
	adds r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #4
	str r1, [sp, #0xc]
	mov sl, r4
_08099FCE:
	mov r1, r9
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08099FEE
	mov r0, r8
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	b _08099FF6
_08099FEE:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
_08099FF6:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A000
	movs r7, #1
_0809A000:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _0809A02E
	adds r0, r6, #0
	bl Text_Clear
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColorId
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
_0809A02E:
	adds r0, r5, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl Text_Draw
	movs r4, #1
	cmp r7, #0
	bne _0809A050
	movs r4, #2
_0809A050:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl DrawDecNumber
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add r9, r1
	ldr r0, [sp, #4]
	cmp r9, r0
	blt _08099FCE
_0809A07C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099F7C

	THUMB_FUNC_START sub_809A08C
sub_809A08C: @ 0x0809A08C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r1, r0, #4
	ldrh r0, [r5, #0x34]
	subs r0, r4, r0
	cmp r0, #0x20
	ble _0809A0C6
	cmp r4, r1
	bne _0809A0C0
	adds r0, r4, #0
	subs r0, #0x30
	b _0809A0D6
_0809A0C0:
	adds r0, r4, #0
	subs r0, #0x20
	b _0809A0D6
_0809A0C6:
	cmp r0, #0xf
	bgt _0809A0D8
	cmp r4, #0
	bne _0809A0D2
	strh r4, [r5, #0x34]
	b _0809A0D8
_0809A0D2:
	adds r0, r6, #0
	subs r0, #0x10
_0809A0D6:
	strh r0, [r5, #0x34]
_0809A0D8:
	ldr r1, _0809A110  @ 0x0000FFD8
	ldrh r2, [r5, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r4, [r5, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A110: .4byte 0x0000FFD8

	THUMB_FUNC_END sub_809A08C

	THUMB_FUNC_START sub_809A114
sub_809A114: @ 0x0809A114
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809A1C0  @ gUnknown_02013498
	adds r4, r0, r1
	ldr r0, _0809A1C4  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809A154
	bl sub_80C4070
	movs r1, #1
	str r1, [sp, #4]
	cmp r0, #2
	beq _0809A158
_0809A154:
	movs r0, #0
	str r0, [sp, #4]
_0809A158:
	movs r7, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
_0809A160:
	mov r1, r9
	cmp r1, #0
	bne _0809A16C
	adds r0, r4, #0
	bl Text_Clear
_0809A16C:
	ldr r0, [sp]
	adds r5, r0, r7
	bl PrepGetUnitAmount
	cmp r5, r0
	bge _0809A1FA
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r6, r1, #1
	movs r0, #0x1f
	ands r6, r0
	mov r0, r9
	cmp r0, #0
	bne _0809A1EA
	adds r0, r5, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetXCursor
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _0809A1D2
	adds r0, r5, #0
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A1C8
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	b _0809A1DA
	.align 2, 0
_0809A1C0: .4byte gUnknown_02013498
_0809A1C4: .4byte gGMData
_0809A1C8:
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColorId
	b _0809A1DA
_0809A1D2:
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
_0809A1DA:
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
_0809A1EA:
	lsls r1, r6, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809A218  @ gBG2TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
_0809A1FA:
	adds r4, #8
	adds r7, #1
	cmp r7, #2
	ble _0809A160
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
_0809A218: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_809A114

	THUMB_FUNC_START sub_809A21C
sub_809A21C: @ 0x0809A21C
	push {lr}
	cmp r0, #0x60
	bhi _0809A22A
	cmp r1, #0x1f
	ble _0809A22A
	movs r0, #1
	b _0809A22C
_0809A22A:
	movs r0, #0
_0809A22C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809A21C

	THUMB_FUNC_START sub_809A230
sub_809A230: @ 0x0809A230
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r1, [r0, #4]
	ldrb r4, [r1, #4]
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	movs r1, #0xf0
	lsls r1, r1, #8
	cmp r0, #0
	beq _0809A254
	movs r1, #0xc0
	lsls r1, r1, #8
_0809A254:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r0, #0
	adds r3, r1, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r4, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutUnitSpriteForClassId
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A230

	THUMB_FUNC_START sub_809A274
sub_809A274: @ 0x0809A274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _0809A308
_0809A27C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x34]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _0809A306
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809A2B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A306
_0809A2B8:
	ldr r0, _0809A2E8  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809A2EC
	bl sub_80C4070
	cmp r0, #2
	bne _0809A2EC
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #4
	movs r3, #0xff
	ands r2, r3
	bl sub_809A230
	b _0809A306
	.align 2, 0
_0809A2E8: .4byte gGMData
_0809A2EC:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutUnitSprite
_0809A306:
	adds r6, #1
_0809A308:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0809A27C
	bl SyncUnitSpriteSheet
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A274

	THUMB_FUNC_START sub_809A31C
sub_809A31C: @ 0x0809A31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	cmp r2, #0
	bgt _0809A338
	b _0809A4E6
_0809A338:
	cmp r3, #0
	bgt _0809A33E
	b _0809A4E6
_0809A33E:
	ldr r4, _0809A4F8  @ gObject_8x8
	str r7, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, [sp, #8]
	lsls r0, r0, #3
	mov r9, r0
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r5, sl
	add r5, r8
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #1
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #0x10]
	cmp r5, r3
	bge _0809A3D6
	ldr r6, _0809A4FC  @ gObject_16x8
	ldr r4, [sp, #4]
	adds r4, #8
_0809A3A8:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809A3A8
_0809A3D6:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809A412
	ldr r6, _0809A4F8  @ gObject_8x8
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	subs r5, r1, r5
_0809A3E6:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809A3E6
_0809A412:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _0809A44E
	ldr r5, _0809A4F8  @ gObject_8x8
	mov r4, sl
	adds r4, #8
	adds r6, r0, #0
	subs r6, #1
_0809A422:
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #9
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0809A422
_0809A44E:
	movs r6, #1
	ldr r1, [sp, #0xc]
	cmp r6, r1
	bge _0809A4E6
	ldr r3, [sp, #8]
	subs r3, #3
	mov r9, r3
	adds r7, #5
	mov r8, r7
_0809A460:
	movs r5, #1
	adds r0, r6, #1
	str r0, [sp, #0x14]
	cmp r5, r9
	bge _0809A48A
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_0809A470:
	mov r1, r8
	str r1, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809A500  @ gObject_32x8
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, r9
	blt _0809A470
_0809A48A:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _0809A4B4
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_0809A498:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809A4FC  @ gObject_16x8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809A498
_0809A4B4:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809A4DE
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	lsls r6, r6, #3
	subs r5, r1, r5
_0809A4C4:
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _0809A4F8  @ gObject_8x8
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809A4C4
_0809A4DE:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _0809A460
_0809A4E6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4F8: .4byte gObject_8x8
_0809A4FC: .4byte gObject_16x8
_0809A500: .4byte gObject_32x8

	THUMB_FUNC_END sub_809A31C

	THUMB_FUNC_START sub_809A504
sub_809A504: @ 0x0809A504
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x34]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _0809A530
	lsls r6, r1, #0x18
_0809A518:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_809A114
	adds r4, #1
	ldrh r0, [r5, #0x34]
	lsrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809A518
_0809A530:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A504

	THUMB_FUNC_START sub_809A538
sub_809A538: @ 0x0809A538
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _0809A56E
	cmp r6, #0x63
	bgt _0809A56E
_0809A554:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _0809A56E
	adds r0, r4, r6
	cmp r0, #0x63
	ble _0809A554
_0809A56E:
	cmp r4, #0
	bgt _0809A576
	movs r0, #0
	b _0809A578
_0809A576:
	movs r0, #1
_0809A578:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809A538

.align 2, 0
